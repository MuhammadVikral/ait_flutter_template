import 'package:common_dependency/common_dependency.dart';

part 'auth_entity.freezed.dart';
// part 'auth_entity.g.dart';

@freezed
class AuthEntity with _$AuthEntity {
  factory AuthEntity(
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'password') String? password,
  ) = _AuthEntity;

  // factory AuthEntity.fromJson(Map<String, dynamic> json) =>
  //     _$AuthEntityFromJson(json);
}
