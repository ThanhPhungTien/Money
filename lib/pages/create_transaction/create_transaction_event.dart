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

class CreateTransactionEventCreate extends CreateTransactionEvent {

  final model.Transaction transaction;

  const CreateTransactionEventCreate(this.transaction);

  @override
  List<Object?> get props => [transaction];
}

class CreateTransactionEventInit extends CreateTransactionEvent {

  final DateTime dateTime;
  final Group group;

  const CreateTransactionEventInit(this.dateTime, this.group);

  @override
  List<Object?> get props => [];
}