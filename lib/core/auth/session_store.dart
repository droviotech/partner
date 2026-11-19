import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class SessionStore {
  Future<String?> readToken();
  Future<void> writeToken(String token);
  Future<String?> readOperatorId();
  Future<void> writeOperatorId(String operatorId);
  Future<void> clear();
}

@LazySingleton(as: SessionStore)
class SecureSessionStore implements SessionStore {
  SecureSessionStore({FlutterSecureStorage? storage})
    : _storage = storage ?? FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const _tokenKey = 'auth_token';
  static const _operatorKey = 'auth_operator_id';

  @override
  Future<String?> readToken() => _storage.read(key: _tokenKey);

  @override
  Future<void> writeToken(String token) =>
      _storage.write(key: _tokenKey, value: token);

  @override
  Future<String?> readOperatorId() => _storage.read(key: _operatorKey);

  @override
  Future<void> writeOperatorId(String operatorId) =>
      _storage.write(key: _operatorKey, value: operatorId);

  @override
  Future<void> clear() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _operatorKey);
  }
}
