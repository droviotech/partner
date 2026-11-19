class AuthSessionDto {
  const AuthSessionDto({required this.token, required this.operatorId});

  final String token;
  final String operatorId;

  factory AuthSessionDto.fromJson(Map<String, dynamic> json) => AuthSessionDto(
    token: json['token'] as String,
    operatorId: json['operator_id'] as String,
  );
}

class OperatorProfileDto {
  const OperatorProfileDto({
    required this.id,
    required this.name,
    required this.roles,
  });

  final String id;
  final String name;
  final List<String> roles;

  factory OperatorProfileDto.fromJson(Map<String, dynamic> json) =>
      OperatorProfileDto(
        id: json['id'] as String,
        name: json['name'] as String? ?? '',
        roles: (json['roles'] as List<dynamic>? ?? const [])
            .map((e) => e as String)
            .toList(growable: false),
      );
}
