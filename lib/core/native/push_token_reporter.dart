import 'package:injectable/injectable.dart';
import 'package:partner/core/api/api_client.dart';
import 'push_gateway.dart';

@singleton
class PushTokenReporter {
  PushTokenReporter({required PushGateway gateway, required ApiClient client})
    : _gateway = gateway,
      _client = client;

  final PushGateway _gateway;
  final ApiClient _client;

  Future<void> report() async {
    final token = await _gateway.token;
    if (token == null || token.isEmpty) return;
    await _client.post<dynamic>('devices/push-token', body: {'token': token});
  }
}
