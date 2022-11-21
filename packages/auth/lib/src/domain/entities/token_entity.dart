import 'package:common_dependency/common_dependency.dart';
part 'token_entity.freezed.dart';

@freezed
class TokenEntity with _$TokenEntity {
  factory TokenEntity({
    required String accessToken,
    required String refreshTOken,
  }) = _TokenEntity;
}
