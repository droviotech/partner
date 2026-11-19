enum ApiErrorType {
  network,
  timeout,
  business,
  unauthorized,
  forbidden,
  server,
  unknown,
}

class ApiException implements Exception {
  const ApiException({
    required this.type,
    this.statusCode,
    this.code,
    this.message,
    this.details,
  });

  final ApiErrorType type;
  final int? statusCode;
  final String? code;
  final String? message;
  final Map<String, dynamic>? details;

  bool get isSessionExpired => type == ApiErrorType.unauthorized;

  @override
  String toString() =>
      'ApiException($type, status=$statusCode, code=$code, message=$message)';
}
