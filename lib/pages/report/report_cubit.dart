import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:money/model/transaction_by_name/transaction_by_name.dart';

import '../../repository/transaction_repository.dart';

import 'package:money/model/transaction/transaction.dart' as model;

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitial());
  TransactionRepository transactionRepository = TransactionRepository();

  Future<void> fetchData(DateTime time) async {
    transactionRepository.transactionCollection
        .where('year', isEqualTo: time.year)
        .where('month', isEqualTo: time.month)
        .snapshots()
        .listen((QuerySnapshot<Object?> data) {
      List<model.Transaction> result = data.docs
          .map((e) => model.Transaction.fromJson(e.data()).copyWith(id: e.id))
          .toList();

      int total = 0;
      int totalEarn = 0;
      int totalPaid = 0;
      List<TransactionByName> paidList = <TransactionByName>[];
      List<TransactionByName> earnList = <TransactionByName>[];

      for (model.Transaction item in result) {
        total += item.value * item.mode;
        if (item.mode == -1) {
          totalPaid += item.value;

          int index =
              paidList.indexWhere((element) => element.name == item.groupName);
          if (index == -1) {
            paidList.add(TransactionByName(
              name: item.groupName,
              data: [item],
              totalValue: item.value * item.mode,
            ));
          } else {
            paidList[index] = paidList[index].copyWith(
              totalValue: paidList[index].totalValue + item.value * item.mode,
            );
            paidList[index].data.add(item);
            paidList[index]
                .data
                .sort((a, b) => a.createdTime.compareTo(b.createdTime));
          }
        } else {
          totalEarn += item.value;
          int index =
              earnList.indexWhere((element) => element.name == item.groupName);
          if (index == -1) {
            earnList.add(TransactionByName(
              name: item.groupName,
              data: [item],
              totalValue: item.value * item.mode,
              isOpen: false,
            ));
          } else {
            earnList[index] = earnList[index].copyWith(
              totalValue: earnList[index].totalValue + item.value * item.mode,
            );
            earnList[index].data.add(item);
            earnList[index]
                .data
                .sort((a, b) => a.createdTime.compareTo(b.createdTime));
          }
        }
      }
      if (!isClosed) {
        emit(ReportStateGotData(
          time,
          total,
          totalEarn,
          totalPaid,
          paidList,
          earnList,
        ));
      }
    });
  }
}
