import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:partner/core/design/app_theme.dart';
import 'package:partner/core/design/widgets/primary_button.dart';

void main() {
  testWidgets('PrimaryButton 渲染标签并可点击', (tester) async {
    var clicked = false;
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme().light,
        home: Scaffold(
          body: PrimaryButton(label: '登录', onPressed: () => clicked = true),
        ),
      ),
    );
    expect(find.text('登录'), findsOneWidget);
    await tester.tap(find.text('登录'));
    expect(clicked, isTrue);
  });

  testWidgets('loading 时禁用', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme().light,
        home: Scaffold(
          body: PrimaryButton(label: '登录', onPressed: () {}, loading: true),
        ),
      ),
    );
    final button = tester.widget<FilledButton>(find.byType(FilledButton));
    expect(button.onPressed, isNull);
  });
}
