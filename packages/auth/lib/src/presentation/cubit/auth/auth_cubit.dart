import 'package:common_dependency/common_dependency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.checkLoggedIn) : super(AuthState.initial());
  final CheckLoggedInUseCase checkLoggedIn;
  Future<void> initApp() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final res = await checkLoggedIn();
    res.fold(
      (l) => emit(state.copyWith(status: FormzStatus.submissionFailure)),
      (r) {
        if (r) {
          emit(
            state.copyWith(
              status: FormzStatus.submissionSuccess,
              loggedin: true,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: FormzStatus.submissionSuccess,
              loggedin: false,
            ),
          );
        }
      },
    );
  }
}
