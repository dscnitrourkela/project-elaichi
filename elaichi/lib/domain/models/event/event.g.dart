// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      description: json['description'] as String,
      endDate: DateTime.parse(json['endDate'] as String),
      id: json['id'] as String,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      locationID: json['locationID'] as String,
      name: json['name'] as String,
      notes: (json['notes'] as List<dynamic>).map((e) => e as String).toList(),
      org: (json['org'] as List<dynamic>)
          .map((e) => Org.fromJson(e as Map<String, dynamic>))
          .toList(),
      orgID: (json['orgID'] as List<dynamic>).map((e) => e as String).toList(),
      orgType: $enumDecode(_$OrgTypeEnumMap, json['orgType']),
      poc: User.fromJson(json['poc'] as Map<String, dynamic>),
      pocID: (json['pocID'] as List<dynamic>).map((e) => e as String).toList(),
      poster: json['poster'] as String,
      proiority: json['proiority'] as int,
      repeatDay: $enumDecodeNullable(_$RepeatTypeEnumMap, json['repeatDay']),
      startDate: DateTime.parse(json['startDate'] as String),
      status: $enumDecode(_$StatusTypeEnumMap, json['status']),
      type: json['type'] as String?,
      weekly: json['weekly'] as bool,
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'description': instance.description,
      'endDate': instance.endDate.toIso8601String(),
      'id': instance.id,
      'location': instance.location,
      'locationID': instance.locationID,
      'name': instance.name,
      'notes': instance.notes,
      'org': instance.org,
      'orgID': instance.orgID,
      'orgType': _$OrgTypeEnumMap[instance.orgType]!,
      'poc': instance.poc,
      'pocID': instance.pocID,
      'poster': instance.poster,
      'proiority': instance.proiority,
      'repeatDay': _$RepeatTypeEnumMap[instance.repeatDay],
      'startDate': instance.startDate.toIso8601String(),
      'status': _$StatusTypeEnumMap[instance.status]!,
      'type': instance.type,
      'weekly': instance.weekly,
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
