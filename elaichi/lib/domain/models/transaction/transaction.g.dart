// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      id: json['id'] as String,
      transactionID: json['transactionID'] as String,
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      userID: json['userID'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      amount: json['amount'] as int,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionID': instance.transactionID,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'user': instance.user,
      'userID': instance.userID,
      'timestamp': instance.timestamp.toIso8601String(),
      'amount': instance.amount,
      'comment': instance.comment,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.EVENT: 'EVENT',
  TransactionType.MERCH: 'MERCH',
  TransactionType.REGISTRATION: 'REGISTRATION',
};
