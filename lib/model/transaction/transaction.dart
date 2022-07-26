import 'package:json_annotation/json_annotation.dart';
import 'package:money/enum/transaction_type/transaction_type.dart';

part 'transaction.g.dart';

@JsonSerializable(explicitToJson: true)
class Transaction {
  final String id;
  final String description;
  final String groupId;
  final String groupName;
  final int value;
  final int type;
  final int createdTime;
  final int updateTime;

  const Transaction({
    this.id = '',
    this.description = '',
    this.groupId = '',
    this.groupName = '',
    this.value = 0,
    this.type = TransactionType.outcome,
    this.createdTime = 0,
    this.updateTime = 0,
  });

  factory Transaction.fromJson(json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  bool isEmpty() => id.isEmpty;
}
