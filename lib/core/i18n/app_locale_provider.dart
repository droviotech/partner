import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:partner/core/database/preferences_store.dart';
import 'locale_provider.dart';

@LazySingleton(as: LocaleProvider)
class AppLocaleProvider extends ChangeNotifier implements LocaleProvider {
  AppLocaleProvider({
    required PreferencesStore preferencesStore,
    PlatformDispatcher? dispatcher,
  }) : _preferencesStore = preferencesStore,
       _dispatcher = dispatcher ?? PlatformDispatcher.instance;

  final PreferencesStore _preferencesStore;
  final PlatformDispatcher _dispatcher;

  static const _languageKey = 'app_language';
  static const _supportedLocales = [
    Locale('th'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
  ];

  Locale? _manual;

  @override
  Locale get currentLocale => _manual ?? resolve(_dispatcher.locale);

  static Locale resolve(Locale? systemLocale) {
    if (systemLocale == null) return const Locale('th');
    if (systemLocale.languageCode == 'zh') {
      return const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans');
    }
    if (systemLocale.languageCode == 'th') return const Locale('th');
    return const Locale('th'); // 无匹配回退泰文
  }

  Future<void> load() async {
    final saved = await _preferencesStore.read(_languageKey);
    if (saved == null) return;
    _manual = saved == 'zh-Hans'
        ? const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans')
        : const Locale('th');
    notifyListeners();
  }

  Future<void> setLanguage(Locale locale) async {
    _manual = locale;
    await _preferencesStore.write(
      _languageKey,
      locale.languageCode == 'zh' ? 'zh-Hans' : 'th',
    );
    notifyListeners();
  }

  List<Locale> get supportedLocales => _supportedLocales;
}
