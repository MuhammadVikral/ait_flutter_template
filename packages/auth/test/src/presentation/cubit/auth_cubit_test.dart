import 'package:common_dependency/common_dependency.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'input username',
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
    },
  );
}
