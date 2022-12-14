import 'package:caching/src/model/token_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_key_model.freezed.dart';

enum WhichToken { guess, user }

@freezed
class TokenKeyModel with _$TokenKeyModel {
  factory TokenKeyModel({
    required WhichToken whichToken,
    required TokenModel token,
  }) = _TokenKeyModel;
}
