import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../auth/auth_token_provider.dart';
import '../auth/session_events.dart';
import '../i18n/locale_provider.dart';
import 'api_config.dart';
import 'dio_factory.dart';

@module
abstract class ApiModule {
  @Named('rawDio')
  Dio provideDio(
    ApiConfig config,
    AuthTokenProvider tokenProvider,
    SessionEvents sessionEvents,
    LocaleProvider localeProvider,
  ) => createDio(
    config: config,
    tokenProvider: tokenProvider,
    sessionEvents: sessionEvents,
    localeProvider: localeProvider,
  );
}
