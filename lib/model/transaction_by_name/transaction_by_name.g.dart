// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_by_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionByName _$TransactionByNameFromJson(Map<String, dynamic> json) =>
    TransactionByName(
      name: json['name'] as String? ?? '',
      totalValue: json['totalValue'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Transaction.fromJson(e))
              .toList() ??
          const <Transaction>[],
      isOpen: json['isOpen'] as bool? ?? false,
    );

Map<String, dynamic> _$TransactionByNameToJson(TransactionByName instance) =>
    <String, dynamic>{
      'name': instance.name,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'totalValue': instance.totalValue,
      'isOpen': instance.isOpen,
    };
