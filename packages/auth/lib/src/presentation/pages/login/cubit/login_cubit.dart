import 'package:common_dependency/common_dependency.dart';

part 'login_state.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  void onChangeLogin(String value) {
    var input = LoginInput.dirty(value);
    emit(
      state.copyWith(loginInput: input),
    );
  }

  void onChangePassword(String value) {
    var input = PasswordInput.dirty(value);
    emit(
      state.copyWith(passwordInput: input),
    );
  }
}
