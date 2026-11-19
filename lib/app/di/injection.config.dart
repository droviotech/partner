// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:ui' as _i264;

import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mobile_scanner/mobile_scanner.dart' as _i625;

import '../../contracts/auth/auth_api.dart' as _i1044;
import '../../contracts/auth/auth_repository.dart' as _i112;
import '../../contracts/auth/http_auth_repository.dart' as _i931;
import '../../core/api/api_client.dart' as _i430;
import '../../core/api/api_config.dart' as _i629;
import '../../core/api/api_module.dart' as _i254;
import '../../core/auth/auth_module.dart' as _i335;
import '../../core/auth/auth_token_provider.dart' as _i17;
import '../../core/auth/session_events.dart' as _i323;
import '../../core/auth/session_store.dart' as _i283;
import '../../core/auth/token_provider.dart' as _i67;
import '../../core/database/app_database.dart' as _i50;
import '../../core/database/command_queue_dao.dart' as _i424;
import '../../core/database/database_module.dart' as _i827;
import '../../core/database/preferences_store.dart' as _i307;
import '../../core/design/app_theme.dart' as _i36;
import '../../core/i18n/app_locale_provider.dart' as _i512;
import '../../core/i18n/locale_provider.dart' as _i696;
import '../../core/native/firebase_push_gateway.dart' as _i317;
import '../../core/native/push_gateway.dart' as _i50;
import '../../core/native/push_token_reporter.dart' as _i1064;
import '../../core/native/scan_gateway.dart' as _i831;
import '../../features/auth/application/auth_cubit.dart' as _i877;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final authModule = _$AuthModule();
  final databaseModule = _$DatabaseModule();
  final apiModule = _$ApiModule();
  gh.singleton<_i558.FlutterSecureStorage>(
    () => authModule.provideFlutterSecureStorage(),
  );
  gh.singleton<_i323.SessionEvents>(() => _i323.SessionEvents());
  gh.singleton<_i36.AppTheme>(() => _i36.AppTheme());
  gh.lazySingleton<_i50.AppDatabase>(() => databaseModule.provideAppDatabase());
  gh.lazySingleton<_i50.PushGateway>(() => _i317.FirebasePushGateway());
  gh.lazySingleton<_i424.CommandQueueDao>(
    () => _i424.CommandQueueDao(gh<_i50.AppDatabase>()),
  );
  gh.lazySingleton<_i307.PreferencesStore>(
    () => _i307.PreferencesStore(gh<_i50.AppDatabase>()),
  );
  gh.lazySingleton<_i283.SessionStore>(
    () => _i283.SecureSessionStore(storage: gh<_i558.FlutterSecureStorage>()),
  );
  gh.lazySingleton<_i17.AuthTokenProvider>(
    () => _i67.SecureTokenProvider(gh<_i283.SessionStore>()),
  );
  gh.lazySingleton<_i831.ScanGateway>(
    () => _i831.MobileScanGateway(
      controller: gh<_i625.MobileScannerController>(),
    ),
  );
  gh.lazySingleton<_i696.LocaleProvider>(
    () => _i512.AppLocaleProvider(
      preferencesStore: gh<_i307.PreferencesStore>(),
      dispatcher: gh<_i264.PlatformDispatcher>(),
    ),
  );
  gh.factory<_i361.Dio>(
    () => apiModule.provideDio(
      gh<_i629.ApiConfig>(),
      gh<_i17.AuthTokenProvider>(),
      gh<_i323.SessionEvents>(),
      gh<_i696.LocaleProvider>(),
    ),
    instanceName: 'rawDio',
  );
  gh.singleton<_i430.ApiClient>(
    () => _i430.ApiClient(
      config: gh<_i629.ApiConfig>(),
      dio: gh<_i361.Dio>(instanceName: 'rawDio'),
    ),
  );
  gh.singleton<_i1044.AuthApi>(
    () => _i1044.AuthApi(client: gh<_i430.ApiClient>()),
  );
  gh.singleton<_i1064.PushTokenReporter>(
    () => _i1064.PushTokenReporter(
      gateway: gh<_i50.PushGateway>(),
      client: gh<_i430.ApiClient>(),
    ),
  );
  gh.lazySingleton<_i112.AuthRepository>(
    () => _i931.HttpAuthRepository(
      authApi: gh<_i1044.AuthApi>(),
      sessionStore: gh<_i283.SessionStore>(),
    ),
  );
  gh.singleton<_i877.AuthCubit>(
    () => _i877.AuthCubit(
      tokenProvider: gh<_i17.AuthTokenProvider>(),
      repository: gh<_i112.AuthRepository>(),
      sessionEvents: gh<_i323.SessionEvents>(),
    ),
  );
  return getIt;
}

class _$AuthModule extends _i335.AuthModule {}

class _$DatabaseModule extends _i827.DatabaseModule {}

class _$ApiModule extends _i254.ApiModule {}
