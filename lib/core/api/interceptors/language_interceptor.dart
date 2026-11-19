import 'package:dio/dio.dart';
import '../../i18n/locale_provider.dart';

class LanguageInterceptor extends InterceptorsWrapper {
  LanguageInterceptor({required LocaleProvider localeProvider})
    : _localeProvider = localeProvider,
      super();

  final LocaleProvider _localeProvider;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final language = _localeProvider.currentLocale.languageCode == 'th'
        ? 'th'
        : 'zh-Hans';
    options.headers['Accept-Language'] = language;
    handler.next(options);
  }
}
