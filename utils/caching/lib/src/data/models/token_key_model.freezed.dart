// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'token_key_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TokenKeyModel {
  WhichToken get whichToken => throw _privateConstructorUsedError;
  Map<String, String> get token => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokenKeyModelCopyWith<TokenKeyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenKeyModelCopyWith<$Res> {
  factory $TokenKeyModelCopyWith(
          TokenKeyModel value, $Res Function(TokenKeyModel) then) =
      _$TokenKeyModelCopyWithImpl<$Res, TokenKeyModel>;
  @useResult
  $Res call({WhichToken whichToken, Map<String, String> token});
}

/// @nodoc
class _$TokenKeyModelCopyWithImpl<$Res, $Val extends TokenKeyModel>
    implements $TokenKeyModelCopyWith<$Res> {
  _$TokenKeyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? whichToken = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      whichToken: null == whichToken
          ? _value.whichToken
          : whichToken // ignore: cast_nullable_to_non_nullable
              as WhichToken,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenKeyModelCopyWith<$Res>
    implements $TokenKeyModelCopyWith<$Res> {
  factory _$$_TokenKeyModelCopyWith(
          _$_TokenKeyModel value, $Res Function(_$_TokenKeyModel) then) =
      __$$_TokenKeyModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WhichToken whichToken, Map<String, String> token});
}

/// @nodoc
class __$$_TokenKeyModelCopyWithImpl<$Res>
    extends _$TokenKeyModelCopyWithImpl<$Res, _$_TokenKeyModel>
    implements _$$_TokenKeyModelCopyWith<$Res> {
  __$$_TokenKeyModelCopyWithImpl(
      _$_TokenKeyModel _value, $Res Function(_$_TokenKeyModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? whichToken = null,
    Object? token = null,
  }) {
    return _then(_$_TokenKeyModel(
      whichToken: null == whichToken
          ? _value.whichToken
          : whichToken // ignore: cast_nullable_to_non_nullable
              as WhichToken,
      token: null == token
          ? _value._token
          : token // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$_TokenKeyModel implements _TokenKeyModel {
  _$_TokenKeyModel(
      {required this.whichToken, required final Map<String, String> token})
      : _token = token;

  @override
  final WhichToken whichToken;
  final Map<String, String> _token;
  @override
  Map<String, String> get token {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_token);
  }

  @override
  String toString() {
    return 'TokenKeyModel(whichToken: $whichToken, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenKeyModel &&
            (identical(other.whichToken, whichToken) ||
                other.whichToken == whichToken) &&
            const DeepCollectionEquality().equals(other._token, _token));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, whichToken, const DeepCollectionEquality().hash(_token));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenKeyModelCopyWith<_$_TokenKeyModel> get copyWith =>
      __$$_TokenKeyModelCopyWithImpl<_$_TokenKeyModel>(this, _$identity);
}

abstract class _TokenKeyModel implements TokenKeyModel {
  factory _TokenKeyModel(
      {required final WhichToken whichToken,
      required final Map<String, String> token}) = _$_TokenKeyModel;

  @override
  WhichToken get whichToken;
  @override
  Map<String, String> get token;
  @override
  @JsonKey(ignore: true)
  _$$_TokenKeyModelCopyWith<_$_TokenKeyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
