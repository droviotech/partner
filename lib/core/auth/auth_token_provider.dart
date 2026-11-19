abstract class AuthTokenProvider {
  Future<String?> accessToken();
  Future<void> clear();
}
