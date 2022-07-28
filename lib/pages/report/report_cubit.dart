import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

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
      for (model.Transaction item in result) {
        total += item.value * item.mode;
        if (item.mode == -1) {
          totalPaid += item.value;
        }else {
          totalEarn += item.value;
        }
      }

      emit(ReportStateGotData(time, total, totalEarn, totalPaid));
    });
  }

}
