import 'package:design_system/design_system.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'response_model.freezed.dart';
part 'response_model.g.dart';

@freezed
class ResponseModel with _$ResponseModel {
  factory ResponseModel({
    @JsonKey(name: 'meta') required MetaModel meta,
    @JsonKey(name: 'data') JSON? data,
  }) = _ResponseModel;

  factory ResponseModel.fromJson(JSON json) => _$ResponseModelFromJson(json);
}

@freezed
class MetaModel with _$MetaModel {
  factory MetaModel({
    @JsonKey(name: 'code') required int code,
    @JsonKey(name: 'message') required String message,
  }) = _MetaModel;

  factory MetaModel.fromJson(JSON json) => _$MetaModelFromJson(json);
}
