// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_by_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionByDate _$TransactionByDateFromJson(Map<String, dynamic> json) =>
    TransactionByDate(
      date: json['date'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Transaction.fromJson(e))
              .toList() ??
          const <Transaction>[],
      totalValue: json['totalValue'] as int? ?? 0,
    );

Map<String, dynamic> _$TransactionByDateToJson(TransactionByDate instance) =>
    <String, dynamic>{
      'date': instance.date,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'totalValue': instance.totalValue,
    };
