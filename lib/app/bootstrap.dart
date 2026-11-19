import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:partner/app/config/app_config.dart';
import 'package:partner/app/router/app_router.dart';
import 'package:partner/core/api/api_config.dart';
import 'package:partner/core/i18n/app_locale_provider.dart';
import 'package:partner/core/i18n/locale_provider.dart';
import 'package:partner/core/native/push_gateway.dart';
import 'package:partner/core/native/push_token_reporter.dart';
import 'package:partner/features/auth/application/auth_cubit.dart';
import 'di/get_it.dart';
import 'di/injection.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appConfig = AppConfig.fromDartDefines();
  getIt.registerSingleton<AppConfig>(appConfig);
  getIt.registerSingleton<ApiConfig>(appConfig.apiConfig);
  getIt.registerSingleton<PlatformDispatcher>(PlatformDispatcher.instance);
  configureDependencies();
  await (getIt<LocaleProvider>() as AppLocaleProvider).load();
  final pushGateway = getIt<PushGateway>();
  await pushGateway.init();
  await getIt<PushTokenReporter>().report();
  await getIt<AuthCubit>().bootstrap();
  getIt.registerSingleton<AppRouter>(AppRouter(authCubit: getIt<AuthCubit>()));
}
