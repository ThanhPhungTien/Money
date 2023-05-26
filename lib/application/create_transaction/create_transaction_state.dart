part of 'create_transaction_bloc.dart';

abstract class CreateTransactionState {
  const CreateTransactionState();
}

class CreateTransactionInitial extends CreateTransactionState {}

class CreateTransactionStateShowLoading extends CreateTransactionState {}

class CreateTransactionStateGotData extends CreateTransactionState {
  final DateTime dateTime;
  final Group group;
  final int transactionFor;

  const CreateTransactionStateGotData(
    this.dateTime,
    this.group,
    this.transactionFor,
  );
}

class CreateTransactionStateCreateDone extends CreateTransactionState {}
