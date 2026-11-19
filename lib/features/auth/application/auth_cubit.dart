import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:partner/contracts/auth/auth_repository.dart';
import 'package:partner/core/api/api_exception.dart';
import 'package:partner/core/auth/auth_token_provider.dart';
import 'package:partner/core/auth/session_events.dart';
import 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required AuthTokenProvider tokenProvider,
    required AuthRepository repository,
    required SessionEvents sessionEvents,
  }) : _tokenProvider = tokenProvider,
       _repository = repository,
       super(const AuthState()) {
    _sessionSubscription = sessionEvents.expired.listen((_) {
      emit(
        const AuthState(
          status: AuthStatus.unauthenticated,
          error: 'session_expired',
        ),
      );
    });
  }

  final AuthTokenProvider _tokenProvider;
  final AuthRepository _repository;
  late final StreamSubscription<void> _sessionSubscription;

  Future<void> bootstrap() async {
    final token = await _tokenProvider.accessToken();
    if (token == null || token.isEmpty) {
      emit(const AuthState(status: AuthStatus.unauthenticated));
      return;
    }
    try {
      final profile = await _repository.loadProfile();
      emit(AuthState(status: AuthStatus.authenticated, profile: profile));
    } on ApiException catch (e) {
      if (e.isSessionExpired) {
        await _tokenProvider.clear();
        emit(const AuthState(status: AuthStatus.unauthenticated));
      } else {
        emit(AuthState(status: AuthStatus.unauthenticated, error: e.message));
      }
    }
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      final profile = await _repository.login(
        username: username,
        password: password,
      );
      emit(AuthState(status: AuthStatus.authenticated, profile: profile));
    } on ApiException catch (e) {
      emit(AuthState(status: AuthStatus.unauthenticated, error: e.message));
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    await _tokenProvider.clear();
    emit(const AuthState(status: AuthStatus.unauthenticated));
  }

  @override
  Future<void> close() async {
    await _sessionSubscription.cancel();
    await super.close();
  }
}
