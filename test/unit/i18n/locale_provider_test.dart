import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:partner/core/i18n/app_locale_provider.dart';

void main() {
  test('系统泰文 → th', () {
    expect(AppLocaleProvider.resolve(const Locale('th')), const Locale('th'));
  });

  test('系统中文 → zh-Hans', () {
    expect(
      AppLocaleProvider.resolve(const Locale('zh')),
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    );
    expect(
      AppLocaleProvider.resolve(const Locale('zh', 'TW')),
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    );
  });

  test('系统其他语言或无匹配回退泰文', () {
    expect(AppLocaleProvider.resolve(const Locale('en')), const Locale('th'));
    expect(AppLocaleProvider.resolve(null), const Locale('th'));
  });
}
