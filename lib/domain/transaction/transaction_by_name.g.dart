// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_by_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionByNameImpl _$$TransactionByNameImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionByNameImpl(
      name: json['name'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TransactionModel>[],
      totalValue: json['totalValue'] as int? ?? 0,
      isOpen: json['isOpen'] as bool? ?? false,
    );

Map<String, dynamic> _$$TransactionByNameImplToJson(
        _$TransactionByNameImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'data': instance.data,
      'totalValue': instance.totalValue,
      'isOpen': instance.isOpen,
    };
