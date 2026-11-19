import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:partner/core/api/events/event_stream_client.dart';

void main() {
  test('SSE 解析 id/event/data 并忽略 ping', () async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() => server.close(force: true));

    server.listen((request) async {
      request.response
        ..statusCode = 200
        ..headers.contentType = ContentType('text', 'event-stream')
        ..write(
          'id: 1\nevent: order\ndata: {"id":1}\n\n'
          ': ping\n\n'
          'id: 2\nevent: order\ndata: {"id":2}\n\n',
        );
      await request.response.close();
      await server.close(force: true); // 只服务一次，避免重连重复数据
    });

    final client = EventStreamClient();
    final events = await client
        .connect('http://${server.address.address}:${server.port}/events')
        .take(2)
        .toList()
        .timeout(const Duration(seconds: 5));

    expect(events, hasLength(2));
    expect(events[0].id, '1');
    expect(events[0].event, 'order');
    expect(events[0].data, '{"id":1}');
    expect(events[1].id, '2');
  });

  test('断线重连携带 Last-Event-ID', () async {
    var firstRequest = true;
    String? lastEventId;
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() => server.close(force: true));

    server.listen((request) async {
      if (firstRequest) {
        firstRequest = false;
        await request.response.close(); // 立即断开
        return;
      }
      lastEventId = request.headers.value('last-event-id');
      request.response
        ..statusCode = 200
        ..write('id: 5\nevent: order\ndata: {}\n\n');
      await request.response.close();
      await server.close(force: true); // 记录后关闭，避免后续重连改写 lastEventId
    });

    final client = EventStreamClient();
    final event = await client
        .connect(
          'http://${server.address.address}:${server.port}/events',
          lastEventId: '3',
        )
        .firstWhere((e) => e.id == '5')
        .timeout(const Duration(seconds: 5));

    expect(lastEventId, '3');
    expect(event.id, '5');
  });
}
