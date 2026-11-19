import 'package:injectable/injectable.dart';
import 'auth_token_provider.dart';
import 'session_store.dart';

@LazySingleton(as: AuthTokenProvider)
class SecureTokenProvider implements AuthTokenProvider {
  SecureTokenProvider(this._store);

  final SessionStore _store;

  @override
  Future<String?> accessToken() => _store.readToken();

  @override
  Future<void> clear() => _store.clear();
}
