import 'api_exception.dart';

typedef JsonDecoder<T> = T Function(dynamic json);

class ApiResponse<T> {
  const ApiResponse({required this.data});

  final T data;

  static T decode<T>(dynamic json, JsonDecoder<T>? decoder) {
    if (decoder != null) return decoder(json);
    if (json == null) return null as T; // 供 dynamic 无响应体场景使用
    if (T == String) return json as T;
    if (T == Map<String, dynamic>) return json as T;
    if (T == List<dynamic>) return json as T;
    if (T == dynamic) return json as T;
    throw ApiException(
      type: ApiErrorType.server,
      message: 'No decoder registered for $T',
    );
  }
}
