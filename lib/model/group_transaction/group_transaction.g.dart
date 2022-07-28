// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupTransaction _$GroupTransactionFromJson(Map<String, dynamic> json) =>
    GroupTransaction(
      dateTime: json['dateTime'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Transaction.fromJson(e))
              .toList() ??
          const <Transaction>[],
    );

Map<String, dynamic> _$GroupTransactionToJson(GroupTransaction instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
