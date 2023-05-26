import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money/domain/transaction/transaction.dart';

part 'transaction_by_date.freezed.dart';

part 'transaction_by_date.g.dart';

@freezed
class TransactionByDate with _$TransactionByDate {
  const factory TransactionByDate({
    @Default('') String date,
    @Default(0) int totalValue,
    @Default(<Transaction>[]) List<Transaction> data,
  }) = _TransactionByDate;

  factory TransactionByDate.fromJson(Map<String, dynamic> json) =>
      _$TransactionByDateFromJson(json);
}
