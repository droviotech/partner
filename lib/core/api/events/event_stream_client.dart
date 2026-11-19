import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../../observability/log.dart';

class SseEvent {
  const SseEvent({required this.id, required this.event, required this.data});

  final String? id;
  final String event;
  final String data;
}

class EventStreamClient {
  EventStreamClient({HttpClient? httpClient})
    : _httpClient = httpClient ?? HttpClient();

  final HttpClient _httpClient;

  /// 连接 SSE 端点；断线按指数退避自动重连并携带 Last-Event-ID。
  /// 服务端每 15 秒 `: ping` 保活，客户端跳过注释行即可维持连接。
  Stream<SseEvent> connect(
    String url, {
    Map<String, String>? headers,
    String? lastEventId,
    void Function(Object error, StackTrace stackTrace)? onError,
  }) async* {
    var cursor = lastEventId;
    var retryDelay = const Duration(seconds: 1);

    while (true) {
      try {
        final request = await _httpClient.getUrl(Uri.parse(url));
        headers?.forEach((key, value) => request.headers.set(key, value));
        if (cursor != null && cursor.isNotEmpty) {
          request.headers.set('Last-Event-ID', cursor);
        }
        final response = await request.close();
        if (response.statusCode != 200) {
          throw HttpException('SSE status ${response.statusCode}');
        }
        retryDelay = const Duration(seconds: 1);

        final lines = response
            .transform(utf8.decoder)
            .transform(const LineSplitter());
        String? id;
        String? event = 'message';
        final buffer = <String>[];

        await for (final line in lines) {
          if (line.startsWith(':')) continue; // 注释行 / ping
          if (line.isEmpty) {
            if (buffer.isNotEmpty) {
              yield SseEvent(
                id: id,
                event: event ?? 'message',
                data: buffer.join('\n'),
              );
              cursor = id ?? cursor;
              buffer.clear();
              id = null;
              event = 'message';
            }
            continue;
          }
          if (line.startsWith('id:')) {
            id = line.substring(3).trim();
          } else if (line.startsWith('event:')) {
            event = line.substring(6).trim();
          } else if (line.startsWith('data:')) {
            buffer.add(line.substring(5).trimLeft());
          }
        }
      } catch (e, s) {
        logWarning('SSE 断开，准备重连: $e');
        onError?.call(e, s);
        await Future<void>.delayed(retryDelay);
        if (retryDelay < const Duration(seconds: 30)) {
          retryDelay = retryDelay * 2;
        }
      }
    }
  }
}
