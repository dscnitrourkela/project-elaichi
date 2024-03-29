// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventRegistration _$EventRegistrationFromJson(Map<String, dynamic> json) {
  return _EventRegistration.fromJson(json);
}

/// @nodoc
mixin _$EventRegistration {
  String get id => throw _privateConstructorUsedError;
  String get eventID => throw _privateConstructorUsedError;
  String get userID => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  Event? get event => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventRegistrationCopyWith<EventRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventRegistrationCopyWith<$Res> {
  factory $EventRegistrationCopyWith(
          EventRegistration value, $Res Function(EventRegistration) then) =
      _$EventRegistrationCopyWithImpl<$Res>;
  $Res call(
      {String id, String eventID, String userID, User? user, Event? event});

  $UserCopyWith<$Res>? get user;
  $EventCopyWith<$Res>? get event;
}

/// @nodoc
class _$EventRegistrationCopyWithImpl<$Res>
    implements $EventRegistrationCopyWith<$Res> {
  _$EventRegistrationCopyWithImpl(this._value, this._then);

  final EventRegistration _value;
  // ignore: unused_field
  final $Res Function(EventRegistration) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? eventID = freezed,
    Object? userID = freezed,
    Object? user = freezed,
    Object? event = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventID: eventID == freezed
          ? _value.eventID
          : eventID // ignore: cast_nullable_to_non_nullable
              as String,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Event?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $EventCopyWith<$Res>? get event {
    if (_value.event == null) {
      return null;
    }

    return $EventCopyWith<$Res>(_value.event!, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc
abstract class _$$_EventRegistrationCopyWith<$Res>
    implements $EventRegistrationCopyWith<$Res> {
  factory _$$_EventRegistrationCopyWith(_$_EventRegistration value,
          $Res Function(_$_EventRegistration) then) =
      __$$_EventRegistrationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String eventID, String userID, User? user, Event? event});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $EventCopyWith<$Res>? get event;
}

/// @nodoc
class __$$_EventRegistrationCopyWithImpl<$Res>
    extends _$EventRegistrationCopyWithImpl<$Res>
    implements _$$_EventRegistrationCopyWith<$Res> {
  __$$_EventRegistrationCopyWithImpl(
      _$_EventRegistration _value, $Res Function(_$_EventRegistration) _then)
      : super(_value, (v) => _then(v as _$_EventRegistration));

  @override
  _$_EventRegistration get _value => super._value as _$_EventRegistration;

  @override
  $Res call({
    Object? id = freezed,
    Object? eventID = freezed,
    Object? userID = freezed,
    Object? user = freezed,
    Object? event = freezed,
  }) {
    return _then(_$_EventRegistration(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventID: eventID == freezed
          ? _value.eventID
          : eventID // ignore: cast_nullable_to_non_nullable
              as String,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Event?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventRegistration implements _EventRegistration {
  const _$_EventRegistration(
      {required this.id,
      required this.eventID,
      required this.userID,
      this.user,
      this.event});

  factory _$_EventRegistration.fromJson(Map<String, dynamic> json) =>
      _$$_EventRegistrationFromJson(json);

  @override
  final String id;
  @override
  final String eventID;
  @override
  final String userID;
  @override
  final User? user;
  @override
  final Event? event;

  @override
  String toString() {
    return 'EventRegistration(id: $id, eventID: $eventID, userID: $userID, user: $user, event: $event)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventRegistration &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.eventID, eventID) &&
            const DeepCollectionEquality().equals(other.userID, userID) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.event, event));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(eventID),
      const DeepCollectionEquality().hash(userID),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(event));

  @JsonKey(ignore: true)
  @override
  _$$_EventRegistrationCopyWith<_$_EventRegistration> get copyWith =>
      __$$_EventRegistrationCopyWithImpl<_$_EventRegistration>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventRegistrationToJson(
      this,
    );
  }
}

abstract class _EventRegistration implements EventRegistration {
  const factory _EventRegistration(
      {required final String id,
      required final String eventID,
      required final String userID,
      final User? user,
      final Event? event}) = _$_EventRegistration;

  factory _EventRegistration.fromJson(Map<String, dynamic> json) =
      _$_EventRegistration.fromJson;

  @override
  String get id;
  @override
  String get eventID;
  @override
  String get userID;
  @override
  User? get user;
  @override
  Event? get event;
  @override
  @JsonKey(ignore: true)
  _$$_EventRegistrationCopyWith<_$_EventRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}
