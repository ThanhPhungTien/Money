import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money/enum/transaction_for/transaction_for.dart';
import 'package:money/enum/transaction_type/transaction_type.dart';

part 'transaction.g.dart';

part 'transaction.freezed.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    @Default('') String id,
    @Default('') String description,
    @Default('') String groupId,
    @Default('') String groupName,
    @Default(0) int value,
    @Default(TransactionType.outcome) int type,
    @Default(0) int createdTime,
    @Default(0) int updateTime,
    @Default(0) int mode,
    @Default(0) int year,
    @Default(-1) int month,
    @Default(TransactionFor.all) int transactionFor,
  }) = _Transaction;

  const Transaction._();

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  bool get isEmpty => id.isEmpty;
}
