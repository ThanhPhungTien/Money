// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      id: json['id'] as String? ?? '',
      description: json['description'] as String? ?? '',
      groupId: json['groupId'] as String? ?? '',
      groupName: json['groupName'] as String? ?? '',
      searchOptions: (json['searchOptions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      value: (json['value'] as num?)?.toInt() ?? 0,
      type: (json['type'] as num?)?.toInt() ?? TransactionType.outcome,
      createdTime: (json['createdTime'] as num?)?.toInt() ?? 0,
      updateTime: (json['updateTime'] as num?)?.toInt() ?? 0,
      mode: (json['mode'] as num?)?.toInt() ?? 0,
      year: (json['year'] as num?)?.toInt() ?? 0,
      month: (json['month'] as num?)?.toInt() ?? -1,
      transactionFor:
          (json['transactionFor'] as num?)?.toInt() ?? TransactionFor.all,
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'groupId': instance.groupId,
      'groupName': instance.groupName,
      'searchOptions': instance.searchOptions,
      'value': instance.value,
      'type': instance.type,
      'createdTime': instance.createdTime,
      'updateTime': instance.updateTime,
      'mode': instance.mode,
      'year': instance.year,
      'month': instance.month,
      'transactionFor': instance.transactionFor,
    };
