part of 'transaction_list_cubit.dart';

@immutable
abstract class TransactionListState {}

class TransactionListInitial extends TransactionListState {}

class TransactionListStateGotData extends TransactionListState {
  final List<GroupTransaction> data;
  final DateTime time;
  final int totalValue;

  TransactionListStateGotData(this.data, this.time, this.totalValue);
}
