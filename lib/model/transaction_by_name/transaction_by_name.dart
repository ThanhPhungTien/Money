import 'package:json_annotation/json_annotation.dart';

import '../transaction/transaction.dart';

part 'transaction_by_name.g.dart';

@JsonSerializable(explicitToJson: true)
class TransactionByName {
  final String name;
  final List<Transaction> data;
  final int totalValue;
  final bool isOpen;

  const TransactionByName({
    this.name = '',
    this.totalValue = 0,
    this.data = const <Transaction>[],
    this.isOpen = false,
  });

  factory TransactionByName.fromJson(json) => _$TransactionByNameFromJson(json);

  Map<String,dynamic> toJson() => _$TransactionByNameToJson(this);

  TransactionByName copyWith({
    String? name,
    List<Transaction>? data,
    int? totalValue,
    bool? isOpen,
  }) {
    return TransactionByName(
      name: name ?? this.name,
      data: data ?? this.data,
      totalValue: totalValue ?? this.totalValue,
      isOpen: isOpen ?? this.isOpen,
    );
  }
}
