import 'package:common_dependency/common_dependency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginClient}) : super(LoginState.initial());

  final LoginUseCase loginClient;
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

  Future<void> onTappedButon() async {
    emit(state.copyWith(formStatus: FormzStatus.submissionInProgress));
    final _response = await loginClient(
        username: state.loginInput, password: state.passwordInput);

    _response.fold(
        (l) => emit(state.copyWith(formStatus: FormzStatus.submissionFailure)),
        (r) => emit(state.copyWith(formStatus: FormzStatus.submissionSuccess)));
  }
}
