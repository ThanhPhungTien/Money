// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      id: json['id'] as String? ?? '',
      description: json['description'] as String? ?? '',
      groupId: json['groupId'] as String? ?? '',
      groupName: json['groupName'] as String? ?? '',
      value: json['value'] as int? ?? 0,
      type: json['type'] as int? ?? TransactionType.outcome,
      createdTime: json['createdTime'] as int? ?? 0,
      updateTime: json['updateTime'] as int? ?? 0,
      mode: json['mode'] as int? ?? 0,
      year: json['year'] as int? ?? 0,
      month: json['month'] as int? ?? -1,
      transactionFor: json['transactionFor'] as int? ?? TransactionFor.all,
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'groupId': instance.groupId,
      'groupName': instance.groupName,
      'value': instance.value,
      'type': instance.type,
      'createdTime': instance.createdTime,
      'updateTime': instance.updateTime,
      'mode': instance.mode,
      'year': instance.year,
      'month': instance.month,
      'transactionFor': instance.transactionFor,
    };
