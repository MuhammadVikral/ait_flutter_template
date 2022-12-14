import 'package:email_validator/email_validator.dart';
import 'package:formz/formz.dart';

class LoginInput extends FormzInput<String, String> {
  LoginInput.pure() : super.pure('');
  LoginInput.dirty([super.value = '']) : super.dirty();

  @override
  validator(value) {
    const pattern = r'^\d+$';
    var regExp = RegExp(pattern);
    return value.isEmpty
        ? 'Tidak boleh kosong'
        : value.contains('@')
            ? validatingEmail(value)
            : regExp.hasMatch(value)
                ? validatingPhoneNumber(value)
                : validatingUsername(value);
  }

  String? validatingEmail(value) {
    return EmailValidator.validate(value) ? null : 'Format email Salah';
  }

  String? validatingPhoneNumber(value) {
    const pattern = r'^(?:[0][8])[0-9]{7,11}$';
    var regExp = RegExp(pattern);
    return regExp.hasMatch(value) ? null : 'format phone number tidak sesuai';
  }

  String? validatingUsername(String value) {
    return value.length < 3 ? 'Please enter at least 3 characters.' : null;
  }
}

class PasswordInput extends FormzInput<String, String> {
  PasswordInput.pure() : super.pure('');
  PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  validator(value) {
    return value.isEmpty
        ? 'password tidak boleh kosong'
        : value.length < 8
            ? 'password minimal 8 character'
            : null;
  }
}
