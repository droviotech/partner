import 'package:injectable/injectable.dart';
import 'package:partner/core/api/api_client.dart';
import 'auth_models.dart';

@singleton
class AuthApi {
  AuthApi({required ApiClient client}) : _client = client;

  final ApiClient _client;

  Future<AuthSessionDto> login({
    required String username,
    required String password,
  }) => _client.post<AuthSessionDto>(
    'auth/login',
    body: {'username': username, 'password': password},
    decode: (json) => AuthSessionDto.fromJson(json as Map<String, dynamic>),
  );

  Future<OperatorProfileDto> me() => _client.get<OperatorProfileDto>(
    'auth/me',
    decode: (json) => OperatorProfileDto.fromJson(json as Map<String, dynamic>),
  );

  Future<dynamic> logout() => _client.post<dynamic>('auth/logout');
}
