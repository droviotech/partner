import 'package:partner/contracts/auth/auth_models.dart';

enum AuthStatus { unknown, unauthenticated, authenticated }

class AuthState {
  const AuthState({this.status = AuthStatus.unknown, this.profile, this.error});

  final AuthStatus status;
  final OperatorProfileDto? profile;
  final String? error;

  AuthState copyWith({
    AuthStatus? status,
    OperatorProfileDto? profile,
    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is AuthState &&
      other.status == status &&
      other.profile?.id == profile?.id &&
      other.error == error;

  @override
  int get hashCode => Object.hash(status, profile?.id, error);
}
