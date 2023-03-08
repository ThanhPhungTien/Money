// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroupTransaction _$$_GroupTransactionFromJson(Map<String, dynamic> json) =>
    _$_GroupTransaction(
      dateTime: json['dateTime'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalValue: json['totalValue'] as int? ?? 0,
    );

Map<String, dynamic> _$$_GroupTransactionToJson(_$_GroupTransaction instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime,
      'data': instance.data,
      'totalValue': instance.totalValue,
    };
