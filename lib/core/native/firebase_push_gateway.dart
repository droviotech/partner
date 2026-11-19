import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:partner/core/observability/log.dart';
import 'push_gateway.dart';

@LazySingleton(as: PushGateway)
class FirebasePushGateway implements PushGateway {
  FirebaseMessaging? _messaging;
  final _messages = StreamController<dynamic>.broadcast();

  @override
  Future<void> init() async {
    try {
      await Firebase.initializeApp();
      _messaging = FirebaseMessaging.instance;
      final settings = await _messaging!.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      logInfo('push permission: ${settings.authorizationStatus}');
      FirebaseMessaging.onMessage.listen((message) => _messages.add(message));
    } catch (e, s) {
      // 本地未配置 google-services.json / GoogleService-Info.plist 时降级为不可用
      logWarning('push init failed: $e');
      logError('push init stack', e, s);
    }
  }

  @override
  Future<String?> get token async {
    final messaging = _messaging;
    if (messaging == null) return null;
    if (Platform.isIOS) return messaging.getAPNSToken();
    // firebase_messaging 17 将 getToken 标记为 deprecated（建议 register + onRegistered）；
    // 后端 token 契约尚未定型，暂用 getToken 保证跨平台与测试稳定性。
    // ignore: deprecated_member_use
    return messaging.getToken();
  }

  @override
  Stream<dynamic> get onMessage => _messages.stream;

  @override
  Future<void> requestPermission() async {
    final messaging = _messaging;
    if (messaging == null) return;
    await messaging.requestPermission(alert: true, badge: true, sound: true);
  }
}
