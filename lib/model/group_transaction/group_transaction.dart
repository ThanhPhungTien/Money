import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/transaction/transaction_model.dart';

part 'group_transaction.freezed.dart';
part 'group_transaction.g.dart';

@freezed
class GroupTransaction with _$GroupTransaction {
  const factory GroupTransaction({
    @Default('') String dateTime,
    @Default([]) List<TransactionModel> data,
    @Default(0) int totalValue,
  }) = _GroupTransaction;

  factory GroupTransaction.fromJson(Map<String, dynamic> json) =>
      _$GroupTransactionFromJson(json);
}
