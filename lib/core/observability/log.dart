import 'package:flutter/foundation.dart';

enum LogLevel { debug, info, warning, error }

void logDebug(String message) => _log(LogLevel.debug, message);
void logInfo(String message) => _log(LogLevel.info, message);
void logWarning(String message) => _log(LogLevel.warning, message);
void logError(String message, [Object? error, StackTrace? stackTrace]) =>
    _log(LogLevel.error, message, error: error, stackTrace: stackTrace);

void _log(
  LogLevel level,
  String message, {
  Object? error,
  StackTrace? stackTrace,
}) {
  if (kReleaseMode) return;
  debugPrint(
    '[${level.name.toUpperCase()}] $message'
    '${error == null ? '' : '\n$error'}',
  );
  if (stackTrace != null) debugPrint(stackTrace.toString());
}
