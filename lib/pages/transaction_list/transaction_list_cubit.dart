import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:money/model/group_transaction/group_transaction.dart';
import 'package:money/repository/transaction_repository.dart';

import 'package:money/model/transaction/transaction.dart' as model;
import 'package:money/tool/tool.dart';

part 'transaction_list_state.dart';

class TransactionListCubit extends Cubit<TransactionListState> {
  TransactionListCubit() : super(TransactionListInitial());

  TransactionRepository transactionRepository = TransactionRepository();

  Future<void> fetchData(DateTime time) async {
    transactionRepository.transactionCollection
        .where('year', isEqualTo: time.year)
        .where('month', isEqualTo: time.month)
        .snapshots()
        .listen((QuerySnapshot<Object?> data) {
      List<GroupTransaction> result = data.docs.map((e) {
        model.Transaction transaction =
            model.Transaction.fromJson(e.data()).copyWith(id: e.id);
        return GroupTransaction(
          dateTime: convertTime('dd/MM/yyyy', transaction.createdTime, false),
          data: [transaction],
        );
      }).toList();

      List<GroupTransaction> mData = <GroupTransaction>[];

      for (GroupTransaction item in result) {
        if (mData.isEmpty) {
          mData.add(item);
        } else {
          int index =
              mData.indexWhere((element) => element.dateTime == item.dateTime);
          if (index == -1) {
            mData.add(item);
          } else {
            mData[index].data.addAll(item.data);
          }
        }
      }
      emit(TransactionListStateGotData(mData, time));
    });
  }

  Future<void> deleteTransaction(String id) async {
    await transactionRepository.transactionCollection.doc(id).delete();
  }
}
