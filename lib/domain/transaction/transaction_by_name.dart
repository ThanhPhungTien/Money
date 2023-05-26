import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction.dart';

part 'transaction_by_name.g.dart';

part 'transaction_by_name.freezed.dart';

@freezed
class TransactionByName with _$TransactionByName {
  const factory TransactionByName({
    @Default('') String name,
    @Default(<Transaction>[]) List<Transaction> data,
    @Default(0) int totalValue,
    @Default(false) bool isOpen,
  }) = _TransactionByName;

  factory TransactionByName.fromJson(Map<String, dynamic> json) =>
      _$TransactionByNameFromJson(json);
}
