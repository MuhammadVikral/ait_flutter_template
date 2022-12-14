// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_entity.freezed.dart';

@freezed
class LoginEntity with _$LoginEntity {
  factory LoginEntity({
    required String email,
    required String password,
  }) = _LoginEntity;
}
