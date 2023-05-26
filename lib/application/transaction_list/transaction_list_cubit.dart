import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:money/enum/constant.dart';
import 'package:money/model/group_transaction/group_transaction.dart';
import 'package:money/domain/transaction/transaction.dart' as model;
import 'package:money/infrastructure/local/transaction_local_repository.dart';
import 'package:money/infrastructure/remote/transaction_repository.dart';
import 'package:money/presentation/tool/tool.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'transaction_list_state.dart';

class TransactionListCubit extends Cubit<TransactionListState> {
  TransactionListCubit() : super(TransactionListInitial());

  TransactionRepository transactionRepository = TransactionRepository();
  TransactionLocalRepository transactionLocalRepository = GetIt.I.get();

  Future<void> fetchData(DateTime time) async {
    if (GetIt.I.get<SharedPreferences>().getBool(Constant.hasInternet) ??
        false) {
      transactionRepository.transactionCollection
          .withConverter<model.Transaction>(
            fromFirestore: (snapshot, _) =>
                model.Transaction.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson(),
          )
          .where('year', isEqualTo: time.year)
          .where('month', isEqualTo: time.month)
          .orderBy('createdTime', descending: true)
          .snapshots()
          .listen((QuerySnapshot<model.Transaction> data) async {
        List<model.Transaction> transactions =
            data.docs.map((e) => e.data().copyWith(id: e.id)).toList();

        transactionLocalRepository.saveAll(transactions);
        List<GroupTransaction> mData = await mapToGroup(transactions);

        if (!isClosed) {
          emit(TransactionListStateGotData(mData, time));
        }
      });
    } else {
      List<model.Transaction> transactions =
          await transactionLocalRepository.get(time);
      emit(TransactionListStateGotData(await mapToGroup(transactions), time));
    }
  }

  Future<void> deleteTransaction(String id) async {
    await transactionRepository.transactionCollection.doc(id).delete();
  }

  Future<List<GroupTransaction>> mapToGroup(
      List<model.Transaction> transactions) async {
    List<GroupTransaction> mData = <GroupTransaction>[];
    List<GroupTransaction> result = transactions.map((transaction) {
      return GroupTransaction(
        dateTime:
            convertTime('EEEE, dd/MM/yyyy', transaction.createdTime, false),
        data: [transaction],
        totalValue: transaction.value * transaction.mode,
      );
    }).toList();

    for (GroupTransaction item in result) {
      if (mData.isEmpty) {
        mData.add(item);
      } else {
        int index =
            mData.indexWhere((element) => element.dateTime == item.dateTime);
        if (index == -1) {
          mData.add(item);
        } else {
          mData[index] = mData[index].copyWith(
            data: mData[index].data + item.data,
          );

          mData[index] = mData[index].copyWith(
            totalValue: mData[index].totalValue + item.totalValue,
          );
        }
      }
    }
    return mData;
  }
}
