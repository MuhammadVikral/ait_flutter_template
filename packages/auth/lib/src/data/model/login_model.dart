import 'package:auth/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const LoginModel._();
  @Implements<LoginEntity>()
  const factory LoginModel({
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'password') required String password,
  }) = _LoginModel;
  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
