// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get poster => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  OrgType get orgType => throw _privateConstructorUsedError;
  List<String>? get notes => throw _privateConstructorUsedError;
  bool get weekly => throw _privateConstructorUsedError;
  RepeatType? get repeatDay => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  StatusType get status => throw _privateConstructorUsedError;
  String get locationID => throw _privateConstructorUsedError;
  List<String>? get pocID => throw _privateConstructorUsedError;
  List<String>? get orgID => throw _privateConstructorUsedError;
  List<Org>? get org => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  User? get poc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String poster,
      DateTime startDate,
      DateTime endDate,
      OrgType orgType,
      List<String>? notes,
      bool weekly,
      RepeatType? repeatDay,
      int priority,
      String? type,
      StatusType status,
      String locationID,
      List<String>? pocID,
      List<String>? orgID,
      List<Org>? org,
      Location? location,
      User? poc});

  $LocationCopyWith<$Res>? get location;
  $UserCopyWith<$Res>? get poc;
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? poster = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? orgType = null,
    Object? notes = freezed,
    Object? weekly = null,
    Object? repeatDay = freezed,
    Object? priority = null,
    Object? type = freezed,
    Object? status = null,
    Object? locationID = null,
    Object? pocID = freezed,
    Object? orgID = freezed,
    Object? org = freezed,
    Object? location = freezed,
    Object? poc = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orgType: null == orgType
          ? _value.orgType
          : orgType // ignore: cast_nullable_to_non_nullable
              as OrgType,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      weekly: null == weekly
          ? _value.weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatDay: freezed == repeatDay
          ? _value.repeatDay
          : repeatDay // ignore: cast_nullable_to_non_nullable
              as RepeatType?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      locationID: null == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String,
      pocID: freezed == pocID
          ? _value.pocID
          : pocID // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      orgID: freezed == orgID
          ? _value.orgID
          : orgID // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      org: freezed == org
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as List<Org>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      poc: freezed == poc
          ? _value.poc
          : poc // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get poc {
    if (_value.poc == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.poc!, (value) {
      return _then(_value.copyWith(poc: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$_EventCopyWith(_$_Event value, $Res Function(_$_Event) then) =
      __$$_EventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String poster,
      DateTime startDate,
      DateTime endDate,
      OrgType orgType,
      List<String>? notes,
      bool weekly,
      RepeatType? repeatDay,
      int priority,
      String? type,
      StatusType status,
      String locationID,
      List<String>? pocID,
      List<String>? orgID,
      List<Org>? org,
      Location? location,
      User? poc});

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $UserCopyWith<$Res>? get poc;
}

/// @nodoc
class __$$_EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res, _$_Event>
    implements _$$_EventCopyWith<$Res> {
  __$$_EventCopyWithImpl(_$_Event _value, $Res Function(_$_Event) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? poster = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? orgType = null,
    Object? notes = freezed,
    Object? weekly = null,
    Object? repeatDay = freezed,
    Object? priority = null,
    Object? type = freezed,
    Object? status = null,
    Object? locationID = null,
    Object? pocID = freezed,
    Object? orgID = freezed,
    Object? org = freezed,
    Object? location = freezed,
    Object? poc = freezed,
  }) {
    return _then(_$_Event(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orgType: null == orgType
          ? _value.orgType
          : orgType // ignore: cast_nullable_to_non_nullable
              as OrgType,
      notes: freezed == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      weekly: null == weekly
          ? _value.weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatDay: freezed == repeatDay
          ? _value.repeatDay
          : repeatDay // ignore: cast_nullable_to_non_nullable
              as RepeatType?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      locationID: null == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String,
      pocID: freezed == pocID
          ? _value._pocID
          : pocID // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      orgID: freezed == orgID
          ? _value._orgID
          : orgID // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      org: freezed == org
          ? _value._org
          : org // ignore: cast_nullable_to_non_nullable
              as List<Org>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      poc: freezed == poc
          ? _value.poc
          : poc // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event implements _Event {
  const _$_Event(
      {required this.id,
      required this.name,
      required this.description,
      required this.poster,
      required this.startDate,
      required this.endDate,
      required this.orgType,
      final List<String>? notes,
      required this.weekly,
      this.repeatDay,
      required this.priority,
      this.type,
      required this.status,
      required this.locationID,
      final List<String>? pocID,
      final List<String>? orgID,
      final List<Org>? org,
      this.location,
      this.poc})
      : _notes = notes,
        _pocID = pocID,
        _orgID = orgID,
        _org = org;

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String poster;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final OrgType orgType;
  final List<String>? _notes;
  @override
  List<String>? get notes {
    final value = _notes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool weekly;
  @override
  final RepeatType? repeatDay;
  @override
  final int priority;
  @override
  final String? type;
  @override
  final StatusType status;
  @override
  final String locationID;
  final List<String>? _pocID;
  @override
  List<String>? get pocID {
    final value = _pocID;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _orgID;
  @override
  List<String>? get orgID {
    final value = _orgID;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Org>? _org;
  @override
  List<Org>? get org {
    final value = _org;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Location? location;
  @override
  final User? poc;

  @override
  String toString() {
    return 'Event(id: $id, name: $name, description: $description, poster: $poster, startDate: $startDate, endDate: $endDate, orgType: $orgType, notes: $notes, weekly: $weekly, repeatDay: $repeatDay, priority: $priority, type: $type, status: $status, locationID: $locationID, pocID: $pocID, orgID: $orgID, org: $org, location: $location, poc: $poc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.orgType, orgType) || other.orgType == orgType) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.weekly, weekly) || other.weekly == weekly) &&
            (identical(other.repeatDay, repeatDay) ||
                other.repeatDay == repeatDay) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.locationID, locationID) ||
                other.locationID == locationID) &&
            const DeepCollectionEquality().equals(other._pocID, _pocID) &&
            const DeepCollectionEquality().equals(other._orgID, _orgID) &&
            const DeepCollectionEquality().equals(other._org, _org) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.poc, poc) || other.poc == poc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        description,
        poster,
        startDate,
        endDate,
        orgType,
        const DeepCollectionEquality().hash(_notes),
        weekly,
        repeatDay,
        priority,
        type,
        status,
        locationID,
        const DeepCollectionEquality().hash(_pocID),
        const DeepCollectionEquality().hash(_orgID),
        const DeepCollectionEquality().hash(_org),
        location,
        poc
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventCopyWith<_$_Event> get copyWith =>
      __$$_EventCopyWithImpl<_$_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  const factory _Event(
      {required final String id,
      required final String name,
      required final String description,
      required final String poster,
      required final DateTime startDate,
      required final DateTime endDate,
      required final OrgType orgType,
      final List<String>? notes,
      required final bool weekly,
      final RepeatType? repeatDay,
      required final int priority,
      final String? type,
      required final StatusType status,
      required final String locationID,
      final List<String>? pocID,
      final List<String>? orgID,
      final List<Org>? org,
      final Location? location,
      final User? poc}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get poster;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  OrgType get orgType;
  @override
  List<String>? get notes;
  @override
  bool get weekly;
  @override
  RepeatType? get repeatDay;
  @override
  int get priority;
  @override
  String? get type;
  @override
  StatusType get status;
  @override
  String get locationID;
  @override
  List<String>? get pocID;
  @override
  List<String>? get orgID;
  @override
  List<Org>? get org;
  @override
  Location? get location;
  @override
  User? get poc;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}
