// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_by_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionByName _$$_TransactionByNameFromJson(Map<String, dynamic> json) =>
    _$_TransactionByName(
      name: json['name'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Transaction>[],
      totalValue: json['totalValue'] as int? ?? 0,
      isOpen: json['isOpen'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TransactionByNameToJson(
        _$_TransactionByName instance) =>
    <String, dynamic>{
      'name': instance.name,
      'data': instance.data,
      'totalValue': instance.totalValue,
      'isOpen': instance.isOpen,
    };
