part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required LoginInput loginInput,
    required PasswordInput passwordInput,
    required FormzStatus formStatus,
  }) = _AuthState;
  factory AuthState.initial() => AuthState(
        loginInput: LoginInput.pure(),
        passwordInput: PasswordInput.pure(),
        formStatus: FormzStatus.pure,
      );
}
