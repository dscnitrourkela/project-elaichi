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
  String get description => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  String get locationID => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get notes => throw _privateConstructorUsedError;
  List<Org> get org => throw _privateConstructorUsedError;
  List<String> get orgID => throw _privateConstructorUsedError;
  OrgType get orgType => throw _privateConstructorUsedError;
  User get poc => throw _privateConstructorUsedError;
  List<String> get pocID => throw _privateConstructorUsedError;
  String get poster => throw _privateConstructorUsedError;
  int get proiority => throw _privateConstructorUsedError;
  RepeatType? get repeatDay => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  StatusType get status => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool get weekly => throw _privateConstructorUsedError;

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
      {String description,
      DateTime endDate,
      String id,
      Location? location,
      String locationID,
      String name,
      List<String> notes,
      List<Org> org,
      List<String> orgID,
      OrgType orgType,
      User poc,
      List<String> pocID,
      String poster,
      int proiority,
      RepeatType? repeatDay,
      DateTime startDate,
      StatusType status,
      String? type,
      bool weekly});

  $LocationCopyWith<$Res>? get location;
  $UserCopyWith<$Res> get poc;
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
    Object? description = null,
    Object? endDate = null,
    Object? id = null,
    Object? location = freezed,
    Object? locationID = null,
    Object? name = null,
    Object? notes = null,
    Object? org = null,
    Object? orgID = null,
    Object? orgType = null,
    Object? poc = null,
    Object? pocID = null,
    Object? poster = null,
    Object? proiority = null,
    Object? repeatDay = freezed,
    Object? startDate = null,
    Object? status = null,
    Object? type = freezed,
    Object? weekly = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      locationID: null == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      org: null == org
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as List<Org>,
      orgID: null == orgID
          ? _value.orgID
          : orgID // ignore: cast_nullable_to_non_nullable
              as List<String>,
      orgType: null == orgType
          ? _value.orgType
          : orgType // ignore: cast_nullable_to_non_nullable
              as OrgType,
      poc: null == poc
          ? _value.poc
          : poc // ignore: cast_nullable_to_non_nullable
              as User,
      pocID: null == pocID
          ? _value.pocID
          : pocID // ignore: cast_nullable_to_non_nullable
              as List<String>,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      proiority: null == proiority
          ? _value.proiority
          : proiority // ignore: cast_nullable_to_non_nullable
              as int,
      repeatDay: freezed == repeatDay
          ? _value.repeatDay
          : repeatDay // ignore: cast_nullable_to_non_nullable
              as RepeatType?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      weekly: null == weekly
          ? _value.weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $UserCopyWith<$Res> get poc {
    return $UserCopyWith<$Res>(_value.poc, (value) {
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
      {String description,
      DateTime endDate,
      String id,
      Location? location,
      String locationID,
      String name,
      List<String> notes,
      List<Org> org,
      List<String> orgID,
      OrgType orgType,
      User poc,
      List<String> pocID,
      String poster,
      int proiority,
      RepeatType? repeatDay,
      DateTime startDate,
      StatusType status,
      String? type,
      bool weekly});

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $UserCopyWith<$Res> get poc;
}

/// @nodoc
class __$$_EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res, _$_Event>
    implements _$$_EventCopyWith<$Res> {
  __$$_EventCopyWithImpl(_$_Event _value, $Res Function(_$_Event) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? endDate = null,
    Object? id = null,
    Object? location = freezed,
    Object? locationID = null,
    Object? name = null,
    Object? notes = null,
    Object? org = null,
    Object? orgID = null,
    Object? orgType = null,
    Object? poc = null,
    Object? pocID = null,
    Object? poster = null,
    Object? proiority = null,
    Object? repeatDay = freezed,
    Object? startDate = null,
    Object? status = null,
    Object? type = freezed,
    Object? weekly = null,
  }) {
    return _then(_$_Event(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      locationID: null == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      org: null == org
          ? _value._org
          : org // ignore: cast_nullable_to_non_nullable
              as List<Org>,
      orgID: null == orgID
          ? _value._orgID
          : orgID // ignore: cast_nullable_to_non_nullable
              as List<String>,
      orgType: null == orgType
          ? _value.orgType
          : orgType // ignore: cast_nullable_to_non_nullable
              as OrgType,
      poc: null == poc
          ? _value.poc
          : poc // ignore: cast_nullable_to_non_nullable
              as User,
      pocID: null == pocID
          ? _value._pocID
          : pocID // ignore: cast_nullable_to_non_nullable
              as List<String>,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      proiority: null == proiority
          ? _value.proiority
          : proiority // ignore: cast_nullable_to_non_nullable
              as int,
      repeatDay: freezed == repeatDay
          ? _value.repeatDay
          : repeatDay // ignore: cast_nullable_to_non_nullable
              as RepeatType?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      weekly: null == weekly
          ? _value.weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event implements _Event {
  const _$_Event(
      {required this.description,
      required this.endDate,
      required this.id,
      this.location,
      required this.locationID,
      required this.name,
      required final List<String> notes,
      required final List<Org> org,
      required final List<String> orgID,
      required this.orgType,
      required this.poc,
      required final List<String> pocID,
      required this.poster,
      required this.proiority,
      this.repeatDay,
      required this.startDate,
      required this.status,
      this.type,
      required this.weekly})
      : _notes = notes,
        _org = org,
        _orgID = orgID,
        _pocID = pocID;

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  final String description;
  @override
  final DateTime endDate;
  @override
  final String id;
  @override
  final Location? location;
  @override
  final String locationID;
  @override
  final String name;
  final List<String> _notes;
  @override
  List<String> get notes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  final List<Org> _org;
  @override
  List<Org> get org {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_org);
  }

  final List<String> _orgID;
  @override
  List<String> get orgID {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orgID);
  }

  @override
  final OrgType orgType;
  @override
  final User poc;
  final List<String> _pocID;
  @override
  List<String> get pocID {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pocID);
  }

  @override
  final String poster;
  @override
  final int proiority;
  @override
  final RepeatType? repeatDay;
  @override
  final DateTime startDate;
  @override
  final StatusType status;
  @override
  final String? type;
  @override
  final bool weekly;

  @override
  String toString() {
    return 'Event(description: $description, endDate: $endDate, id: $id, location: $location, locationID: $locationID, name: $name, notes: $notes, org: $org, orgID: $orgID, orgType: $orgType, poc: $poc, pocID: $pocID, poster: $poster, proiority: $proiority, repeatDay: $repeatDay, startDate: $startDate, status: $status, type: $type, weekly: $weekly)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.locationID, locationID) ||
                other.locationID == locationID) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            const DeepCollectionEquality().equals(other._org, _org) &&
            const DeepCollectionEquality().equals(other._orgID, _orgID) &&
            (identical(other.orgType, orgType) || other.orgType == orgType) &&
            (identical(other.poc, poc) || other.poc == poc) &&
            const DeepCollectionEquality().equals(other._pocID, _pocID) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.proiority, proiority) ||
                other.proiority == proiority) &&
            (identical(other.repeatDay, repeatDay) ||
                other.repeatDay == repeatDay) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.weekly, weekly) || other.weekly == weekly));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        description,
        endDate,
        id,
        location,
        locationID,
        name,
        const DeepCollectionEquality().hash(_notes),
        const DeepCollectionEquality().hash(_org),
        const DeepCollectionEquality().hash(_orgID),
        orgType,
        poc,
        const DeepCollectionEquality().hash(_pocID),
        poster,
        proiority,
        repeatDay,
        startDate,
        status,
        type,
        weekly
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
      {required final String description,
      required final DateTime endDate,
      required final String id,
      final Location? location,
      required final String locationID,
      required final String name,
      required final List<String> notes,
      required final List<Org> org,
      required final List<String> orgID,
      required final OrgType orgType,
      required final User poc,
      required final List<String> pocID,
      required final String poster,
      required final int proiority,
      final RepeatType? repeatDay,
      required final DateTime startDate,
      required final StatusType status,
      final String? type,
      required final bool weekly}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  String get description;
  @override
  DateTime get endDate;
  @override
  String get id;
  @override
  Location? get location;
  @override
  String get locationID;
  @override
  String get name;
  @override
  List<String> get notes;
  @override
  List<Org> get org;
  @override
  List<String> get orgID;
  @override
  OrgType get orgType;
  @override
  User get poc;
  @override
  List<String> get pocID;
  @override
  String get poster;
  @override
  int get proiority;
  @override
  RepeatType? get repeatDay;
  @override
  DateTime get startDate;
  @override
  StatusType get status;
  @override
  String? get type;
  @override
  bool get weekly;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}
