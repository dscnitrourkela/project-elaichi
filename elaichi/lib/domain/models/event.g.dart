// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      id: json['id'] as String,
      name: json['name'] as String,
      category: $enumDecode(_$EventCategoryEnumMap, json['category']),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      startTime: DateTime.parse(json['startTime'] as String),
      durationInMin: json['durationInMin'] as int,
      location: json['location'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': _$EventCategoryEnumMap[instance.category]!,
      'type': _$EventTypeEnumMap[instance.type]!,
      'startTime': instance.startTime.toIso8601String(),
      'durationInMin': instance.durationInMin,
      'location': instance.location,
      'image': instance.image,
      'description': instance.description,
    };

const _$EventCategoryEnumMap = {
  EventCategory.ACADEMIC: 'ACADEMIC',
  EventCategory.MESS: 'MESS',
  EventCategory.CLUB: 'CLUB',
  EventCategory.INSTITUTE: 'INSTITUTE',
};

const _$EventTypeEnumMap = {
  EventType.ONET: 'ONET',
  EventType.WEEKLY: 'WEEKLY',
};
