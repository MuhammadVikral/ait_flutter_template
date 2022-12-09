import 'package:auth/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const LoginModel._();
  const factory LoginModel({
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'password') String? password,
  }) = _LoginModel;

  factory LoginModel.fromEntity(LoginEntity entity) =>
      LoginModel(email: entity.email, password: entity.password);
  LoginEntity toEntity() =>
      LoginEntity(email: email ?? '', password: password ?? '');

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
