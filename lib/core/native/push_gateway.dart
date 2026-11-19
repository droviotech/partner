abstract class PushGateway {
  Future<void> init();
  Future<String?> get token;
  Stream<dynamic> get onMessage;
  Future<void> requestPermission();
}
