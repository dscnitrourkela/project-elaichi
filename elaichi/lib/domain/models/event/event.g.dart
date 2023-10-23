// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      subHeading: json['subHeading'] as String,
      prizeMoney: json['prizeMoney'] as String,
      poster: json['poster'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      orgType: $enumDecode(_$OrgTypeEnumMap, json['orgType']),
      notes:
          (json['notes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      weekly: json['weekly'] as bool,
      repeatDay: $enumDecodeNullable(_$RepeatTypeEnumMap, json['repeatDay']),
      priority: json['priority'] as int,
      type: json['type'] as String?,
      status: $enumDecode(_$StatusTypeEnumMap, json['status']),
      locationID: json['locationID'] as String,
      pocID:
          (json['pocID'] as List<dynamic>?)?.map((e) => e as String).toList(),
      orgID:
          (json['orgID'] as List<dynamic>?)?.map((e) => e as String).toList(),
      org: (json['org'] as List<dynamic>?)
          ?.map((e) => Org.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      poc: json['poc'] == null
          ? null
          : User.fromJson(json['poc'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'subHeading': instance.subHeading,
      'prizeMoney': instance.prizeMoney,
      'poster': instance.poster,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'orgType': _$OrgTypeEnumMap[instance.orgType]!,
      'notes': instance.notes,
      'weekly': instance.weekly,
      'repeatDay': _$RepeatTypeEnumMap[instance.repeatDay],
      'priority': instance.priority,
      'type': instance.type,
      'status': _$StatusTypeEnumMap[instance.status]!,
      'locationID': instance.locationID,
      'pocID': instance.pocID,
      'orgID': instance.orgID,
      'org': instance.org,
      'location': instance.location,
      'poc': instance.poc,
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

const _$RepeatTypeEnumMap = {
  RepeatType.FRIDAY: 'FRIDAY',
  RepeatType.MONDAY: 'MONDAY',
  RepeatType.SATURDAY: 'SATURDAY',
  RepeatType.SUNDAY: 'SUNDAY',
  RepeatType.THURSDAY: 'THURSDAY',
  RepeatType.TUESDAY: 'TUESDAY',
  RepeatType.WEDNESDAY: 'WEDNESDAY',
};

const _$StatusTypeEnumMap = {
  StatusType.ACTIVE: 'ACTIVE',
  StatusType.DRAFT: 'DRAFT',
  StatusType.EXPIRED: 'EXPIRED',
};
