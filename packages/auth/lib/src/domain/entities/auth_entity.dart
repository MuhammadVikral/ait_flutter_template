import 'package:common_dependency/common_dependency.dart';

part 'auth_entity.freezed.dart';

@freezed
class AuthEntity with _$AuthEntity {
  factory AuthEntity(
    String email,
    String password,
  ) = _AuthEntity;
}
