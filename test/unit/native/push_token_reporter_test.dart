import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:partner/core/api/api_client.dart';
import 'package:partner/core/api/api_config.dart';
import 'package:partner/core/native/push_gateway.dart';
import 'package:partner/core/native/push_token_reporter.dart';

class FakePushGateway implements PushGateway {
  FakePushGateway(this._token);
  final String? _token;

  @override
  Future<void> init() async {}

  @override
  Future<String?> get token async => _token;

  @override
  Stream<dynamic> get onMessage => Stream.empty();

  @override
  Future<void> requestPermission() async {}
}

void main() {
  test('上报设备 token', () async {
    final dio = Dio(BaseOptions());
    final adapter = DioAdapter(dio: dio);
    adapter.onPost(
      'https://dev.drovio.ai/api/partner/devices/push-token',
      data: Matchers.any,
      (server) {
        server.replyCallback(200, (options) {
          expect(options.data, {'token': 'fcm-token-1'});
          return {'ok': true};
        });
      },
    );
    final client = ApiClient(
      config: const ApiConfig(
        baseUrl: 'https://dev.drovio.ai/api',
        projectPrefix: '/partner/',
      ),
      dio: dio,
    );
    final reporter = PushTokenReporter(
      gateway: FakePushGateway('fcm-token-1'),
      client: client,
    );
    await reporter.report();
  });

  test('无 token 不上报', () async {
    final dio = Dio(BaseOptions());
    final client = ApiClient(
      config: const ApiConfig(
        baseUrl: 'https://dev.drovio.ai/api',
        projectPrefix: '/partner/',
      ),
      dio: dio,
    );
    final reporter = PushTokenReporter(
      gateway: FakePushGateway(null),
      client: client,
    );
    await reporter.report();
  });
}
