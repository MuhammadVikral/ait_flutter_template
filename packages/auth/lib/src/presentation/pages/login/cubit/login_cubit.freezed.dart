// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  LoginInput get loginInput => throw _privateConstructorUsedError;
  PasswordInput get passwordInput => throw _privateConstructorUsedError;
  FormzStatus get formStatus => throw _privateConstructorUsedError;
  bool get showErrorMessageUsername => throw _privateConstructorUsedError;
  bool get showErrorMessagePassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {LoginInput loginInput,
      PasswordInput passwordInput,
      FormzStatus formStatus,
      bool showErrorMessageUsername,
      bool showErrorMessagePassword});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginInput = null,
    Object? passwordInput = null,
    Object? formStatus = null,
    Object? showErrorMessageUsername = null,
    Object? showErrorMessagePassword = null,
  }) {
    return _then(_value.copyWith(
      loginInput: null == loginInput
          ? _value.loginInput
          : loginInput // ignore: cast_nullable_to_non_nullable
              as LoginInput,
      passwordInput: null == passwordInput
          ? _value.passwordInput
          : passwordInput // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
      formStatus: null == formStatus
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      showErrorMessageUsername: null == showErrorMessageUsername
          ? _value.showErrorMessageUsername
          : showErrorMessageUsername // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessagePassword: null == showErrorMessagePassword
          ? _value.showErrorMessagePassword
          : showErrorMessagePassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoginInput loginInput,
      PasswordInput passwordInput,
      FormzStatus formStatus,
      bool showErrorMessageUsername,
      bool showErrorMessagePassword});
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginState>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginInput = null,
    Object? passwordInput = null,
    Object? formStatus = null,
    Object? showErrorMessageUsername = null,
    Object? showErrorMessagePassword = null,
  }) {
    return _then(_$_LoginState(
      loginInput: null == loginInput
          ? _value.loginInput
          : loginInput // ignore: cast_nullable_to_non_nullable
              as LoginInput,
      passwordInput: null == passwordInput
          ? _value.passwordInput
          : passwordInput // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
      formStatus: null == formStatus
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      showErrorMessageUsername: null == showErrorMessageUsername
          ? _value.showErrorMessageUsername
          : showErrorMessageUsername // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessagePassword: null == showErrorMessagePassword
          ? _value.showErrorMessagePassword
          : showErrorMessagePassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginState extends _LoginState {
  _$_LoginState(
      {required this.loginInput,
      required this.passwordInput,
      required this.formStatus,
      required this.showErrorMessageUsername,
      required this.showErrorMessagePassword})
      : super._();

  @override
  final LoginInput loginInput;
  @override
  final PasswordInput passwordInput;
  @override
  final FormzStatus formStatus;
  @override
  final bool showErrorMessageUsername;
  @override
  final bool showErrorMessagePassword;

  @override
  String toString() {
    return 'LoginState(loginInput: $loginInput, passwordInput: $passwordInput, formStatus: $formStatus, showErrorMessageUsername: $showErrorMessageUsername, showErrorMessagePassword: $showErrorMessagePassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
            (identical(other.loginInput, loginInput) ||
                other.loginInput == loginInput) &&
            (identical(other.passwordInput, passwordInput) ||
                other.passwordInput == passwordInput) &&
            (identical(other.formStatus, formStatus) ||
                other.formStatus == formStatus) &&
            (identical(
                    other.showErrorMessageUsername, showErrorMessageUsername) ||
                other.showErrorMessageUsername == showErrorMessageUsername) &&
            (identical(
                    other.showErrorMessagePassword, showErrorMessagePassword) ||
                other.showErrorMessagePassword == showErrorMessagePassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginInput, passwordInput,
      formStatus, showErrorMessageUsername, showErrorMessagePassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);
}

abstract class _LoginState extends LoginState {
  factory _LoginState(
      {required final LoginInput loginInput,
      required final PasswordInput passwordInput,
      required final FormzStatus formStatus,
      required final bool showErrorMessageUsername,
      required final bool showErrorMessagePassword}) = _$_LoginState;
  _LoginState._() : super._();

  @override
  LoginInput get loginInput;
  @override
  PasswordInput get passwordInput;
  @override
  FormzStatus get formStatus;
  @override
  bool get showErrorMessageUsername;
  @override
  bool get showErrorMessagePassword;
  @override
  @JsonKey(ignore: true)
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
