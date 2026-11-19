import 'dart:async';
import 'package:injectable/injectable.dart';

@singleton
class SessionEvents {
  final _expiredController = StreamController<void>.broadcast();

  Stream<void> get expired => _expiredController.stream;

  void fireSessionExpired() => _expiredController.add(null);

  void dispose() => _expiredController.close();
}
