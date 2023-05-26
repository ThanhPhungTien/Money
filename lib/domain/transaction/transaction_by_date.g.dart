// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_by_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionByDate _$$_TransactionByDateFromJson(Map<String, dynamic> json) =>
    _$_TransactionByDate(
      date: json['date'] as String? ?? '',
      totalValue: json['totalValue'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Transaction>[],
    );

Map<String, dynamic> _$$_TransactionByDateToJson(
        _$_TransactionByDate instance) =>
    <String, dynamic>{
      'date': instance.date,
      'totalValue': instance.totalValue,
      'data': instance.data,
    };
