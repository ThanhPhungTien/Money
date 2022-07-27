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
