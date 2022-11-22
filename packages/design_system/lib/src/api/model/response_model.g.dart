// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResponseModel _$$_ResponseModelFromJson(Map<String, dynamic> json) =>
    _$_ResponseModel(
      meta: MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$_ResponseModelToJson(_$_ResponseModel instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

_$_MetaModel _$$_MetaModelFromJson(Map<String, dynamic> json) => _$_MetaModel(
      code: json['code'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$_MetaModelToJson(_$_MetaModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
