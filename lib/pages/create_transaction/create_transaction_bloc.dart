import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:money/model/group/group.dart';
import 'package:money/model/transaction/transaction.dart' as model;
import 'package:money/repository/group_repository.dart';
import 'package:money/repository/transaction_repository.dart';

part 'create_transaction_event.dart';

part 'create_transaction_state.dart';

class CreateTransactionBloc
    extends Bloc<CreateTransactionEvent, CreateTransactionState> {
  CreateTransactionBloc() : super(CreateTransactionInitial()) {
    on<CreateTransactionEventInit>((event, emit) async {
      log('CreateTransactionEventInit ${event.initData.toJson()}');
      if (event.initData.isEmpty()) {
        emit(CreateTransactionStateGotData(DateTime.now(), const Group()));
      } else {
        Group group = await groupRepository.view(event.initData.groupId);
        emit(
          CreateTransactionStateGotData(
            DateTime.fromMillisecondsSinceEpoch(event.initData.createdTime),
            group,
          ),
        );
      }
    });

    on<CreateTransactionEventUpdateGroup>((event, emit) {
      if (state is CreateTransactionStateGotData) {
        final currentState = state as CreateTransactionStateGotData;

        emit(CreateTransactionStateGotData(currentState.dateTime, event.group));
      }
    });

    on<CreateTransactionEventUpdateDate>((event, emit) {
      if (state is CreateTransactionStateGotData) {
        final currentState = state as CreateTransactionStateGotData;
        emit(CreateTransactionStateGotData(event.dateTime, currentState.group));
      }
    });

    on<CreateTransactionEventCreate>((event, emit) async {
      log('CreateTransactionEventCreate ${event.transaction.toJson()}');
      if (event.transaction.isEmpty()) {
        await transactionRepository.create(event.transaction);
      } else {
        await transactionRepository.update(event.transaction);
      }
      emit(CreateTransactionStateCreateDone());
    });
  }

  TransactionRepository transactionRepository = GetIt.I.get();
  GroupRepository groupRepository = GetIt.I.get();
}
