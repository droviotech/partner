import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:partner/core/api/api_client.dart';
import 'package:partner/core/api/api_config.dart';
import 'package:partner/core/api/api_exception.dart';
import 'package:partner/core/api/dio_factory.dart';
import 'package:partner/core/auth/auth_token_provider.dart';
import 'package:partner/core/auth/session_events.dart';
import 'package:partner/core/i18n/locale_provider.dart';

class FakeTokenProvider implements AuthTokenProvider {
  FakeTokenProvider([this.token]);
  String? token;

  @override
  Future<String?> accessToken() async => token;

  @override
  Future<void> clear() async => token = null;
}

class FakeLocaleProvider extends FixedLocaleProvider {
  FakeLocaleProvider() : super(const Locale('th'));
}

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late SessionEvents sessionEvents;
  late ApiClient client;
  late FakeTokenProvider tokenProvider;

  setUp(() {
    sessionEvents = SessionEvents();
    tokenProvider = FakeTokenProvider('tok-123');
    dio = createDio(
      config: const ApiConfig(
        baseUrl: 'https://dev.drovio.ai/api',
        projectPrefix: '/partner/',
      ),
      tokenProvider: tokenProvider,
      sessionEvents: sessionEvents,
      localeProvider: FakeLocaleProvider(),
    );
    adapter = DioAdapter(dio: dio);
    client = ApiClient(
      config: const ApiConfig(
        baseUrl: 'https://dev.drovio.ai/api',
        projectPrefix: '/partner/',
      ),
      dio: dio,
    );
  });

  test('请求携带 Bearer token 与 Accept-Language', () async {
    adapter.onGet('https://dev.drovio.ai/api/partner/health', (server) {
      server.replyCallback(200, (options) {
        expect(options.headers['Authorization'], 'Bearer tok-123');
        expect(options.headers['Accept-Language'], 'th');
        return {'ok': true};
      });
    });
    await client.get<Map<String, dynamic>>('health');
  });

  test('请求携带 X-Request-ID', () async {
    adapter.onGet('https://dev.drovio.ai/api/partner/health', (server) {
      server.replyCallback(200, (options) {
        final requestId = options.headers['X-Request-ID'];
        expect(requestId, isNotNull);
        expect(requestId, isNotEmpty);
        return {'ok': true};
      });
    });
    await client.get<Map<String, dynamic>>('health');
  });

  test('401 触发会话失效事件', () async {
    var expired = false;
    sessionEvents.expired.listen((_) => expired = true);

    adapter.onGet(
      'https://dev.drovio.ai/api/partner/health',
      (server) => server.reply(401, {'code': 'UNAUTHORIZED', 'message': '未登录'}),
    );

    await expectLater(
      client.get<Map<String, dynamic>>('health'),
      throwsA(
        isA<ApiException>().having(
          (e) => e.type,
          'type',
          ApiErrorType.unauthorized,
        ),
      ),
    );
    expect(expired, isTrue);
  });

  test('业务错误体映射 code/message/details', () async {
    adapter.onGet(
      'https://dev.drovio.ai/api/partner/health',
      (server) => server.reply(422, {
        'code': 'VALIDATION_ERROR',
        'message': '参数错误',
        'details': {'field': 'page_size'},
      }),
    );

    await expectLater(
      client.get<Map<String, dynamic>>('health'),
      throwsA(
        isA<ApiException>()
            .having((e) => e.code, 'code', 'VALIDATION_ERROR')
            .having((e) => e.details, 'details', {'field': 'page_size'}),
      ),
    );
  });

  test('网络错误映射 network', () async {
    adapter.onGet(
      'https://dev.drovio.ai/api/partner/health',
      (server) => server.throws(
        404,
        DioException(
          requestOptions: RequestOptions(
            path: 'https://dev.drovio.ai/api/partner/health',
          ),
          type: DioExceptionType.connectionError,
        ),
      ),
    );

    await expectLater(
      client.get<Map<String, dynamic>>('health'),
      throwsA(
        isA<ApiException>().having((e) => e.type, 'type', ApiErrorType.network),
      ),
    );
  });
}
