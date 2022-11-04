// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Team _$$_TeamFromJson(Map<String, dynamic> json) => _$_Team(
      id: json['id'] as String,
      orgID: json['orgID'] as String,
      org: Org.fromJson(json['org'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      userID: json['userID'] as String,
      team: json['team'] as String?,
      priority: json['priority'] as int?,
      position: json['position'] as String?,
    );

Map<String, dynamic> _$$_TeamToJson(_$_Team instance) => <String, dynamic>{
      'id': instance.id,
      'orgID': instance.orgID,
      'org': instance.org,
      'user': instance.user,
      'userID': instance.userID,
      'team': instance.team,
      'priority': instance.priority,
      'position': instance.position,
    };
