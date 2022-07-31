// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'splash_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SplashStateTearOff {
  const _$SplashStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _Unauthenticated unauthenticated() {
    return const _Unauthenticated();
  }

  _GoogleAuthenticated googleAuthenticated() {
    return const _GoogleAuthenticated();
  }

  _ZimbraAuthenticated zimbraAuthenticated() {
    return const _ZimbraAuthenticated();
  }

  _Error error(String error) {
    return _Error(
      error,
    );
  }
}

/// @nodoc
const $SplashState = _$SplashStateTearOff();

/// @nodoc
mixin _$SplashState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unauthenticated,
    required TResult Function() googleAuthenticated,
    required TResult Function() zimbraAuthenticated,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? zimbraAuthenticated,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? zimbraAuthenticated,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_GoogleAuthenticated value) googleAuthenticated,
    required TResult Function(_ZimbraAuthenticated value) zimbraAuthenticated,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_GoogleAuthenticated value)? googleAuthenticated,
    TResult Function(_ZimbraAuthenticated value)? zimbraAuthenticated,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_GoogleAuthenticated value)? googleAuthenticated,
    TResult Function(_ZimbraAuthenticated value)? zimbraAuthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
          SplashState value, $Res Function(SplashState) then) =
      _$SplashStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res> implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  final SplashState _value;
  // ignore: unused_field
  final $Res Function(SplashState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$SplashStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SplashState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unauthenticated,
    required TResult Function() googleAuthenticated,
    required TResult Function() zimbraAuthenticated,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? zimbraAuthenticated,
    TResult Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? zimbraAuthenticated,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_GoogleAuthenticated value) googleAuthenticated,
    required TResult Function(_ZimbraAuthenticated value) zimbraAuthenticated,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_GoogleAuthenticated value)? googleAuthenticated,
    TResult Function(_ZimbraAuthenticated value)? zimbraAuthenticated,
    TResult Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_GoogleAuthenticated value)? googleAuthenticated,
    TResult Function(_ZimbraAuthenticated value)? zimbraAuthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SplashState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$SplashStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'SplashState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unauthenticated,
    required TResult Function() googleAuthenticated,
    required TResult Function() zimbraAuthenticated,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? zimbraAuthenticated,
    TResult Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? zimbraAuthenticated,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_GoogleAuthenticated value) googleAuthenticated,
    required TResult Function(_ZimbraAuthenticated value) zimbraAuthenticated,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_GoogleAuthenticated value)? googleAuthenticated,
    TResult Function(_ZimbraAuthenticated value)? zimbraAuthenticated,
    TResult Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_GoogleAuthenticated value)? googleAuthenticated,
    TResult Function(_ZimbraAuthenticated value)? zimbraAuthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SplashState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$UnauthenticatedCopyWith<$Res> {
  factory _$UnauthenticatedCopyWith(
          _Unauthenticated value, $Res Function(_Unauthenticated) then) =
      __$UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnauthenticatedCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res>
    implements _$UnauthenticatedCopyWith<$Res> {
  __$UnauthenticatedCopyWithImpl(
      _Unauthenticated _value, $Res Function(_Unauthenticated) _then)
      : super(_value, (v) => _then(v as _Unauthenticated));

  @override
  _Unauthenticated get _value => super._value as _Unauthenticated;
}

/// @nodoc

class _$_Unauthenticated implements _Unauthenticated {
  const _$_Unauthenticated();

  @override
  String toString() {
    return 'SplashState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unauthenticated,
    required TResult Function() googleAuthenticated,
    required TResult Function() zimbraAuthenticated,
    required TResult Function(String error) error,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? zimbraAuthenticated,
    TResult Function(String error)? error,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? zimbraAuthenticated,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_GoogleAuthenticated value) googleAuthenticated,
    required TResult Function(_ZimbraAuthenticated value) zimbraAuthenticated,
    required TResult Function(_Error value) error,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_GoogleAuthenticated value)? googleAuthenticated,
    TResult Function(_ZimbraAuthenticated value)? zimbraAuthenticated,
    TResult Function(_Error value)? error,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_GoogleAuthenticated value)? googleAuthenticated,
    TResult Function(_ZimbraAuthenticated value)? zimbraAuthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements SplashState {
  const factory _Unauthenticated() = _$_Unauthenticated;
}

/// @nodoc
abstract class _$GoogleAuthenticatedCopyWith<$Res> {
  factory _$GoogleAuthenticatedCopyWith(_GoogleAuthenticated value,
          $Res Function(_GoogleAuthenticated) then) =
      __$GoogleAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$GoogleAuthenticatedCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res>
    implements _$GoogleAuthenticatedCopyWith<$Res> {
  __$GoogleAuthenticatedCopyWithImpl(
      _GoogleAuthenticated _value, $Res Function(_GoogleAuthenticated) _then)
      : super(_value, (v) => _then(v as _GoogleAuthenticated));

  @override
  _GoogleAuthenticated get _value => super._value as _GoogleAuthenticated;
}

/// @nodoc

class _$_GoogleAuthenticated implements _GoogleAuthenticated {
  const _$_GoogleAuthenticated();

  @override
  String toString() {
    return 'SplashState.googleAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GoogleAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unauthenticated,
    required TResult Function() googleAuthenticated,
    required TResult Function() zimbraAuthenticated,
    required TResult Function(String error) error,
  }) {
    return googleAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? zimbraAuthenticated,
    TResult Function(String error)? error,
  }) {
    return googleAuthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? zimbraAuthenticated,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (googleAuthenticated != null) {
      return googleAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_GoogleAuthenticated value) googleAuthenticated,
    required TResult Function(_ZimbraAuthenticated value) zimbraAuthenticated,
    required TResult Function(_Error value) error,
  }) {
    return googleAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_GoogleAuthenticated value)? googleAuthenticated,
    TResult Function(_ZimbraAuthenticated value)? zimbraAuthenticated,
    TResult Function(_Error value)? error,
  }) {
    return googleAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_GoogleAuthenticated value)? googleAuthenticated,
    TResult Function(_ZimbraAuthenticated value)? zimbraAuthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (googleAuthenticated != null) {
      return googleAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _GoogleAuthenticated implements SplashState {
  const factory _GoogleAuthenticated() = _$_GoogleAuthenticated;
}

/// @nodoc
abstract class _$ZimbraAuthenticatedCopyWith<$Res> {
  factory _$ZimbraAuthenticatedCopyWith(_ZimbraAuthenticated value,
          $Res Function(_ZimbraAuthenticated) then) =
      __$ZimbraAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$ZimbraAuthenticatedCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res>
    implements _$ZimbraAuthenticatedCopyWith<$Res> {
  __$ZimbraAuthenticatedCopyWithImpl(
      _ZimbraAuthenticated _value, $Res Function(_ZimbraAuthenticated) _then)
      : super(_value, (v) => _then(v as _ZimbraAuthenticated));

  @override
  _ZimbraAuthenticated get _value => super._value as _ZimbraAuthenticated;
}

/// @nodoc

class _$_ZimbraAuthenticated implements _ZimbraAuthenticated {
  const _$_ZimbraAuthenticated();

  @override
  String toString() {
    return 'SplashState.zimbraAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ZimbraAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unauthenticated,
    required TResult Function() googleAuthenticated,
    required TResult Function() zimbraAuthenticated,
    required TResult Function(String error) error,
  }) {
    return zimbraAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? zimbraAuthenticated,
    TResult Function(String error)? error,
  }) {
    return zimbraAuthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? zimbraAuthenticated,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (zimbraAuthenticated != null) {
      return zimbraAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_GoogleAuthenticated value) googleAuthenticated,
    required TResult Function(_ZimbraAuthenticated value) zimbraAuthenticated,
    required TResult Function(_Error value) error,
  }) {
    return zimbraAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_GoogleAuthenticated value)? googleAuthenticated,
    TResult Function(_ZimbraAuthenticated value)? zimbraAuthenticated,
    TResult Function(_Error value)? error,
  }) {
    return zimbraAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_GoogleAuthenticated value)? googleAuthenticated,
    TResult Function(_ZimbraAuthenticated value)? zimbraAuthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (zimbraAuthenticated != null) {
      return zimbraAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _ZimbraAuthenticated implements SplashState {
  const factory _ZimbraAuthenticated() = _$_ZimbraAuthenticated;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$SplashStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_Error(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'SplashState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unauthenticated,
    required TResult Function() googleAuthenticated,
    required TResult Function() zimbraAuthenticated,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? zimbraAuthenticated,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function()? googleAuthenticated,
    TResult Function()? zimbraAuthenticated,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_GoogleAuthenticated value) googleAuthenticated,
    required TResult Function(_ZimbraAuthenticated value) zimbraAuthenticated,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_GoogleAuthenticated value)? googleAuthenticated,
    TResult Function(_ZimbraAuthenticated value)? zimbraAuthenticated,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_GoogleAuthenticated value)? googleAuthenticated,
    TResult Function(_ZimbraAuthenticated value)? zimbraAuthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SplashState {
  const factory _Error(String error) = _$_Error;

  String get error;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
