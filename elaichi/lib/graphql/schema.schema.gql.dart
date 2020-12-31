// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: sort_unnamed_constructors_first
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: constant_identifier_names

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:elaichi/graphql/serializers.gql.dart' as _i1;
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i2;

part 'schema.schema.gql.g.dart';

abstract class GAccessLevelInputType
    implements Built<GAccessLevelInputType, GAccessLevelInputTypeBuilder> {
  GAccessLevelInputType._();

  factory GAccessLevelInputType(
          [Function(GAccessLevelInputTypeBuilder b) updates]) =
      _$GAccessLevelInputType;

  @nullable
  String get level;
  @nullable
  String get name;
  @nullable
  String get relation;
  @nullable
  String get club;
  @nullable
  String get user;
  static Serializer<GAccessLevelInputType> get serializer =>
      _$gAccessLevelInputTypeSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GAccessLevelInputType.serializer, this)
          as Map<String, dynamic>;
  static GAccessLevelInputType fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAccessLevelInputType.serializer, json);
}

class GCacheControlScope extends EnumClass {
  const GCacheControlScope._(String name) : super(name);

  static const GCacheControlScope PUBLIC = _$gCacheControlScopePUBLIC;

  static const GCacheControlScope PRIVATE = _$gCacheControlScopePRIVATE;

  static Serializer<GCacheControlScope> get serializer =>
      _$gCacheControlScopeSerializer;
  static BuiltSet<GCacheControlScope> get values => _$gCacheControlScopeValues;
  static GCacheControlScope valueOf(String name) =>
      _$gCacheControlScopeValueOf(name);
}

abstract class GClubInputType
    implements Built<GClubInputType, GClubInputTypeBuilder> {
  GClubInputType._();

  factory GClubInputType([Function(GClubInputTypeBuilder b) updates]) =
      _$GClubInputType;

  @nullable
  String get clubName;
  @nullable
  BuiltList<GAccessLevelInputType> get memberAccess;
  @nullable
  String get facAd;
  @nullable
  String get logo;
  @nullable
  BuiltList<String> get events;
  @nullable
  String get society;
  @nullable
  String get domain;
  static Serializer<GClubInputType> get serializer =>
      _$gClubInputTypeSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GClubInputType.serializer, this)
          as Map<String, dynamic>;
  static GClubInputType fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GClubInputType.serializer, json);
}

abstract class GDateTime implements Built<GDateTime, GDateTimeBuilder> {
  GDateTime._();

  factory GDateTime([String value]) =>
      _$GDateTime((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDateTime> get serializer =>
      _i2.DefaultScalarSerializer<GDateTime>(
          (Object serialized) => GDateTime(serialized));
}

abstract class GEventInputType
    implements Built<GEventInputType, GEventInputTypeBuilder> {
  GEventInputType._();

  factory GEventInputType([Function(GEventInputTypeBuilder b) updates]) =
      _$GEventInputType;

  @nullable
  String get organizer;
  @nullable
  String get eventName;
  @nullable
  String get startDateTime;
  @nullable
  String get venue;
  @nullable
  String get endDateTime;
  @nullable
  int get registrationPrice;
  @nullable
  int get registrationCount;
  @nullable
  String get otherDescription;
  @nullable
  BuiltList<String> get attendees;
  @nullable
  String get announcements;
  @nullable
  String get link;
  @nullable
  String get picture;
  static Serializer<GEventInputType> get serializer =>
      _$gEventInputTypeSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GEventInputType.serializer, this)
          as Map<String, dynamic>;
  static GEventInputType fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GEventInputType.serializer, json);
}

abstract class GStoryInputType
    implements Built<GStoryInputType, GStoryInputTypeBuilder> {
  GStoryInputType._();

  factory GStoryInputType([Function(GStoryInputTypeBuilder b) updates]) =
      _$GStoryInputType;

  @nullable
  String get author;
  @nullable
  String get event;
  @nullable
  String get asset;
  @nullable
  String get assetType;
  @nullable
  String get description;
  static Serializer<GStoryInputType> get serializer =>
      _$gStoryInputTypeSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GStoryInputType.serializer, this)
          as Map<String, dynamic>;
  static GStoryInputType fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GStoryInputType.serializer, json);
}

abstract class GUpload implements Built<GUpload, GUploadBuilder> {
  GUpload._();

  factory GUpload([String value]) =>
      _$GUpload((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GUpload> get serializer =>
      _i2.DefaultScalarSerializer<GUpload>(
          (Object serialized) => GUpload(serialized));
}

abstract class GUserInputType
    implements Built<GUserInputType, GUserInputTypeBuilder> {
  GUserInputType._();

  factory GUserInputType([Function(GUserInputTypeBuilder b) updates]) =
      _$GUserInputType;

  @nullable
  String get name;
  @nullable
  String get username;
  @nullable
  String get gmailAuthMail;
  @nullable
  String get instituteId;
  @nullable
  String get mobile;
  @nullable
  String get emergencyContact;
  @nullable
  String get displayPicture;
  static Serializer<GUserInputType> get serializer =>
      _$gUserInputTypeSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GUserInputType.serializer, this)
          as Map<String, dynamic>;
  static GUserInputType fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUserInputType.serializer, json);
}

abstract class GVenueInputType
    implements Built<GVenueInputType, GVenueInputTypeBuilder> {
  GVenueInputType._();

  factory GVenueInputType([Function(GVenueInputTypeBuilder b) updates]) =
      _$GVenueInputType;

  @nullable
  String get name;
  @nullable
  String get description;
  static Serializer<GVenueInputType> get serializer =>
      _$gVenueInputTypeSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GVenueInputType.serializer, this)
          as Map<String, dynamic>;
  static GVenueInputType fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GVenueInputType.serializer, json);
}
