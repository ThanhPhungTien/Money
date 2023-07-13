part of 'create_transaction_bloc.dart';

abstract class CreateTransactionEvent extends Equatable {
  const CreateTransactionEvent();
}

class CreateTransactionEventUpdateGroup extends CreateTransactionEvent {
  final Group group;

  const CreateTransactionEventUpdateGroup(this.group);

  @override
  List<Object?> get props => [group];
}

class CreateTransactionEventUpdateDate extends CreateTransactionEvent {
  final DateTime dateTime;

  const CreateTransactionEventUpdateDate(this.dateTime);

  @override
  List<Object?> get props => [dateTime];
}

class CreateTransactionEventUpdateCreated extends CreateTransactionEvent {
  final int transactionFor;

  const CreateTransactionEventUpdateCreated(this.transactionFor);

  @override
  List<Object?> get props => [];
}

class CreateTransactionEventCreate extends CreateTransactionEvent {
  final model.TransactionModel transaction;

  const CreateTransactionEventCreate(this.transaction);

  @override
  List<Object?> get props => [transaction];
}

class CreateTransactionEventInit extends CreateTransactionEvent {
  final model.TransactionModel initData;

  const CreateTransactionEventInit(this.initData);

  @override
  List<Object?> get props => [];
}
