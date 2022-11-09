// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Story _$$_StoryFromJson(Map<String, dynamic> json) => _$_Story(
      id: json['id'] as String,
      image: json['image'] as String,
      org: Org.fromJson(json['org'] as Map<String, dynamic>),
      orgID: json['orgID'] as String,
      linkTo: json['linkTo'] as String?,
    );

Map<String, dynamic> _$$_StoryToJson(_$_Story instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'org': instance.org,
      'orgID': instance.orgID,
      'linkTo': instance.linkTo,
    };
