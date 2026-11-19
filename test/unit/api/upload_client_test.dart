import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:partner/core/api/upload/upload_client.dart';

void main() {
  test('分片上传发送 Content-Range 与 X-Content-SHA256', () async {
    final dir = Directory.systemTemp.createTempSync('upload_test');
    addTearDown(() => dir.deleteSync(recursive: true));
    final file = File('${dir.path}/data.bin')
      ..writeAsBytesSync(List<int>.generate(5120, (i) => i % 256));

    final dio = Dio(BaseOptions());
    final adapter = DioAdapter(dio: dio);
    adapter.onPut(
      'https://dev.drovio.ai/api/partner/files',
      data: Matchers.any,
      (server) {
        server.replyCallback(200, (options) {
          expect(options.headers['Content-Range'], startsWith('bytes '));
          expect(options.headers['X-Content-SHA256'], 'sha256-abc');
          return {'done': true};
        });
      },
    );

    final client = UploadClient(dio: dio);
    final task = await client.uploadChunked(
      url: 'https://dev.drovio.ai/api/partner/files',
      filePath: file.path,
      chunkSizeBytes: 2048,
      sha256: 'sha256-abc',
    );

    expect(task.totalBytes, 5120);
    expect(task.uploadedBytes, 5120);
    expect(task.progress, 1.0);
  });

  test('multipart 上传进度回调', () async {
    final dir = Directory.systemTemp.createTempSync('upload_test');
    addTearDown(() => dir.deleteSync(recursive: true));
    final file = File('${dir.path}/photo.jpg')
      ..writeAsBytesSync(List.filled(1024, 7));

    final dio = Dio(BaseOptions());
    final adapter = DioAdapter(dio: dio);
    adapter.onPost(
      'https://dev.drovio.ai/api/partner/files/photo',
      data: Matchers.any,
      (server) => server.reply(200, {'ok': true}),
    );

    final client = UploadClient(dio: dio);
    var lastProgress = -1.0;
    await client.uploadMultipart(
      url: 'https://dev.drovio.ai/api/partner/files/photo',
      filePath: file.path,
      fieldName: 'file',
      onProgress: (p) => lastProgress = p,
    );
    expect(lastProgress, 1.0);
  });
}
