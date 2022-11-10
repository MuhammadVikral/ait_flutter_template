part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required LoginInput loginInput,
    required PasswordInput passwordInput,
    required FormzStatus formStatus,
  }) = _LoginState;
  factory LoginState.initial() => LoginState(
        loginInput: LoginInput.pure(),
        passwordInput: PasswordInput.pure(),
        formStatus: FormzStatus.pure,
      );
}
