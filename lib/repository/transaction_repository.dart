import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:money/model/transaction/transaction.dart' as model;
import 'package:money/repository/transaction_local_repository.dart';

import '../enum/constant.dart';

class TransactionRepository {
  CollectionReference transactionCollection =
      FirebaseFirestore.instance.collection(Constant.transaction);

  CollectionReference reportCollection =
      FirebaseFirestore.instance.collection(Constant.report);

  TransactionLocalRepository transactionLocalRepository = GetIt.I.get();

  Future<void> create(model.Transaction transaction) async {
    await transactionCollection.add(transaction.toJson());
    updateReport(transaction.year, transaction.month);
  }

  Future<void> update(model.Transaction transaction) async {
    await transactionCollection
        .doc(transaction.id)
        .update(transaction.toJson());
    updateReport(transaction.year, transaction.month);
  }

  Future<void> updateReport(int year, int month) async {
    var data = await transactionCollection
        .where('year', isEqualTo: year)
        .where('month', isEqualTo: month)
        .get();

    List<model.Transaction> transaction = data.docs.map((e) {
      return model.Transaction.fromJson(e.data());
    }).toList();

    int total = transaction.isEmpty
        ? 0
        : transaction
            .map((e) => e.value * e.mode)
            .toList()
            .reduce((a, b) => a + b);

    log('total $total ');

    String id = '$year${month > 9 ? '$month' : '0$month'}';

    reportCollection.doc(id).set({'total': total});
  }
}
