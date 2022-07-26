// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as String? ?? '',
      description: json['description'] as String? ?? '',
      groupId: json['groupId'] as String? ?? '',
      value: json['value'] as int? ?? 0,
      type: json['type'] as int? ?? TransactionType.outcome,
      createdTime: json['createdTime'] as int? ?? 0,
      updateTime: json['updateTime'] as int? ?? 0,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'groupId': instance.groupId,
      'value': instance.value,
      'type': instance.type,
      'createdTime': instance.createdTime,
      'updateTime': instance.updateTime,
    };
