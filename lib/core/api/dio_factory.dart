import 'package:dio/dio.dart';
import '../auth/auth_token_provider.dart';
import '../auth/session_events.dart';
import '../i18n/locale_provider.dart';
import 'api_config.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/language_interceptor.dart';
import 'interceptors/trace_interceptor.dart';

Dio createDio({
  required ApiConfig config,
  required AuthTokenProvider tokenProvider,
  required SessionEvents sessionEvents,
  required LocaleProvider localeProvider,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: '',
      connectTimeout: config.connectTimeout,
      receiveTimeout: config.receiveTimeout,
      headers: const {'Accept': 'application/json'},
    ),
  );
  dio.interceptors.addAll([
    TraceInterceptor(),
    AuthInterceptor(tokenProvider: tokenProvider),
    LanguageInterceptor(localeProvider: localeProvider),
    ErrorInterceptor(sessionEvents: sessionEvents),
  ]);
  return dio;
}
