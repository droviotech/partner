import 'package:flutter/material.dart';
import 'package:partner/app/di/get_it.dart';
import 'package:partner/app/router/app_router.dart';
import 'package:partner/core/design/app_theme.dart';
import 'package:partner/core/i18n/locale_provider.dart';
import 'package:partner/l10n/generated/app_localizations.dart';

class PartnerApp extends StatelessWidget {
  const PartnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>().router;
    return MaterialApp.router(
      title: 'Partner',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: getIt<AppTheme>().light,
      darkTheme: getIt<AppTheme>().dark,
      locale: getIt<LocaleProvider>().currentLocale,
      supportedLocales: const [
        Locale('th'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      ],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
