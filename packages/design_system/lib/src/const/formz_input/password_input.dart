import 'package:common_dependency/common_dependency.dart';

class LoginInput extends FormzInput<String, String> {
  LoginInput.pure() : super.pure('');
  LoginInput.dirty([super.value = '']) : super.dirty();

  @override
  validator(value) {
    return value.isEmpty ? 'Tidak boleh kosong' : null;
  }
}

class PasswordInput extends FormzInput<String, String> {
  PasswordInput.pure() : super.pure('');
  PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  validator(value) {
    return value.length < 8 ? 'password minimal  character' : null;
  }
}
