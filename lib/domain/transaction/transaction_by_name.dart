import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction_model.dart';

part 'transaction_by_name.g.dart';

part 'transaction_by_name.freezed.dart';

@freezed
class TransactionByName with _$TransactionByName {
  const factory TransactionByName({
    @Default('') String name,
    @Default(<TransactionModel>[]) List<TransactionModel> data,
    @Default(0) int totalValue,
    @Default(false) bool isOpen,
  }) = _TransactionByName;

  factory TransactionByName.fromJson(Map<String, dynamic> json) =>
      _$TransactionByNameFromJson(json);
}
