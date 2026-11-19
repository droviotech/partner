import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:partner/app/router/app_router.dart';
import 'package:partner/contracts/auth/auth_models.dart';
import 'package:partner/contracts/auth/auth_repository.dart';
import 'package:partner/core/auth/auth_token_provider.dart';
import 'package:partner/core/auth/session_events.dart';
import 'package:partner/features/auth/application/auth_cubit.dart';
import 'package:partner/features/auth/presentation/login_page.dart';
import 'package:partner/features/home/presentation/home_page.dart';
import 'package:partner/features/messages/presentation/message_detail_page.dart';
import 'package:partner/l10n/generated/app_localizations.dart';

class FakeTokenProvider implements AuthTokenProvider {
  FakeTokenProvider([this.token]);
  String? token;

  @override
  Future<String?> accessToken() async => token;

  @override
  Future<void> clear() async => token = null;
}

class FakeAuthRepository implements AuthRepository {
  @override
  Future<String?> accessToken() async => 't1';

  @override
  Future<OperatorProfileDto> login({
    required String username,
    required String password,
  }) async =>
      OperatorProfileDto(id: 'op-1', name: '张三', roles: const ['warehouse']);

  @override
  Future<OperatorProfileDto> loadProfile() async =>
      OperatorProfileDto(id: 'op-1', name: '张三', roles: const ['warehouse']);

  @override
  Future<void> logout() async {}
}

void main() {
  testWidgets('未登录访问 / 重定向到 /login', (tester) async {
    final cubit = AuthCubit(
      tokenProvider: FakeTokenProvider(),
      repository: FakeAuthRepository(),
      sessionEvents: SessionEvents(),
    );
    await cubit.bootstrap();

    final appRouter = AppRouter(authCubit: cubit);
    final router = appRouter.router;
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
        supportedLocales: const [
          Locale('th'),
          Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        ],
        localizationsDelegates: AppLocalizations.localizationsDelegates,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(LoginPage), findsOneWidget);
    appRouter.dispose();
  });

  testWidgets('已登录可访问 / 首页', (tester) async {
    final cubit = AuthCubit(
      tokenProvider: FakeTokenProvider('t1'),
      repository: FakeAuthRepository(),
      sessionEvents: SessionEvents(),
    );
    await cubit.bootstrap();

    final appRouter = AppRouter(authCubit: cubit);
    final router = appRouter.router;
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
        supportedLocales: const [
          Locale('th'),
          Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        ],
        localizationsDelegates: AppLocalizations.localizationsDelegates,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
    appRouter.dispose();
  });

  testWidgets('深链接 /messages/42 打开消息占位详情', (tester) async {
    final cubit = AuthCubit(
      tokenProvider: FakeTokenProvider('t1'),
      repository: FakeAuthRepository(),
      sessionEvents: SessionEvents(),
    );
    await cubit.bootstrap();

    final appRouter = AppRouter(authCubit: cubit);
    final router = appRouter.router;
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
        supportedLocales: const [
          Locale('th'),
          Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        ],
        localizationsDelegates: AppLocalizations.localizationsDelegates,
      ),
    );
    await tester.pumpAndSettle();

    router.go('/messages/42');
    await tester.pumpAndSettle();

    expect(find.byType(MessageDetailPage), findsOneWidget);
    expect(find.textContaining('42'), findsOneWidget);
    appRouter.dispose();
  });
}
