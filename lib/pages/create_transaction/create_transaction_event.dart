part of 'create_transaction_bloc.dart';

abstract class CreateTransactionEvent extends Equatable {
  const CreateTransactionEvent();
}

class CreateTransactionEventUpdateData extends CreateTransactionEvent {
  @override
  List<Object?> get props => [];
}

class CreateTransactionEventCreate extends CreateTransactionEvent {
  @override
  List<Object?> get props => [];
}


