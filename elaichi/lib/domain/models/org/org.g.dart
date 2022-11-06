// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Org _$$_OrgFromJson(Map<String, dynamic> json) => _$_Org(
      id: json['id'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String,
      orgType: $enumDecode(_$OrgTypeEnumMap, json['orgType']),
      orgSubType: $enumDecode(_$OrgSubTypeEnumMap, json['orgSubType']),
      status: $enumDecode(_$StatusTypeEnumMap, json['status']),
      registrationFee: json['registrationFee'] as int,
      description: json['description'] as String,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      tagline: json['tagline'] as String?,
      theme: json['theme'] as String?,
      locationID: json['locationID'] as String?,
      coverImg: json['coverImg'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      festID: json['festID'] as String?,
      fest: json['fest'] == null
          ? null
          : Org.fromJson(json['fest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OrgToJson(_$_Org instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'orgType': _$OrgTypeEnumMap[instance.orgType]!,
      'orgSubType': _$OrgSubTypeEnumMap[instance.orgSubType]!,
      'status': _$StatusTypeEnumMap[instance.status]!,
      'registrationFee': instance.registrationFee,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'tagline': instance.tagline,
      'theme': instance.theme,
      'locationID': instance.locationID,
      'coverImg': instance.coverImg,
      'location': instance.location,
      'festID': instance.festID,
      'fest': instance.fest,
    };

const _$OrgTypeEnumMap = {
  OrgType.BRANCH: 'BRANCH',
  OrgType.BRANCH_SEM: 'BRANCH_SEM',
  OrgType.CLUB: 'CLUB',
  OrgType.FEST: 'FEST',
  OrgType.HOSTEL: 'HOSTEL',
  OrgType.INSTITUTE: 'INSTITUTE',
  OrgType.MESS: 'MESS',
};

const _$OrgSubTypeEnumMap = {
  OrgSubType.CULTURAL: 'CULTURAL',
  OrgSubType.FMS: 'FMS',
  OrgSubType.HACKATHON: 'HACKATHON',
  OrgSubType.LITERARY: 'LITERARY',
  OrgSubType.SPORTS: 'SPORTS',
  OrgSubType.TECHNICAL: 'TECHNICAL',
};

const _$StatusTypeEnumMap = {
  StatusType.ACTIVE: 'ACTIVE',
  StatusType.DRAFT: 'DRAFT',
  StatusType.EXPIRED: 'EXPIRED',
};
