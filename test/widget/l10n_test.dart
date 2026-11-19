import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:partner/l10n/generated/app_localizations.dart';

void main() {
  Future<void> pumpWithLocale(WidgetTester tester, Locale locale) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: locale,
        supportedLocales: const [
          Locale('th'),
          Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        ],
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Builder(
          builder: (context) => Text(AppLocalizations.of(context).home),
        ),
      ),
    );
  }

  testWidgets('中文文案', (tester) async {
    await pumpWithLocale(
      tester,
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    );
    expect(find.text('首页'), findsOneWidget);
  });

  testWidgets('泰文文案', (tester) async {
    await pumpWithLocale(tester, const Locale('th'));
    expect(find.text('หน้าแรก'), findsOneWidget);
  });

  testWidgets('不支持的语言回退泰文', (tester) async {
    await pumpWithLocale(tester, const Locale('en'));
    expect(find.text('หน้าแรก'), findsOneWidget);
  });
}
