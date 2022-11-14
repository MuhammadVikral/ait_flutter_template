import 'package:common_dependency/common_dependency.dart';

part 'login_entity.freezed.dart';

@freezed
class LoginEntity with _$LoginEntity {
  factory LoginEntity({
    required String email,
    required String password,
  }) = _LoginEntity;
}
