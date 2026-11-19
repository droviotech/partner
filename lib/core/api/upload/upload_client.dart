import 'dart:io';
import 'package:dio/dio.dart';

enum UploadMode { multipart, chunked }

class UploadTask {
  UploadTask({
    required this.id,
    required this.mode,
    required this.chunkSizeBytes,
    required this.totalBytes,
  });

  final String id;
  final UploadMode mode;
  final int chunkSizeBytes;
  final int totalBytes;

  int uploadedBytes = 0;

  double get progress => totalBytes == 0 ? 1 : uploadedBytes / totalBytes;
}

class UploadClient {
  UploadClient({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<UploadTask> uploadMultipart({
    required String url,
    required String filePath,
    required String fieldName,
    Map<String, dynamic>? extraFields,
    void Function(double progress)? onProgress,
  }) async {
    final file = File(filePath);
    final task = UploadTask(
      id: 'mp-${DateTime.now().millisecondsSinceEpoch}',
      mode: UploadMode.multipart,
      chunkSizeBytes: 0,
      totalBytes: await file.length(),
    );
    final form = FormData.fromMap({
      ...?extraFields,
      fieldName: await MultipartFile.fromFile(filePath),
    });
    await _dio.post<dynamic>(
      url,
      data: form,
      onSendProgress: (sent, total) {
        task.uploadedBytes = sent;
        onProgress?.call(total == 0 ? 0 : sent / total);
      },
    );
    task.uploadedBytes = task.totalBytes;
    onProgress?.call(1);
    return task;
  }

  /// 分片上传：逐片 PUT，携带 Content-Range 与 X-Content-SHA256。
  /// [offsetBytes] 用于断点续传（跳过已上传部分）。
  Future<UploadTask> uploadChunked({
    required String url,
    required String filePath,
    required int chunkSizeBytes,
    required String sha256,
    int offsetBytes = 0,
    void Function(double progress)? onProgress,
    void Function(int chunkIndex)? onChunkCompleted,
  }) async {
    final file = File(filePath);
    final totalBytes = await file.length();
    final task = UploadTask(
      id: 'ck-${DateTime.now().millisecondsSinceEpoch}',
      mode: UploadMode.chunked,
      chunkSizeBytes: chunkSizeBytes,
      totalBytes: totalBytes,
    );
    final raf = file.openSync();
    try {
      var offset = offsetBytes;
      var index = offset ~/ chunkSizeBytes;
      while (offset < totalBytes) {
        final length = (totalBytes - offset) < chunkSizeBytes
            ? totalBytes - offset
            : chunkSizeBytes;
        final bytes = raf.readSync(length);
        await _dio.put<dynamic>(
          url,
          data: Stream.fromIterable([bytes]),
          options: Options(
            headers: {
              'Content-Range':
                  'bytes $offset-${offset + length - 1}/$totalBytes',
              'X-Content-SHA256': sha256,
            },
          ),
        );
        offset += length;
        task.uploadedBytes = offset;
        onChunkCompleted?.call(index);
        onProgress?.call(task.progress);
        index += 1;
      }
    } finally {
      raf.closeSync();
    }
    return task;
  }
}
