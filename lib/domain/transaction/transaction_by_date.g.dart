// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_by_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionByDateImpl _$$TransactionByDateImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionByDateImpl(
      date: json['date'] as String? ?? '',
      totalValue: (json['totalValue'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TransactionModel>[],
    );

Map<String, dynamic> _$$TransactionByDateImplToJson(
        _$TransactionByDateImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'totalValue': instance.totalValue,
      'data': instance.data,
    };
