part of 'create_transaction_bloc.dart';

abstract class CreateTransactionState extends Equatable {
  const CreateTransactionState();
}

class CreateTransactionInitial extends CreateTransactionState {
  @override
  List<Object> get props => [];
}

class CreateTransactionStateShowLoading extends CreateTransactionState {
  @override
  List<Object?> get props => [];
}

class CreateTransactionStateGotData extends CreateTransactionState {
  final DateTime dateTime;
  final Group group;

  const CreateTransactionStateGotData(this.dateTime, this.group);

  @override
  List<Object?> get props => [dateTime, group];
}

class CreateTransactionStateCreateDone extends CreateTransactionState {
  @override
  List<Object?> get props => [];
}
