import 'package:common_dependency/common_dependency.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());

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
