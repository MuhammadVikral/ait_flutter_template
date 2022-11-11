part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();
  factory LoginState({
    required LoginInput loginInput,
    required PasswordInput passwordInput,
    required FormzStatus formStatus,
    required bool showErrorMessageUsername,
    required bool showErrorMessagePassword,
  }) = _LoginState;
  factory LoginState.initial() => LoginState(
        loginInput: LoginInput.pure(),
        passwordInput: PasswordInput.pure(),
        formStatus: FormzStatus.pure,
        showErrorMessageUsername: false,
        showErrorMessagePassword: false,
      );
  bool get buttonEnabled {
    return loginInput.valid && passwordInput.valid;
  }
}
