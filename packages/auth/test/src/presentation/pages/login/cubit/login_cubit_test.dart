import 'package:auth/src/domain/use_case/login_use_case.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUsecase extends Mock implements LoginUseCase {}

void main() {
  late LoginCubit authCubit;
  setUp(
    () {
      authCubit = LoginCubit(loginClient: MockLoginUsecase());
    },
  );
  group(
    'input username & password invalid',
    () {
      test(
        'should change loginInput state into "tidak boleh kosong" when inputed username is empty',
        () {
          authCubit.onChangeUsername('');
          expect(authCubit.state.loginInput.invalid, true);
        },
      );
      test(
        'should change loginInput state into "format email invalid" when inputed username is email but with wrong format',
        () {
          authCubit.onChangeUsername('@abc');
          expect(authCubit.state.loginInput.invalid, true);
        },
      );
      test(
        'should change loginInput state into "Format nomor telephone tidak sesuai" when inputed username is phone number but with wrong format',
        () {
          authCubit.onChangeUsername('08');
          expect(authCubit.state.loginInput.invalid, true);
        },
      );
      test(
        'should change loginInput state into "password minimal  character" when inputed password is invalid',
        () {
          authCubit.onChangePassword('08');
          expect(authCubit.state.passwordInput.invalid, true);
        },
      );
      test(
        'should change loginInput state into "Please enter at least 3 characters." when inputed username is invalid',
        () {
          authCubit.onChangeUsername('sk');
          expect(authCubit.state.loginInput.invalid, true);
        },
      );
    },
  );
  group(
    'input username valid',
    () {
      test(
        'should change loginInput state into valid when inputed username is email ',
        () {
          authCubit.onChangeUsername('mvikral@gmail.com');
          expect(authCubit.state.loginInput.valid, true);
        },
      );
      test(
        'should change loginInput state into valid when inputed username is phone number ',
        () {
          authCubit.onChangeUsername('08121400400');
          expect(authCubit.state.loginInput.valid, true);
        },
      );
      test(
        'should change loginInput state into valid when inputed username is username',
        () {
          authCubit.onChangeUsername('skypea');
          expect(authCubit.state.loginInput.valid, true);
        },
      );
      test(
        'should change loginInput state into valid when inputed password is valid',
        () {
          authCubit.onChangePassword('12345678');
          expect(authCubit.state.passwordInput.valid, true);
        },
      );
    },
  );
  group(
    'on Tapped Login',
    () {
      test(
        "should change form status into form status submission on prosses",
        () {
          authCubit.onTappedButon();
          expect(authCubit.state.formStatus, FormzStatus.submissionInProgress);
        },
      );
    },
  );
}
