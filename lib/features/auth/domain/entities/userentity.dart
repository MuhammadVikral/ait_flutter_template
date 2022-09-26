import 'package:freezed_annotation/freezed_annotation.dart';

part 'userentity.freezed.dart';
part 'userentity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  factory UserEntity(
    @JsonKey(name: 'id') String id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'email') String email,
  ) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
