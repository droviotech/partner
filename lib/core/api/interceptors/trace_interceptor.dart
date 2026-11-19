import 'dart:math';
import 'package:dio/dio.dart';
import '../../observability/log.dart';

class TraceInterceptor extends InterceptorsWrapper {
  TraceInterceptor({Random? random}) : _random = random ?? Random(), super();

  final Random _random;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Request-ID'] = _generateRequestId();
    logDebug('--> ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logDebug('<-- ${response.statusCode} ${response.requestOptions.uri}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logWarning(
      '<-- ERROR ${err.response?.statusCode} ${err.requestOptions.uri}',
    );
    handler.next(err);
  }

  String _generateRequestId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toRadixString(36);
    final randomPart = _random
        .nextInt(0xFFFFFF)
        .toRadixString(16)
        .padLeft(6, '0');
    return '$timestamp-$randomPart';
  }
}
