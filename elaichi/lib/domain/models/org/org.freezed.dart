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
  StatusType get status => throw _privateConstructorUsedError;
  int get registrationFee => throw _privateConstructorUsedError;
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
      _$OrgCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String logo,
      OrgType orgType,
      OrgSubType orgSubType,
      StatusType status,
      int registrationFee,
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
class _$OrgCopyWithImpl<$Res> implements $OrgCopyWith<$Res> {
  _$OrgCopyWithImpl(this._value, this._then);

  final Org _value;
  // ignore: unused_field
  final $Res Function(Org) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? orgType = freezed,
    Object? orgSubType = freezed,
    Object? status = freezed,
    Object? registrationFee = freezed,
    Object? description = freezed,
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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      orgType: orgType == freezed
          ? _value.orgType
          : orgType // ignore: cast_nullable_to_non_nullable
              as OrgType,
      orgSubType: orgSubType == freezed
          ? _value.orgSubType
          : orgSubType // ignore: cast_nullable_to_non_nullable
              as OrgSubType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      registrationFee: registrationFee == freezed
          ? _value.registrationFee
          : registrationFee // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tagline: tagline == freezed
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      locationID: locationID == freezed
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImg: coverImg == freezed
          ? _value.coverImg
          : coverImg // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      festID: festID == freezed
          ? _value.festID
          : festID // ignore: cast_nullable_to_non_nullable
              as String?,
      fest: fest == freezed
          ? _value.fest
          : fest // ignore: cast_nullable_to_non_nullable
              as Org?,
    ));
  }

  @override
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value));
    });
  }

  @override
  $OrgCopyWith<$Res>? get fest {
    if (_value.fest == null) {
      return null;
    }

    return $OrgCopyWith<$Res>(_value.fest!, (value) {
      return _then(_value.copyWith(fest: value));
    });
  }
}

/// @nodoc
abstract class _$$_OrgCopyWith<$Res> implements $OrgCopyWith<$Res> {
  factory _$$_OrgCopyWith(_$_Org value, $Res Function(_$_Org) then) =
      __$$_OrgCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String logo,
      OrgType orgType,
      OrgSubType orgSubType,
      StatusType status,
      int registrationFee,
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
class __$$_OrgCopyWithImpl<$Res> extends _$OrgCopyWithImpl<$Res>
    implements _$$_OrgCopyWith<$Res> {
  __$$_OrgCopyWithImpl(_$_Org _value, $Res Function(_$_Org) _then)
      : super(_value, (v) => _then(v as _$_Org));

  @override
  _$_Org get _value => super._value as _$_Org;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? orgType = freezed,
    Object? orgSubType = freezed,
    Object? status = freezed,
    Object? registrationFee = freezed,
    Object? description = freezed,
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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      orgType: orgType == freezed
          ? _value.orgType
          : orgType // ignore: cast_nullable_to_non_nullable
              as OrgType,
      orgSubType: orgSubType == freezed
          ? _value.orgSubType
          : orgSubType // ignore: cast_nullable_to_non_nullable
              as OrgSubType,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      registrationFee: registrationFee == freezed
          ? _value.registrationFee
          : registrationFee // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tagline: tagline == freezed
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      locationID: locationID == freezed
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImg: coverImg == freezed
          ? _value.coverImg
          : coverImg // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      festID: festID == freezed
          ? _value.festID
          : festID // ignore: cast_nullable_to_non_nullable
              as String?,
      fest: fest == freezed
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
      required this.status,
      required this.registrationFee,
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
  final StatusType status;
  @override
  final int registrationFee;
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
    return 'Org(id: $id, name: $name, logo: $logo, orgType: $orgType, orgSubType: $orgSubType, status: $status, registrationFee: $registrationFee, description: $description, startDate: $startDate, endDate: $endDate, tagline: $tagline, theme: $theme, locationID: $locationID, coverImg: $coverImg, location: $location, festID: $festID, fest: $fest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Org &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.logo, logo) &&
            const DeepCollectionEquality().equals(other.orgType, orgType) &&
            const DeepCollectionEquality()
                .equals(other.orgSubType, orgSubType) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.registrationFee, registrationFee) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.endDate, endDate) &&
            const DeepCollectionEquality().equals(other.tagline, tagline) &&
            const DeepCollectionEquality().equals(other.theme, theme) &&
            const DeepCollectionEquality()
                .equals(other.locationID, locationID) &&
            const DeepCollectionEquality().equals(other.coverImg, coverImg) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.festID, festID) &&
            const DeepCollectionEquality().equals(other.fest, fest));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(logo),
      const DeepCollectionEquality().hash(orgType),
      const DeepCollectionEquality().hash(orgSubType),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(registrationFee),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(startDate),
      const DeepCollectionEquality().hash(endDate),
      const DeepCollectionEquality().hash(tagline),
      const DeepCollectionEquality().hash(theme),
      const DeepCollectionEquality().hash(locationID),
      const DeepCollectionEquality().hash(coverImg),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(festID),
      const DeepCollectionEquality().hash(fest));

  @JsonKey(ignore: true)
  @override
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
      required final StatusType status,
      required final int registrationFee,
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
  StatusType get status;
  @override
  int get registrationFee;
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
