import 'package:dio/dio.dart';
import '../../auth/session_events.dart';
import '../api_exception.dart';

class ErrorInterceptor extends InterceptorsWrapper {
  ErrorInterceptor({required SessionEvents sessionEvents})
    : _sessionEvents = sessionEvents,
      super();

  final SessionEvents _sessionEvents;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final apiException = _toApiException(err);
    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        error: apiException,
        type: err.type,
      ),
    );
  }

  ApiException _toApiException(DioException error) {
    final response = error.response;
    final statusCode = response?.statusCode;

    if (statusCode == 401) {
      _sessionEvents.fireSessionExpired();
      return ApiException(
        type: ApiErrorType.unauthorized,
        statusCode: 401,
        code: 'UNAUTHORIZED',
        message: 'session expired',
      );
    }

    if (statusCode == 403) {
      return ApiException(
        type: ApiErrorType.forbidden,
        statusCode: 403,
        code: 'FORBIDDEN',
      );
    }

    if (response != null) {
      final body = response.data;
      final code = statusCode ?? 0;
      if (body is Map<String, dynamic>) {
        return ApiException(
          type: code >= 500 ? ApiErrorType.server : ApiErrorType.business,
          statusCode: code,
          code: body['code'] as String?,
          message: body['message'] as String?,
          details: body['details'] is Map<String, dynamic>
              ? body['details'] as Map<String, dynamic>
              : null,
        );
      }
      return ApiException(
        type: code >= 500 ? ApiErrorType.server : ApiErrorType.business,
        statusCode: code,
      );
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(type: ApiErrorType.timeout);
      case DioExceptionType.connectionError:
        return ApiException(type: ApiErrorType.network);
      default:
        return ApiException(type: ApiErrorType.unknown, message: error.message);
    }
  }
}
