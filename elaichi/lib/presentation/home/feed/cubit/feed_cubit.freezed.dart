// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feed_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FeedStateTearOff {
  const _$FeedStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _WebMailAuthenticated webMailAuthenticated() {
    return const _WebMailAuthenticated();
  }

  _WebMailUnauthenticated webMailUnauthenticated() {
    return const _WebMailUnauthenticated();
  }
}

/// @nodoc
const $FeedState = _$FeedStateTearOff();

/// @nodoc
mixin _$FeedState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() webMailAuthenticated,
    required TResult Function() webMailUnauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? webMailAuthenticated,
    TResult Function()? webMailUnauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? webMailAuthenticated,
    TResult Function()? webMailUnauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_WebMailAuthenticated value) webMailAuthenticated,
    required TResult Function(_WebMailUnauthenticated value)
        webMailUnauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WebMailAuthenticated value)? webMailAuthenticated,
    TResult Function(_WebMailUnauthenticated value)? webMailUnauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WebMailAuthenticated value)? webMailAuthenticated,
    TResult Function(_WebMailUnauthenticated value)? webMailUnauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedStateCopyWith<$Res> {
  factory $FeedStateCopyWith(FeedState value, $Res Function(FeedState) then) =
      _$FeedStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FeedStateCopyWithImpl<$Res> implements $FeedStateCopyWith<$Res> {
  _$FeedStateCopyWithImpl(this._value, this._then);

  final FeedState _value;
  // ignore: unused_field
  final $Res Function(FeedState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$FeedStateCopyWithImpl<$Res>
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
    return 'FeedState.initial()';
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
    required TResult Function() webMailAuthenticated,
    required TResult Function() webMailUnauthenticated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? webMailAuthenticated,
    TResult Function()? webMailUnauthenticated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? webMailAuthenticated,
    TResult Function()? webMailUnauthenticated,
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
    required TResult Function(_WebMailAuthenticated value) webMailAuthenticated,
    required TResult Function(_WebMailUnauthenticated value)
        webMailUnauthenticated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WebMailAuthenticated value)? webMailAuthenticated,
    TResult Function(_WebMailUnauthenticated value)? webMailUnauthenticated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WebMailAuthenticated value)? webMailAuthenticated,
    TResult Function(_WebMailUnauthenticated value)? webMailUnauthenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FeedState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$FeedStateCopyWithImpl<$Res>
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
    return 'FeedState.loading()';
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
    required TResult Function() webMailAuthenticated,
    required TResult Function() webMailUnauthenticated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? webMailAuthenticated,
    TResult Function()? webMailUnauthenticated,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? webMailAuthenticated,
    TResult Function()? webMailUnauthenticated,
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
    required TResult Function(_WebMailAuthenticated value) webMailAuthenticated,
    required TResult Function(_WebMailUnauthenticated value)
        webMailUnauthenticated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WebMailAuthenticated value)? webMailAuthenticated,
    TResult Function(_WebMailUnauthenticated value)? webMailUnauthenticated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WebMailAuthenticated value)? webMailAuthenticated,
    TResult Function(_WebMailUnauthenticated value)? webMailUnauthenticated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements FeedState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$WebMailAuthenticatedCopyWith<$Res> {
  factory _$WebMailAuthenticatedCopyWith(_WebMailAuthenticated value,
          $Res Function(_WebMailAuthenticated) then) =
      __$WebMailAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$WebMailAuthenticatedCopyWithImpl<$Res>
    extends _$FeedStateCopyWithImpl<$Res>
    implements _$WebMailAuthenticatedCopyWith<$Res> {
  __$WebMailAuthenticatedCopyWithImpl(
      _WebMailAuthenticated _value, $Res Function(_WebMailAuthenticated) _then)
      : super(_value, (v) => _then(v as _WebMailAuthenticated));

  @override
  _WebMailAuthenticated get _value => super._value as _WebMailAuthenticated;
}

/// @nodoc

class _$_WebMailAuthenticated implements _WebMailAuthenticated {
  const _$_WebMailAuthenticated();

  @override
  String toString() {
    return 'FeedState.webMailAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _WebMailAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() webMailAuthenticated,
    required TResult Function() webMailUnauthenticated,
  }) {
    return webMailAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? webMailAuthenticated,
    TResult Function()? webMailUnauthenticated,
  }) {
    return webMailAuthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? webMailAuthenticated,
    TResult Function()? webMailUnauthenticated,
    required TResult orElse(),
  }) {
    if (webMailAuthenticated != null) {
      return webMailAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_WebMailAuthenticated value) webMailAuthenticated,
    required TResult Function(_WebMailUnauthenticated value)
        webMailUnauthenticated,
  }) {
    return webMailAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WebMailAuthenticated value)? webMailAuthenticated,
    TResult Function(_WebMailUnauthenticated value)? webMailUnauthenticated,
  }) {
    return webMailAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WebMailAuthenticated value)? webMailAuthenticated,
    TResult Function(_WebMailUnauthenticated value)? webMailUnauthenticated,
    required TResult orElse(),
  }) {
    if (webMailAuthenticated != null) {
      return webMailAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _WebMailAuthenticated implements FeedState {
  const factory _WebMailAuthenticated() = _$_WebMailAuthenticated;
}

/// @nodoc
abstract class _$WebMailUnauthenticatedCopyWith<$Res> {
  factory _$WebMailUnauthenticatedCopyWith(_WebMailUnauthenticated value,
          $Res Function(_WebMailUnauthenticated) then) =
      __$WebMailUnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$WebMailUnauthenticatedCopyWithImpl<$Res>
    extends _$FeedStateCopyWithImpl<$Res>
    implements _$WebMailUnauthenticatedCopyWith<$Res> {
  __$WebMailUnauthenticatedCopyWithImpl(_WebMailUnauthenticated _value,
      $Res Function(_WebMailUnauthenticated) _then)
      : super(_value, (v) => _then(v as _WebMailUnauthenticated));

  @override
  _WebMailUnauthenticated get _value => super._value as _WebMailUnauthenticated;
}

/// @nodoc

class _$_WebMailUnauthenticated implements _WebMailUnauthenticated {
  const _$_WebMailUnauthenticated();

  @override
  String toString() {
    return 'FeedState.webMailUnauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _WebMailUnauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() webMailAuthenticated,
    required TResult Function() webMailUnauthenticated,
  }) {
    return webMailUnauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? webMailAuthenticated,
    TResult Function()? webMailUnauthenticated,
  }) {
    return webMailUnauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? webMailAuthenticated,
    TResult Function()? webMailUnauthenticated,
    required TResult orElse(),
  }) {
    if (webMailUnauthenticated != null) {
      return webMailUnauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_WebMailAuthenticated value) webMailAuthenticated,
    required TResult Function(_WebMailUnauthenticated value)
        webMailUnauthenticated,
  }) {
    return webMailUnauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WebMailAuthenticated value)? webMailAuthenticated,
    TResult Function(_WebMailUnauthenticated value)? webMailUnauthenticated,
  }) {
    return webMailUnauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_WebMailAuthenticated value)? webMailAuthenticated,
    TResult Function(_WebMailUnauthenticated value)? webMailUnauthenticated,
    required TResult orElse(),
  }) {
    if (webMailUnauthenticated != null) {
      return webMailUnauthenticated(this);
    }
    return orElse();
  }
}

abstract class _WebMailUnauthenticated implements FeedState {
  const factory _WebMailUnauthenticated() = _$_WebMailUnauthenticated;
}
