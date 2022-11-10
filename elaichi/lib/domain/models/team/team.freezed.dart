// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Team _$TeamFromJson(Map<String, dynamic> json) {
  return _Team.fromJson(json);
}

/// @nodoc
mixin _$Team {
  String get id => throw _privateConstructorUsedError;
  String get orgID => throw _privateConstructorUsedError;
  Org get org => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  String get userID => throw _privateConstructorUsedError;
  String? get team => throw _privateConstructorUsedError;
  int? get priority => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamCopyWith<Team> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String orgID,
      Org org,
      User user,
      String userID,
      String? team,
      int? priority,
      String? position});

  $OrgCopyWith<$Res> get org;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$TeamCopyWithImpl<$Res> implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  final Team _value;
  // ignore: unused_field
  final $Res Function(Team) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? orgID = freezed,
    Object? org = freezed,
    Object? user = freezed,
    Object? userID = freezed,
    Object? team = freezed,
    Object? priority = freezed,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orgID: orgID == freezed
          ? _value.orgID
          : orgID // ignore: cast_nullable_to_non_nullable
              as String,
      org: org == freezed
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as Org,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $OrgCopyWith<$Res> get org {
    return $OrgCopyWith<$Res>(_value.org, (value) {
      return _then(_value.copyWith(org: value));
    });
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$$_TeamCopyWith(_$_Team value, $Res Function(_$_Team) then) =
      __$$_TeamCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String orgID,
      Org org,
      User user,
      String userID,
      String? team,
      int? priority,
      String? position});

  @override
  $OrgCopyWith<$Res> get org;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_TeamCopyWithImpl<$Res> extends _$TeamCopyWithImpl<$Res>
    implements _$$_TeamCopyWith<$Res> {
  __$$_TeamCopyWithImpl(_$_Team _value, $Res Function(_$_Team) _then)
      : super(_value, (v) => _then(v as _$_Team));

  @override
  _$_Team get _value => super._value as _$_Team;

  @override
  $Res call({
    Object? id = freezed,
    Object? orgID = freezed,
    Object? org = freezed,
    Object? user = freezed,
    Object? userID = freezed,
    Object? team = freezed,
    Object? priority = freezed,
    Object? position = freezed,
  }) {
    return _then(_$_Team(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orgID: orgID == freezed
          ? _value.orgID
          : orgID // ignore: cast_nullable_to_non_nullable
              as String,
      org: org == freezed
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as Org,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Team implements _Team {
  const _$_Team(
      {required this.id,
      required this.orgID,
      required this.org,
      required this.user,
      required this.userID,
      this.team,
      this.priority,
      this.position});

  factory _$_Team.fromJson(Map<String, dynamic> json) => _$$_TeamFromJson(json);

  @override
  final String id;
  @override
  final String orgID;
  @override
  final Org org;
  @override
  final User user;
  @override
  final String userID;
  @override
  final String? team;
  @override
  final int? priority;
  @override
  final String? position;

  @override
  String toString() {
    return 'Team(id: $id, orgID: $orgID, org: $org, user: $user, userID: $userID, team: $team, priority: $priority, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Team &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.orgID, orgID) &&
            const DeepCollectionEquality().equals(other.org, org) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.userID, userID) &&
            const DeepCollectionEquality().equals(other.team, team) &&
            const DeepCollectionEquality().equals(other.priority, priority) &&
            const DeepCollectionEquality().equals(other.position, position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(orgID),
      const DeepCollectionEquality().hash(org),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(userID),
      const DeepCollectionEquality().hash(team),
      const DeepCollectionEquality().hash(priority),
      const DeepCollectionEquality().hash(position));

  @JsonKey(ignore: true)
  @override
  _$$_TeamCopyWith<_$_Team> get copyWith =>
      __$$_TeamCopyWithImpl<_$_Team>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamToJson(
      this,
    );
  }
}

abstract class _Team implements Team {
  const factory _Team(
      {required final String id,
      required final String orgID,
      required final Org org,
      required final User user,
      required final String userID,
      final String? team,
      final int? priority,
      final String? position}) = _$_Team;

  factory _Team.fromJson(Map<String, dynamic> json) = _$_Team.fromJson;

  @override
  String get id;
  @override
  String get orgID;
  @override
  Org get org;
  @override
  User get user;
  @override
  String get userID;
  @override
  String? get team;
  @override
  int? get priority;
  @override
  String? get position;
  @override
  @JsonKey(ignore: true)
  _$$_TeamCopyWith<_$_Team> get copyWith => throw _privateConstructorUsedError;
}
