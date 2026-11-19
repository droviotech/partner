import 'package:injectable/injectable.dart';
import 'package:partner/core/auth/session_store.dart';
import 'auth_api.dart';
import 'auth_models.dart';
import 'auth_repository.dart';

@LazySingleton(as: AuthRepository)
class HttpAuthRepository implements AuthRepository {
  HttpAuthRepository({
    required AuthApi authApi,
    required SessionStore sessionStore,
  }) : _authApi = authApi,
       _sessionStore = sessionStore;

  final AuthApi _authApi;
  final SessionStore _sessionStore;

  @override
  Future<String?> accessToken() => _sessionStore.readToken();

  @override
  Future<OperatorProfileDto> login({
    required String username,
    required String password,
  }) async {
    final session = await _authApi.login(
      username: username,
      password: password,
    );
    await _sessionStore.writeToken(session.token);
    await _sessionStore.writeOperatorId(session.operatorId);
    return _authApi.me();
  }

  @override
  Future<OperatorProfileDto> loadProfile() => _authApi.me();

  @override
  Future<void> logout() async {
    try {
      await _authApi.logout();
    } finally {
      await _sessionStore.clear();
    }
  }
}
