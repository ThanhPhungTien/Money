import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money/model/transaction/transaction.dart' as model;

import '../enum/constant.dart';

class TransactionRepository {
  CollectionReference transactionCollection =
      FirebaseFirestore.instance.collection(Constant.transaction);

  CollectionReference reportCollection =
      FirebaseFirestore.instance.collection(Constant.report);

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
    log('updateReport $year $month');
    var data = await transactionCollection
        .where('year', isEqualTo: year)
        .where('month', isEqualTo: month)
        .get();

    var dataLast = await transactionCollection
        .where('year', isEqualTo: month == 1 ? year - 1 : year)
        .where('month', isEqualTo: month == 1 ? 12 : month - 1)
        .get();

    log('message');

    List<model.Transaction> transaction = data.docs.map((e) {
      return model.Transaction.fromJson(e.data());
    }).toList();

    List<model.Transaction> transactionLast = dataLast.docs.map((e) {
      return model.Transaction.fromJson(e.data());
    }).toList();

    int total = transaction.isEmpty ? 0: transaction
        .map((e) => e.value * e.mode)
        .toList()
        .reduce((a, b) => a + b);

    int remain = transactionLast.isEmpty ? 0:  transactionLast
        .map((e) => e.value * e.mode)
        .toList()
        .reduce((a, b) => a + b);
    log('total $total');

    reportCollection.doc('$year$month').set({'total': total + remain});
  }
}
