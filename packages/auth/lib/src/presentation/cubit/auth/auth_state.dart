part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required bool loggedin,
    required FormzStatus status,
  }) = _AuthState;

  factory AuthState.initial() => AuthState(
        loggedin: false,
        status: FormzStatus.pure,
      );
}
