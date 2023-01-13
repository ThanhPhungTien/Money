import 'package:json_annotation/json_annotation.dart';
import 'package:money/model/transaction/transaction.dart';

part 'transaction_by_date.g.dart';

@JsonSerializable(explicitToJson: true)
class TransactionByDate {
  final String date;
  final List<Transaction> data;
  final int totalValue;

  const TransactionByDate({
    this.date = '',
    this.data = const <Transaction>[],
    this.totalValue = 0,
  });

  factory TransactionByDate.fromJson(json) => _$TransactionByDateFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionByDateToJson(this);

  TransactionByDate copyWith({
    String? date,
    List<Transaction>? data,
    int? totalValue,
  }) {
    return TransactionByDate(
      date: date ?? this.date,
      data: data ?? this.data,
      totalValue: totalValue ?? this.totalValue,
    );
  }
}
