import 'package:go_router/go_router.dart';
import 'package:partner/features/auth/application/auth_state.dart';

String? authRedirect(AuthState authState, GoRouterState state) {
  final loggedIn = authState.status == AuthStatus.authenticated;
  final onLogin = state.matchedLocation == '/login';
  if (!loggedIn && !onLogin) return '/login';
  if (loggedIn && onLogin) return '/';
  return null;
}
