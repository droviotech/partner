import 'auth_models.dart';

abstract class AuthRepository {
  Future<String?> accessToken();
  Future<OperatorProfileDto> login({
    required String username,
    required String password,
  });
  Future<OperatorProfileDto> loadProfile();
  Future<void> logout();
}
