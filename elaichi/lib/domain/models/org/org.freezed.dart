// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'org.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Org _$OrgFromJson(Map<String, dynamic> json) {
  return _Org.fromJson(json);
}

/// @nodoc
mixin _$Org {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  OrgType get orgType => throw _privateConstructorUsedError;
  OrgSubType get orgSubType => throw _privateConstructorUsedError;
  StatusType get statusType => throw _privateConstructorUsedError;
  int get registrtionFee => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get tagline => throw _privateConstructorUsedError;
  String? get theme => throw _privateConstructorUsedError;
  String? get locationID => throw _privateConstructorUsedError;
  String? get coverImg => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  String? get festID => throw _privateConstructorUsedError;
  Org? get fest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrgCopyWith<Org> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrgCopyWith<$Res> {
  factory $OrgCopyWith(Org value, $Res Function(Org) then) =
      _$OrgCopyWithImpl<$Res, Org>;
  @useResult
  $Res call(
      {String id,
      String name,
      String logo,
      OrgType orgType,
      OrgSubType orgSubType,
      StatusType statusType,
      int registrtionFee,
      String description,
      DateTime? startDate,
      DateTime? endDate,
      String? tagline,
      String? theme,
      String? locationID,
      String? coverImg,
      Location? location,
      String? festID,
      Org? fest});

  $LocationCopyWith<$Res>? get location;
  $OrgCopyWith<$Res>? get fest;
}

/// @nodoc
class _$OrgCopyWithImpl<$Res, $Val extends Org> implements $OrgCopyWith<$Res> {
  _$OrgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logo = null,
    Object? orgType = null,
    Object? orgSubType = null,
    Object? statusType = null,
    Object? registrtionFee = null,
    Object? description = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? tagline = freezed,
    Object? theme = freezed,
    Object? locationID = freezed,
    Object? coverImg = freezed,
    Object? location = freezed,
    Object? festID = freezed,
    Object? fest = freezed,
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
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      orgType: null == orgType
          ? _value.orgType
          : orgType // ignore: cast_nullable_to_non_nullable
              as OrgType,
      orgSubType: null == orgSubType
          ? _value.orgSubType
          : orgSubType // ignore: cast_nullable_to_non_nullable
              as OrgSubType,
      statusType: null == statusType
          ? _value.statusType
          : statusType // ignore: cast_nullable_to_non_nullable
              as StatusType,
      registrtionFee: null == registrtionFee
          ? _value.registrtionFee
          : registrtionFee // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      locationID: freezed == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImg: freezed == coverImg
          ? _value.coverImg
          : coverImg // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      festID: freezed == festID
          ? _value.festID
          : festID // ignore: cast_nullable_to_non_nullable
              as String?,
      fest: freezed == fest
          ? _value.fest
          : fest // ignore: cast_nullable_to_non_nullable
              as Org?,
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
  $OrgCopyWith<$Res>? get fest {
    if (_value.fest == null) {
      return null;
    }

    return $OrgCopyWith<$Res>(_value.fest!, (value) {
      return _then(_value.copyWith(fest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrgCopyWith<$Res> implements $OrgCopyWith<$Res> {
  factory _$$_OrgCopyWith(_$_Org value, $Res Function(_$_Org) then) =
      __$$_OrgCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String logo,
      OrgType orgType,
      OrgSubType orgSubType,
      StatusType statusType,
      int registrtionFee,
      String description,
      DateTime? startDate,
      DateTime? endDate,
      String? tagline,
      String? theme,
      String? locationID,
      String? coverImg,
      Location? location,
      String? festID,
      Org? fest});

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $OrgCopyWith<$Res>? get fest;
}

/// @nodoc
class __$$_OrgCopyWithImpl<$Res> extends _$OrgCopyWithImpl<$Res, _$_Org>
    implements _$$_OrgCopyWith<$Res> {
  __$$_OrgCopyWithImpl(_$_Org _value, $Res Function(_$_Org) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logo = null,
    Object? orgType = null,
    Object? orgSubType = null,
    Object? statusType = null,
    Object? registrtionFee = null,
    Object? description = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? tagline = freezed,
    Object? theme = freezed,
    Object? locationID = freezed,
    Object? coverImg = freezed,
    Object? location = freezed,
    Object? festID = freezed,
    Object? fest = freezed,
  }) {
    return _then(_$_Org(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      orgType: null == orgType
          ? _value.orgType
          : orgType // ignore: cast_nullable_to_non_nullable
              as OrgType,
      orgSubType: null == orgSubType
          ? _value.orgSubType
          : orgSubType // ignore: cast_nullable_to_non_nullable
              as OrgSubType,
      statusType: null == statusType
          ? _value.statusType
          : statusType // ignore: cast_nullable_to_non_nullable
              as StatusType,
      registrtionFee: null == registrtionFee
          ? _value.registrtionFee
          : registrtionFee // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      locationID: freezed == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImg: freezed == coverImg
          ? _value.coverImg
          : coverImg // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      festID: freezed == festID
          ? _value.festID
          : festID // ignore: cast_nullable_to_non_nullable
              as String?,
      fest: freezed == fest
          ? _value.fest
          : fest // ignore: cast_nullable_to_non_nullable
              as Org?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Org implements _Org {
  const _$_Org(
      {required this.id,
      required this.name,
      required this.logo,
      required this.orgType,
      required this.orgSubType,
      required this.statusType,
      required this.registrtionFee,
      required this.description,
      this.startDate,
      this.endDate,
      this.tagline,
      this.theme,
      this.locationID,
      this.coverImg,
      this.location,
      this.festID,
      this.fest});

  factory _$_Org.fromJson(Map<String, dynamic> json) => _$$_OrgFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String logo;
  @override
  final OrgType orgType;
  @override
  final OrgSubType orgSubType;
  @override
  final StatusType statusType;
  @override
  final int registrtionFee;
  @override
  final String description;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String? tagline;
  @override
  final String? theme;
  @override
  final String? locationID;
  @override
  final String? coverImg;
  @override
  final Location? location;
  @override
  final String? festID;
  @override
  final Org? fest;

  @override
  String toString() {
    return 'Org(id: $id, name: $name, logo: $logo, orgType: $orgType, orgSubType: $orgSubType, statusType: $statusType, registrtionFee: $registrtionFee, description: $description, startDate: $startDate, endDate: $endDate, tagline: $tagline, theme: $theme, locationID: $locationID, coverImg: $coverImg, location: $location, festID: $festID, fest: $fest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Org &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.orgType, orgType) || other.orgType == orgType) &&
            (identical(other.orgSubType, orgSubType) ||
                other.orgSubType == orgSubType) &&
            (identical(other.statusType, statusType) ||
                other.statusType == statusType) &&
            (identical(other.registrtionFee, registrtionFee) ||
                other.registrtionFee == registrtionFee) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.locationID, locationID) ||
                other.locationID == locationID) &&
            (identical(other.coverImg, coverImg) ||
                other.coverImg == coverImg) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.festID, festID) || other.festID == festID) &&
            (identical(other.fest, fest) || other.fest == fest));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      logo,
      orgType,
      orgSubType,
      statusType,
      registrtionFee,
      description,
      startDate,
      endDate,
      tagline,
      theme,
      locationID,
      coverImg,
      location,
      festID,
      fest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrgCopyWith<_$_Org> get copyWith =>
      __$$_OrgCopyWithImpl<_$_Org>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrgToJson(
      this,
    );
  }
}

abstract class _Org implements Org {
  const factory _Org(
      {required final String id,
      required final String name,
      required final String logo,
      required final OrgType orgType,
      required final OrgSubType orgSubType,
      required final StatusType statusType,
      required final int registrtionFee,
      required final String description,
      final DateTime? startDate,
      final DateTime? endDate,
      final String? tagline,
      final String? theme,
      final String? locationID,
      final String? coverImg,
      final Location? location,
      final String? festID,
      final Org? fest}) = _$_Org;

  factory _Org.fromJson(Map<String, dynamic> json) = _$_Org.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get logo;
  @override
  OrgType get orgType;
  @override
  OrgSubType get orgSubType;
  @override
  StatusType get statusType;
  @override
  int get registrtionFee;
  @override
  String get description;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  String? get tagline;
  @override
  String? get theme;
  @override
  String? get locationID;
  @override
  String? get coverImg;
  @override
  Location? get location;
  @override
  String? get festID;
  @override
  Org? get fest;
  @override
  @JsonKey(ignore: true)
  _$$_OrgCopyWith<_$_Org> get copyWith => throw _privateConstructorUsedError;
}
