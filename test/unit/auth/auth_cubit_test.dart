import 'package:flutter_test/flutter_test.dart';
import 'package:partner/contracts/auth/auth_models.dart';
import 'package:partner/contracts/auth/auth_repository.dart';
import 'package:partner/core/auth/auth_token_provider.dart';
import 'package:partner/core/auth/session_events.dart';
import 'package:partner/features/auth/application/auth_cubit.dart';
import 'package:partner/features/auth/application/auth_state.dart';

class FakeTokenProvider implements AuthTokenProvider {
  FakeTokenProvider([this.token]);
  String? token;

  @override
  Future<String?> accessToken() async => token;

  @override
  Future<void> clear() async => token = null;
}

class FakeAuthRepository implements AuthRepository {
  String? token;

  @override
  Future<String?> accessToken() async => token;

  @override
  Future<OperatorProfileDto> login({
    required String username,
    required String password,
  }) async {
    token = 't1';
    return OperatorProfileDto(
      id: 'op-1',
      name: '张三',
      roles: const ['warehouse'],
    );
  }

  @override
  Future<OperatorProfileDto> loadProfile() async =>
      OperatorProfileDto(id: 'op-1', name: '张三', roles: const ['warehouse']);

  @override
  Future<void> logout() async => token = null;
}

Future<List<AuthState>> runCubit(
  AuthCubit cubit,
  Future<void> Function(AuthCubit) act,
) async {
  final states = <AuthState>[];
  final subscription = cubit.stream.listen(states.add);
  await act(cubit);
  await Future<void>.delayed(Duration.zero);
  await subscription.cancel();
  await cubit.close();
  return states;
}

void main() {
  late SessionEvents sessionEvents;

  setUp(() {
    sessionEvents = SessionEvents();
  });

  test('无 token 启动为未登录', () async {
    final cubit = AuthCubit(
      tokenProvider: FakeTokenProvider(),
      repository: FakeAuthRepository(),
      sessionEvents: sessionEvents,
    );
    final states = await runCubit(cubit, (c) => c.bootstrap());
    expect(states, [const AuthState(status: AuthStatus.unauthenticated)]);
  });

  test('登录成功进入已认证', () async {
    final cubit = AuthCubit(
      tokenProvider: FakeTokenProvider(),
      repository: FakeAuthRepository(),
      sessionEvents: sessionEvents,
    );
    final states = await runCubit(
      cubit,
      (c) => c.login(username: 'u', password: 'p'),
    );
    expect(states.last.status, AuthStatus.authenticated);
    expect(states.last.profile?.id, 'op-1');
  });

  test('会话失效事件触发未登录', () async {
    final cubit = AuthCubit(
      tokenProvider: FakeTokenProvider('t1'),
      repository: FakeAuthRepository(),
      sessionEvents: sessionEvents,
    );
    final states = await runCubit(cubit, (c) async {
      sessionEvents.fireSessionExpired();
    });
    expect(states.last.status, AuthStatus.unauthenticated);
    expect(states.last.error, 'session_expired');
  });
}
