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
  final int mode;
  final int year;
  final int month;

  const Transaction({
    this.id = '',
    this.description = '',
    this.groupId = '',
    this.groupName = '',
    this.value = 0,
    this.type = TransactionType.outcome,
    this.createdTime = 0,
    this.updateTime = 0,
    this.year = 0,
    this.month = 0,
    this.mode = -1,
  });

  factory Transaction.fromJson(json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  bool isEmpty() => id.isEmpty;

  Transaction copyWith({
    String? id,
    String? description,
    String? groupId,
    String? groupName,
    int? value,
    int? type,
    int? createdTime,
    int? updateTime,
    int? mode,
    int? year,
    int? month,
  }) {
    return Transaction(
      id: id ?? this.id,
      description: description ?? this.description,
      groupId: groupId ?? this.groupId,
      groupName: groupName ?? this.groupName,
      value: value ?? this.value,
      type: type ?? this.type,
      createdTime: createdTime ?? this.createdTime,
      updateTime: updateTime ?? this.updateTime,
      mode: mode ?? this.mode,
      year: year ?? this.year,
      month: month ?? this.month,
    );
  }
}
