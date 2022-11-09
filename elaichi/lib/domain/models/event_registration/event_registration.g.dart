// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventRegistration _$$_EventRegistrationFromJson(Map<String, dynamic> json) =>
    _$_EventRegistration(
      id: json['id'] as String,
      eventID: json['eventID'] as String,
      userID: json['userID'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      event: json['event'] == null
          ? null
          : Event.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EventRegistrationToJson(
        _$_EventRegistration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventID': instance.eventID,
      'userID': instance.userID,
      'user': instance.user,
      'event': instance.event,
    };
