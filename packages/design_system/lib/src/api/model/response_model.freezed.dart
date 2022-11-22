// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) {
  return _ResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseModel {
  @JsonKey(name: 'meta')
  MetaModel get meta => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseModelCopyWith<ResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseModelCopyWith<$Res> {
  factory $ResponseModelCopyWith(
          ResponseModel value, $Res Function(ResponseModel) then) =
      _$ResponseModelCopyWithImpl<$Res, ResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'meta') MetaModel meta,
      @JsonKey(name: 'data') Map<String, dynamic>? data});

  $MetaModelCopyWith<$Res> get meta;
}

/// @nodoc
class _$ResponseModelCopyWithImpl<$Res, $Val extends ResponseModel>
    implements $ResponseModelCopyWith<$Res> {
  _$ResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaModel,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaModelCopyWith<$Res> get meta {
    return $MetaModelCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ResponseModelCopyWith<$Res>
    implements $ResponseModelCopyWith<$Res> {
  factory _$$_ResponseModelCopyWith(
          _$_ResponseModel value, $Res Function(_$_ResponseModel) then) =
      __$$_ResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'meta') MetaModel meta,
      @JsonKey(name: 'data') Map<String, dynamic>? data});

  @override
  $MetaModelCopyWith<$Res> get meta;
}

/// @nodoc
class __$$_ResponseModelCopyWithImpl<$Res>
    extends _$ResponseModelCopyWithImpl<$Res, _$_ResponseModel>
    implements _$$_ResponseModelCopyWith<$Res> {
  __$$_ResponseModelCopyWithImpl(
      _$_ResponseModel _value, $Res Function(_$_ResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? data = freezed,
  }) {
    return _then(_$_ResponseModel(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaModel,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResponseModel implements _ResponseModel {
  _$_ResponseModel(
      {@JsonKey(name: 'meta') required this.meta,
      @JsonKey(name: 'data') final Map<String, dynamic>? data})
      : _data = data;

  factory _$_ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResponseModelFromJson(json);

  @override
  @JsonKey(name: 'meta')
  final MetaModel meta;
  final Map<String, dynamic>? _data;
  @override
  @JsonKey(name: 'data')
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ResponseModel(meta: $meta, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResponseModel &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, meta, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResponseModelCopyWith<_$_ResponseModel> get copyWith =>
      __$$_ResponseModelCopyWithImpl<_$_ResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponseModelToJson(
      this,
    );
  }
}

abstract class _ResponseModel implements ResponseModel {
  factory _ResponseModel(
          {@JsonKey(name: 'meta') required final MetaModel meta,
          @JsonKey(name: 'data') final Map<String, dynamic>? data}) =
      _$_ResponseModel;

  factory _ResponseModel.fromJson(Map<String, dynamic> json) =
      _$_ResponseModel.fromJson;

  @override
  @JsonKey(name: 'meta')
  MetaModel get meta;
  @override
  @JsonKey(name: 'data')
  Map<String, dynamic>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ResponseModelCopyWith<_$_ResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) {
  return _MetaModel.fromJson(json);
}

/// @nodoc
mixin _$MetaModel {
  @JsonKey(name: 'code')
  int get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaModelCopyWith<MetaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaModelCopyWith<$Res> {
  factory $MetaModelCopyWith(MetaModel value, $Res Function(MetaModel) then) =
      _$MetaModelCopyWithImpl<$Res, MetaModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'code') int code,
      @JsonKey(name: 'message') String message});
}

/// @nodoc
class _$MetaModelCopyWithImpl<$Res, $Val extends MetaModel>
    implements $MetaModelCopyWith<$Res> {
  _$MetaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MetaModelCopyWith<$Res> implements $MetaModelCopyWith<$Res> {
  factory _$$_MetaModelCopyWith(
          _$_MetaModel value, $Res Function(_$_MetaModel) then) =
      __$$_MetaModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'code') int code,
      @JsonKey(name: 'message') String message});
}

/// @nodoc
class __$$_MetaModelCopyWithImpl<$Res>
    extends _$MetaModelCopyWithImpl<$Res, _$_MetaModel>
    implements _$$_MetaModelCopyWith<$Res> {
  __$$_MetaModelCopyWithImpl(
      _$_MetaModel _value, $Res Function(_$_MetaModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_$_MetaModel(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MetaModel implements _MetaModel {
  _$_MetaModel(
      {@JsonKey(name: 'code') required this.code,
      @JsonKey(name: 'message') required this.message});

  factory _$_MetaModel.fromJson(Map<String, dynamic> json) =>
      _$$_MetaModelFromJson(json);

  @override
  @JsonKey(name: 'code')
  final int code;
  @override
  @JsonKey(name: 'message')
  final String message;

  @override
  String toString() {
    return 'MetaModel(code: $code, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MetaModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MetaModelCopyWith<_$_MetaModel> get copyWith =>
      __$$_MetaModelCopyWithImpl<_$_MetaModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MetaModelToJson(
      this,
    );
  }
}

abstract class _MetaModel implements MetaModel {
  factory _MetaModel(
      {@JsonKey(name: 'code') required final int code,
      @JsonKey(name: 'message') required final String message}) = _$_MetaModel;

  factory _MetaModel.fromJson(Map<String, dynamic> json) =
      _$_MetaModel.fromJson;

  @override
  @JsonKey(name: 'code')
  int get code;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_MetaModelCopyWith<_$_MetaModel> get copyWith =>
      throw _privateConstructorUsedError;
}
