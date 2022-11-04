// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      id: json['id'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'name': instance.name,
      'lat': instance.lat,
      'long': instance.long,
    };
