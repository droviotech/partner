import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:partner/features/auth/application/auth_cubit.dart';
import 'package:partner/features/auth/application/auth_state.dart';
import 'package:partner/features/auth/presentation/login_page.dart';
import 'package:partner/features/home/presentation/home_page.dart';
import 'package:partner/features/messages/presentation/message_detail_page.dart';
import 'package:partner/features/messages/presentation/messages_page.dart';
import 'package:partner/features/scan/presentation/scan_page.dart';
import 'package:partner/features/settings/presentation/settings_page.dart';
import 'app_shell.dart';
import 'route_guards.dart';

class AppRouter {
  AppRouter({required AuthCubit authCubit}) : _authCubit = authCubit {
    _refreshStream = GoRouterRefreshStream(_authCubit.stream);
    router = GoRouter(
      initialLocation: '/',
      refreshListenable: _refreshStream,
      redirect: (context, state) => authRedirect(_authCubit.state, state),
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) =>
              BlocProvider.value(value: _authCubit, child: const LoginPage()),
        ),
        ShellRoute(
          builder: (context, state, child) =>
              AppShell(currentLocation: state.uri.path, child: child),
          routes: [
            GoRoute(path: '/', builder: (context, state) => const HomePage()),
            GoRoute(
              path: '/scan',
              builder: (context, state) => const ScanPage(),
            ),
            GoRoute(
              path: '/messages',
              builder: (context, state) => const MessagesPage(),
            ),
            GoRoute(
              path: '/messages/:id',
              builder: (context, state) => MessageDetailPage(
                messageId: state.pathParameters['id'] ?? '',
              ),
            ),
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsPage(),
            ),
          ],
        ),
      ],
    );
  }

  final AuthCubit _authCubit;
  late final GoRouterRefreshStream _refreshStream;
  late final GoRouter router;

  void dispose() {
    _refreshStream.dispose();
    router.dispose();
  }
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<AuthState> stream) {
    notifyListeners();
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<AuthState> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
