import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money/domain/transaction/transaction_model.dart';

part 'transaction_by_date.freezed.dart';

part 'transaction_by_date.g.dart';

@freezed
class TransactionByDate with _$TransactionByDate {
  const factory TransactionByDate({
    @Default('') String date,
    @Default(0) int totalValue,
    @Default(<TransactionModel>[]) List<TransactionModel> data,
  }) = _TransactionByDate;

  factory TransactionByDate.fromJson(Map<String, dynamic> json) =>
      _$TransactionByDateFromJson(json);
}
