// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  List<String>? get ca => throw _privateConstructorUsedError;
  List<String>? get festID => throw _privateConstructorUsedError;
  List<Org>? get fests => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  GenderType? get gender => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get college => throw _privateConstructorUsedError;
  String? get stream => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  String? get selfID => throw _privateConstructorUsedError;
  String? get refferedBy => throw _privateConstructorUsedError;
  String? get rollNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String email,
      String uid,
      List<String>? ca,
      List<String>? festID,
      List<Org>? fests,
      String? name,
      String? photo,
      GenderType? gender,
      DateTime? dob,
      String? state,
      String? city,
      String? college,
      String? stream,
      String? mobile,
      String? selfID,
      String? refferedBy,
      String? rollNumber});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? uid = null,
    Object? ca = freezed,
    Object? festID = freezed,
    Object? fests = freezed,
    Object? name = freezed,
    Object? photo = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? college = freezed,
    Object? stream = freezed,
    Object? mobile = freezed,
    Object? selfID = freezed,
    Object? refferedBy = freezed,
    Object? rollNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      ca: freezed == ca
          ? _value.ca
          : ca // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      festID: freezed == festID
          ? _value.festID
          : festID // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      fests: freezed == fests
          ? _value.fests
          : fests // ignore: cast_nullable_to_non_nullable
              as List<Org>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderType?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      college: freezed == college
          ? _value.college
          : college // ignore: cast_nullable_to_non_nullable
              as String?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      selfID: freezed == selfID
          ? _value.selfID
          : selfID // ignore: cast_nullable_to_non_nullable
              as String?,
      refferedBy: freezed == refferedBy
          ? _value.refferedBy
          : refferedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      rollNumber: freezed == rollNumber
          ? _value.rollNumber
          : rollNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String uid,
      List<String>? ca,
      List<String>? festID,
      List<Org>? fests,
      String? name,
      String? photo,
      GenderType? gender,
      DateTime? dob,
      String? state,
      String? city,
      String? college,
      String? stream,
      String? mobile,
      String? selfID,
      String? refferedBy,
      String? rollNumber});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? uid = null,
    Object? ca = freezed,
    Object? festID = freezed,
    Object? fests = freezed,
    Object? name = freezed,
    Object? photo = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? college = freezed,
    Object? stream = freezed,
    Object? mobile = freezed,
    Object? selfID = freezed,
    Object? refferedBy = freezed,
    Object? rollNumber = freezed,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      ca: freezed == ca
          ? _value._ca
          : ca // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      festID: freezed == festID
          ? _value._festID
          : festID // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      fests: freezed == fests
          ? _value._fests
          : fests // ignore: cast_nullable_to_non_nullable
              as List<Org>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderType?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      college: freezed == college
          ? _value.college
          : college // ignore: cast_nullable_to_non_nullable
              as String?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      selfID: freezed == selfID
          ? _value.selfID
          : selfID // ignore: cast_nullable_to_non_nullable
              as String?,
      refferedBy: freezed == refferedBy
          ? _value.refferedBy
          : refferedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      rollNumber: freezed == rollNumber
          ? _value.rollNumber
          : rollNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {required this.id,
      required this.email,
      required this.uid,
      final List<String>? ca,
      final List<String>? festID,
      final List<Org>? fests,
      this.name,
      this.photo,
      this.gender,
      this.dob,
      this.state,
      this.city,
      this.college,
      this.stream,
      this.mobile,
      this.selfID,
      this.refferedBy,
      this.rollNumber})
      : _ca = ca,
        _festID = festID,
        _fests = fests;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String uid;
  final List<String>? _ca;
  @override
  List<String>? get ca {
    final value = _ca;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _festID;
  @override
  List<String>? get festID {
    final value = _festID;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Org>? _fests;
  @override
  List<Org>? get fests {
    final value = _fests;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? name;
  @override
  final String? photo;
  @override
  final GenderType? gender;
  @override
  final DateTime? dob;
  @override
  final String? state;
  @override
  final String? city;
  @override
  final String? college;
  @override
  final String? stream;
  @override
  final String? mobile;
  @override
  final String? selfID;
  @override
  final String? refferedBy;
  @override
  final String? rollNumber;

  @override
  String toString() {
    return 'User(id: $id, email: $email, uid: $uid, ca: $ca, festID: $festID, fests: $fests, name: $name, photo: $photo, gender: $gender, dob: $dob, state: $state, city: $city, college: $college, stream: $stream, mobile: $mobile, selfID: $selfID, refferedBy: $refferedBy, rollNumber: $rollNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            const DeepCollectionEquality().equals(other._ca, _ca) &&
            const DeepCollectionEquality().equals(other._festID, _festID) &&
            const DeepCollectionEquality().equals(other._fests, _fests) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.college, college) || other.college == college) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.selfID, selfID) || other.selfID == selfID) &&
            (identical(other.refferedBy, refferedBy) ||
                other.refferedBy == refferedBy) &&
            (identical(other.rollNumber, rollNumber) ||
                other.rollNumber == rollNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      uid,
      const DeepCollectionEquality().hash(_ca),
      const DeepCollectionEquality().hash(_festID),
      const DeepCollectionEquality().hash(_fests),
      name,
      photo,
      gender,
      dob,
      state,
      city,
      college,
      stream,
      mobile,
      selfID,
      refferedBy,
      rollNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String id,
      required final String email,
      required final String uid,
      final List<String>? ca,
      final List<String>? festID,
      final List<Org>? fests,
      final String? name,
      final String? photo,
      final GenderType? gender,
      final DateTime? dob,
      final String? state,
      final String? city,
      final String? college,
      final String? stream,
      final String? mobile,
      final String? selfID,
      final String? refferedBy,
      final String? rollNumber}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get uid;
  @override
  List<String>? get ca;
  @override
  List<String>? get festID;
  @override
  List<Org>? get fests;
  @override
  String? get name;
  @override
  String? get photo;
  @override
  GenderType? get gender;
  @override
  DateTime? get dob;
  @override
  String? get state;
  @override
  String? get city;
  @override
  String? get college;
  @override
  String? get stream;
  @override
  String? get mobile;
  @override
  String? get selfID;
  @override
  String? get refferedBy;
  @override
  String? get rollNumber;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
