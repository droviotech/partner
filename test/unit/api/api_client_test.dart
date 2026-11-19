import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:partner/core/api/api_client.dart';
import 'package:partner/core/api/api_config.dart';
import 'package:partner/core/api/pagination.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late ApiClient client;

  setUp(() {
    dio = Dio(BaseOptions());
    adapter = DioAdapter(dio: dio);
    client = ApiClient(
      config: const ApiConfig(
        baseUrl: 'https://dev.drovio.ai/api',
        projectPrefix: '/h/',
      ),
      dio: dio,
    );
  });

  test('GET 拼接前缀并解析 Map', () async {
    adapter.onGet(
      'https://dev.drovio.ai/api/h/health',
      (server) => server.reply(200, {'ok': true}),
    );
    final result = await client.get<Map<String, dynamic>>('health');
    expect(result, {'ok': true});
  });

  test('POST 携带 JSON body', () async {
    adapter.onPost(
      'https://dev.drovio.ai/api/h/auth/login',
      (server) => server.reply(200, {'token': 't1'}),
      data: {'username': 'u', 'password': 'p'},
    );
    final result = await client.post<Map<String, dynamic>>(
      'auth/login',
      body: {'username': 'u', 'password': 'p'},
    );
    expect(result['token'], 't1');
  });

  test('分页查询参数与 PageResult 解码', () async {
    adapter.onGet(
      'https://dev.drovio.ai/api/h/inventory?page=2&page_size=20',
      (server) => server.reply(200, {
        'items': [
          {'id': 1},
        ],
        'total': 35,
      }),
    );
    final result = await client.get<PageResult<Map<String, dynamic>>>(
      'inventory',
      query: const PageRequest(page: 2).toQueryParameters(),
      decode: (json) => PageResult.fromJson(
        json as Map<String, dynamic>,
        (item) => item as Map<String, dynamic>,
      ),
    );
    expect(result.total, 35);
    expect(result.items, hasLength(1));
  });
}
