// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'story.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Story _$StoryFromJson(Map<String, dynamic> json) {
  return _Story.fromJson(json);
}

/// @nodoc
mixin _$Story {
  String get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  Org get org => throw _privateConstructorUsedError;
  String get orgID => throw _privateConstructorUsedError;
  String? get linkTo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryCopyWith<Story> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryCopyWith<$Res> {
  factory $StoryCopyWith(Story value, $Res Function(Story) then) =
      _$StoryCopyWithImpl<$Res, Story>;
  @useResult
  $Res call({String id, String image, Org org, String orgID, String? linkTo});

  $OrgCopyWith<$Res> get org;
}

/// @nodoc
class _$StoryCopyWithImpl<$Res, $Val extends Story>
    implements $StoryCopyWith<$Res> {
  _$StoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? org = null,
    Object? orgID = null,
    Object? linkTo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      org: null == org
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as Org,
      orgID: null == orgID
          ? _value.orgID
          : orgID // ignore: cast_nullable_to_non_nullable
              as String,
      linkTo: freezed == linkTo
          ? _value.linkTo
          : linkTo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrgCopyWith<$Res> get org {
    return $OrgCopyWith<$Res>(_value.org, (value) {
      return _then(_value.copyWith(org: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StoryCopyWith<$Res> implements $StoryCopyWith<$Res> {
  factory _$$_StoryCopyWith(_$_Story value, $Res Function(_$_Story) then) =
      __$$_StoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String image, Org org, String orgID, String? linkTo});

  @override
  $OrgCopyWith<$Res> get org;
}

/// @nodoc
class __$$_StoryCopyWithImpl<$Res> extends _$StoryCopyWithImpl<$Res, _$_Story>
    implements _$$_StoryCopyWith<$Res> {
  __$$_StoryCopyWithImpl(_$_Story _value, $Res Function(_$_Story) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? org = null,
    Object? orgID = null,
    Object? linkTo = freezed,
  }) {
    return _then(_$_Story(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      org: null == org
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as Org,
      orgID: null == orgID
          ? _value.orgID
          : orgID // ignore: cast_nullable_to_non_nullable
              as String,
      linkTo: freezed == linkTo
          ? _value.linkTo
          : linkTo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Story implements _Story {
  const _$_Story(
      {required this.id,
      required this.image,
      required this.org,
      required this.orgID,
      this.linkTo});

  factory _$_Story.fromJson(Map<String, dynamic> json) =>
      _$$_StoryFromJson(json);

  @override
  final String id;
  @override
  final String image;
  @override
  final Org org;
  @override
  final String orgID;
  @override
  final String? linkTo;

  @override
  String toString() {
    return 'Story(id: $id, image: $image, org: $org, orgID: $orgID, linkTo: $linkTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Story &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.org, org) || other.org == org) &&
            (identical(other.orgID, orgID) || other.orgID == orgID) &&
            (identical(other.linkTo, linkTo) || other.linkTo == linkTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, image, org, orgID, linkTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoryCopyWith<_$_Story> get copyWith =>
      __$$_StoryCopyWithImpl<_$_Story>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoryToJson(
      this,
    );
  }
}

abstract class _Story implements Story {
  const factory _Story(
      {required final String id,
      required final String image,
      required final Org org,
      required final String orgID,
      final String? linkTo}) = _$_Story;

  factory _Story.fromJson(Map<String, dynamic> json) = _$_Story.fromJson;

  @override
  String get id;
  @override
  String get image;
  @override
  Org get org;
  @override
  String get orgID;
  @override
  String? get linkTo;
  @override
  @JsonKey(ignore: true)
  _$$_StoryCopyWith<_$_Story> get copyWith =>
      throw _privateConstructorUsedError;
}
