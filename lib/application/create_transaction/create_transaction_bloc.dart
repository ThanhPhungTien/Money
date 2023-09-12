import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:money/domain/transaction/i_group_repository.dart';
import 'package:money/domain/transaction/i_transaction_repository.dart';
import 'package:money/domain/transaction/transaction_model.dart' as model;
import 'package:money/enum/transaction_for/transaction_for.dart';
import 'package:money/model/group/group.dart';

part 'create_transaction_event.dart';
part 'create_transaction_state.dart';

class CreateTransactionBloc
    extends Bloc<CreateTransactionEvent, CreateTransactionState> {
  CreateTransactionBloc() : super(CreateTransactionInitial()) {
    on<CreateTransactionEventInit>((event, emit) async {
      if (event.initData.isEmpty) {
        model.TransactionModel transaction =
            await GetIt.I.get<ITransactionRepository>().getLastTransaction();

        if (transaction.isEmpty) {
          emit(CreateTransactionStateGotData(
            DateTime.now(),
            const Group(),
            TransactionFor.all,
          ));
        } else {
          Group group = await groupRepository.view(id: transaction.groupId);
          emit(CreateTransactionStateGotData(
            DateTime.now(),
            group,
            transaction.transactionFor,
          ));
        }
      } else {
        Group group = await groupRepository.view(id: event.initData.groupId);

        emit(
          CreateTransactionStateGotData(
            DateTime.fromMillisecondsSinceEpoch(event.initData.createdTime),
            group,
            event.initData.transactionFor,
          ),
        );
      }
    });

    on<CreateTransactionEventUpdateGroup>((event, emit) {
      if (state is CreateTransactionStateGotData) {
        final currentState = state as CreateTransactionStateGotData;

        groupRepository.update(
          group: event.group.copyWith(
            updateTime: DateTime.now().millisecondsSinceEpoch,
          ),
        );

        emit(CreateTransactionStateGotData(
          currentState.dateTime,
          event.group,
          currentState.transactionFor,
        ));
      }
    });

    on<CreateTransactionEventUpdateDate>((event, emit) {
      if (state is CreateTransactionStateGotData) {
        final currentState = state as CreateTransactionStateGotData;
        emit(CreateTransactionStateGotData(
          event.dateTime,
          currentState.group,
          currentState.transactionFor,
        ));
      }
    });

    on<CreateTransactionEventCreate>((event, emit) async {
      if (event.transaction.isEmpty) {
        await transactionRepository.create(transaction: event.transaction);
      } else {
        await transactionRepository.update(transaction: event.transaction);
      }
      emit(CreateTransactionStateCreateDone());
    });

    on<CreateTransactionEventUpdateCreated>((event, emit) async {
      if (state is CreateTransactionStateGotData) {
        final currentState = state as CreateTransactionStateGotData;
        emit(CreateTransactionStateGotData(
          currentState.dateTime,
          currentState.group,
          event.transactionFor,
        ));
      }
    });
  }

  ITransactionRepository transactionRepository = GetIt.I.get();
  IGroupRepository groupRepository = GetIt.I.get();
}
