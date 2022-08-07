import 'package:json_annotation/json_annotation.dart';

import '../transaction/transaction.dart';

part 'group_transaction.g.dart';

@JsonSerializable(explicitToJson: true)
class GroupTransaction {
  final String dateTime;
  final List<Transaction> data;
  final int totalValue;

  const GroupTransaction({
    this.dateTime = '',
    this.totalValue = 0,
    this.data = const <Transaction>[],
  });

  factory GroupTransaction.fromJson(json) => _$GroupTransactionFromJson(json);

  Map<String,dynamic> toJson() => _$GroupTransactionToJson(this);

  GroupTransaction copyWith({
    String? dateTime,
    List<Transaction>? data,
    int? totalValue,
  }) {
    return GroupTransaction(
      dateTime: dateTime ?? this.dateTime,
      data: data ?? this.data,
      totalValue: totalValue ?? this.totalValue,
    );
  }
}
