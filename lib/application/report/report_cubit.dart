import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:money/domain/transaction/transaction.dart' as model;
import 'package:money/domain/transaction/transaction_by_date.dart';
import 'package:money/domain/transaction/transaction_by_name.dart';
import 'package:money/presentation/tool/tool.dart';

import '../../infrastructure/remote/transaction_repository.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitial());
  TransactionRepository transactionRepository = TransactionRepository();

  Future<void> fetchData(DateTime time) async {
    transactionRepository.transactionCollection
        .withConverter<model.Transaction>(
          fromFirestore: (snapshot, _) =>
              model.Transaction.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        )
        .where('year', isEqualTo: time.year)
        .where('month', isEqualTo: time.month)
        .snapshots()
        .listen((QuerySnapshot<model.Transaction> data) async {
      List<model.Transaction> result =
          data.docs.map((e) => e.data().copyWith(id: e.id)).toList();

      int total = 0;
      int totalEarn = 0;
      int totalPaid = 0;
      int remain = 0;
      int maxPaid = 0;
      List<TransactionByName> paidList = <TransactionByName>[];
      List<TransactionByName> earnList = <TransactionByName>[];
      List<TransactionByDate> paidDateList = <TransactionByDate>[];
      List<TransactionByDate> earnDateList = <TransactionByDate>[];

      result.sort((a, b) => a.createdTime.compareTo(b.createdTime));

      for (model.Transaction item in result) {
        total += item.value * item.mode;
        if (item.mode == -1) {
          if (maxPaid > item.value) {
            maxPaid = item.value;
          }
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

          int indexDate = paidDateList.indexWhere((element) =>
              element.date ==
              DateTime.fromMillisecondsSinceEpoch(item.createdTime)
                  .day
                  .toString());
          if (indexDate == -1) {
            paidDateList.add(TransactionByDate(
              date: DateTime.fromMillisecondsSinceEpoch(item.createdTime)
                  .day
                  .toString(),
              data: [item],
              totalValue: item.value * item.mode,
            ));
          } else {
            paidDateList[indexDate] = paidDateList[indexDate].copyWith(
              totalValue:
                  paidDateList[indexDate].totalValue + item.value * item.mode,
            );
            paidDateList[indexDate].data.add(item);
            paidDateList[indexDate]
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

          int indexDate = earnDateList.indexWhere((element) =>
              element.date ==
              DateTime.fromMillisecondsSinceEpoch(item.createdTime)
                  .day
                  .toString());
          if (indexDate == -1) {
            earnDateList.add(TransactionByDate(
              date: DateTime.fromMillisecondsSinceEpoch(item.createdTime)
                  .day
                  .toString(),
              data: [item],
              totalValue: item.value * item.mode,
            ));
          } else {
            earnDateList[indexDate] = earnDateList[indexDate].copyWith(
              totalValue:
                  earnDateList[indexDate].totalValue + item.value * item.mode,
            );
            earnDateList[indexDate].data.add(item);
            earnDateList[indexDate]
                .data
                .sort((a, b) => a.createdTime.compareTo(b.createdTime));
          }
        }
      }
      if (!isClosed) {
        var dataReport = await transactionRepository.reportCollection.get();

        for (var item in dataReport.docs) {
          int idValue = int.parse(item.id);

          if (idValue <
              int.parse(
                  convertTime('yyyyMM', time.millisecondsSinceEpoch, false))) {
            remain += item.get('total') as int;
          }
        }

        emit(ReportStateGotData(
          time,
          total + remain,
          totalEarn,
          totalPaid,
          paidList,
          earnList,
          remain,
          maxPaid,
          paidDateList,
          earnDateList,
        ));
      }
    });
  }
}