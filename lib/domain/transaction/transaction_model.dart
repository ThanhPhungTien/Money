import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money/enum/transaction_for/transaction_for.dart';
import 'package:money/enum/transaction_type/transaction_type.dart';
part 'transaction_model.g.dart';

part 'transaction_model.freezed.dart';

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    @Default('') String id,
    @Default('') String description,
    @Default('') String groupId,
    @Default('') String groupName,
    @Default([]) List<String> searchOptions,
    @Default(0) int value,
    @Default(TransactionType.outcome) int type,
    @Default(0) int createdTime,
    @Default(0) int updateTime,
    @Default(0) int mode,
    @Default(0) int year,
    @Default(-1) int month,
    @Default(TransactionFor.all) int transactionFor,
  }) = _TransactionModel;

  const TransactionModel._();

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  bool get isEmpty => id.isEmpty;
}
