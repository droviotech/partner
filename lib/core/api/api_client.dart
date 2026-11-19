import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'api_config.dart';
import 'api_exception.dart';
import 'api_response.dart';

@singleton
class ApiClient {
  ApiClient({required ApiConfig config, @Named('rawDio') required Dio dio})
    : _config = config,
      _dio = dio;

  final ApiConfig _config;
  final Dio _dio;

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? query,
    JsonDecoder<T>? decode,
  }) => _request<T>('GET', path, query: query, decode: decode);

  Future<T> post<T>(
    String path, {
    Object? body,
    Map<String, dynamic>? query,
    JsonDecoder<T>? decode,
  }) => _request<T>('POST', path, body: body, query: query, decode: decode);

  Future<T> put<T>(
    String path, {
    Object? body,
    Map<String, dynamic>? query,
    JsonDecoder<T>? decode,
  }) => _request<T>('PUT', path, body: body, query: query, decode: decode);

  Future<T> patch<T>(
    String path, {
    Object? body,
    Map<String, dynamic>? query,
    JsonDecoder<T>? decode,
  }) => _request<T>('PATCH', path, body: body, query: query, decode: decode);

  Future<T> delete<T>(
    String path, {
    Map<String, dynamic>? query,
    JsonDecoder<T>? decode,
  }) => _request<T>('DELETE', path, query: query, decode: decode);

  Future<T> _request<T>(
    String method,
    String path, {
    Object? body,
    Map<String, dynamic>? query,
    JsonDecoder<T>? decode,
  }) async {
    final queryParameters = query?.map(
      (key, value) => MapEntry(key, value.toString()),
    );
    final uri = Uri.parse(
      _config.resolve(path),
    ).replace(queryParameters: queryParameters);
    final Response<dynamic> response;
    try {
      switch (method) {
        case 'GET':
          response = await _dio.getUri<dynamic>(uri);
          break;
        case 'POST':
          response = await _dio.postUri<dynamic>(uri, data: body);
          break;
        case 'PUT':
          response = await _dio.putUri<dynamic>(uri, data: body);
          break;
        case 'PATCH':
          response = await _dio.patchUri<dynamic>(uri, data: body);
          break;
        case 'DELETE':
          response = await _dio.deleteUri<dynamic>(uri);
          break;
        default:
          throw UnsupportedError('Unsupported method: $method');
      }
    } on DioException catch (e) {
      final apiError = e.error;
      if (apiError is ApiException) throw apiError;
      throw ApiException(type: ApiErrorType.unknown, message: e.message);
    }
    return ApiResponse.decode<T>(response.data, decode);
  }
}
