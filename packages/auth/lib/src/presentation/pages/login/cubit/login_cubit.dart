import 'package:common_dependency/common_dependency.dart';

part 'login_state.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  void onChangeUsername(String value) {
    var input = LoginInput.dirty(value);
    emit(
      state.copyWith(loginInput: input),
    );
  }

  void onUsernameLoseFocus() {
    var input = LoginInput.dirty(state.loginInput.value);
    emit(
      state.copyWith(
        loginInput: input,
        showErrorMessageUsername: true,
      ),
    );
  }

  void onPasswordGainFocus() {
    var input = PasswordInput.dirty(state.passwordInput.value);
    emit(
      state.copyWith(
        passwordInput: input,
        showErrorMessagePassword: true,
      ),
    );
  }

  void onChangePassword(String value) {
    var input = PasswordInput.dirty(value);
    emit(
      state.copyWith(passwordInput: input),
    );
  }

  void onTappedButon() {
    emit(state.copyWith(formStatus: FormzStatus.submissionInProgress));
  }
}
