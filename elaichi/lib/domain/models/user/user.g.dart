// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      email: json['email'] as String,
      ca: (json['ca'] as List<dynamic>).map((e) => e as String).toList(),
      festID:
          (json['festID'] as List<dynamic>).map((e) => e as String).toList(),
      fests: (json['fests'] as List<dynamic>)
          .map((e) => Org.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      uid: json['uid'] as String?,
      photo: json['photo'] as String?,
      gender: $enumDecodeNullable(_$GenderTypeEnumMap, json['gender']),
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      state: json['state'] as String?,
      city: json['city'] as String?,
      college: json['college'] as String?,
      stream: json['stream'] as String?,
      mobile: json['mobile'] as String?,
      selfID: json['selfID'] as String?,
      refferedBy: json['refferedBy'] as String?,
      rollNumber: json['rollNumber'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'ca': instance.ca,
      'festID': instance.festID,
      'fests': instance.fests,
      'name': instance.name,
      'uid': instance.uid,
      'photo': instance.photo,
      'gender': _$GenderTypeEnumMap[instance.gender],
      'dob': instance.dob?.toIso8601String(),
      'state': instance.state,
      'city': instance.city,
      'college': instance.college,
      'stream': instance.stream,
      'mobile': instance.mobile,
      'selfID': instance.selfID,
      'refferedBy': instance.refferedBy,
      'rollNumber': instance.rollNumber,
    };

const _$GenderTypeEnumMap = {
  GenderType.MALE: 'MALE',
  GenderType.FEMALE: 'FEMALE',
  GenderType.OTHERS: 'OTHERS',
};
