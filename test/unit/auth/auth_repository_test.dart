import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:partner/core/api/api_client.dart';
import 'package:partner/core/api/api_config.dart';
import 'package:partner/core/auth/session_store.dart';
import 'package:partner/contracts/auth/auth_api.dart';
import 'package:partner/contracts/auth/http_auth_repository.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late HttpAuthRepository repository;

  setUp(() {
    FlutterSecureStorage.setMockInitialValues({});
    dio = Dio(BaseOptions());
    adapter = DioAdapter(dio: dio);
    final client = ApiClient(
      config: const ApiConfig(
        baseUrl: 'https://dev.drovio.ai/api',
        projectPrefix: '/cg/',
      ),
      dio: dio,
    );
    repository = HttpAuthRepository(
      authApi: AuthApi(client: client),
      sessionStore: SecureSessionStore(storage: const FlutterSecureStorage()),
    );
  });

  test('登录成功保存 token 并返回 profile', () async {
    adapter.onPost(
      'https://dev.drovio.ai/api/cg/auth/login',
      data: Matchers.any,
      (server) => server.reply(200, {'token': 't1', 'operator_id': 'op-1'}),
    );
    adapter.onGet(
      'https://dev.drovio.ai/api/cg/auth/me',
      (server) => server.reply(200, {
        'id': 'op-1',
        'name': '张三',
        'roles': ['warehouse'],
      }),
    );

    final profile = await repository.login(username: 'u', password: 'p');

    expect(profile.name, '张三');
    expect(await repository.accessToken(), 't1');
  });
}
