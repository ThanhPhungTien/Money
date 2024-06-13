// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupTransactionImpl _$$GroupTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupTransactionImpl(
      dateTime: json['dateTime'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalValue: (json['totalValue'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$GroupTransactionImplToJson(
        _$GroupTransactionImpl instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime,
      'data': instance.data,
      'totalValue': instance.totalValue,
    };
