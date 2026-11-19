import 'package:dio/dio.dart';
import '../../auth/auth_token_provider.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  AuthInterceptor({required AuthTokenProvider tokenProvider})
    : _tokenProvider = tokenProvider,
      super();

  final AuthTokenProvider _tokenProvider;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenProvider.accessToken();
    if (token != null &&
        token.isNotEmpty &&
        !options.headers.containsKey('Authorization')) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
