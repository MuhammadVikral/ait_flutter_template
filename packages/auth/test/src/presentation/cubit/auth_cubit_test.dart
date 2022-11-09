import 'package:common_dependency/common_dependency.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'input username invalid',
    () {
      late AuthCubit authCubit;
      setUp(
        () {
          authCubit = AuthCubit();
        },
      );
      test(
        'should change loginInput state into "tidak boleh kosong" when inputed username is empty',
        () {
          authCubit.onChangeLogin('');
          expect(authCubit.state.loginInput.invalid, true);
        },
      );
      test(
        'should change loginInput state into "format email invalid" when inputed username is email but with wrong format',
        () {
          authCubit.onChangeLogin('@abc');
          expect(authCubit.state.loginInput.invalid, true);
        },
      );
      test(
        'should change loginInput state into "Format nomor telephone tidak sesuai" when inputed username is phone number but with wrong format',
        () {
          authCubit.onChangeLogin('08');
          expect(authCubit.state.loginInput.invalid, true);
        },
      );
    },
  );
  group(
    'input username valid',
    () {
      late AuthCubit authCubit;
      setUp(
        () {
          authCubit = AuthCubit();
        },
      );
      test(
        'should change loginInput state into valid when inputed username is email ',
        () {
          authCubit.onChangeLogin('mvikral@gmail.com');
          expect(authCubit.state.loginInput.valid, true);
        },
      );
      test(
        'should change loginInput state into valid when inputed username is phone number ',
        () {
          authCubit.onChangeLogin('08121400400');
          expect(authCubit.state.loginInput.valid, true);
        },
      );
      test(
        'should change loginInput state into valid when inputed username is username',
        () {
          authCubit.onChangeLogin('skypea');
          expect(authCubit.state.loginInput.valid, true);
        },
      );
    },
  );
}
