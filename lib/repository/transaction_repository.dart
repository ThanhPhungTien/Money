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
    await transactionCollection
        .where('year', isEqualTo: year)
        .where('month', isEqualTo: month)
        .get()
        .then((data) {
      log('message');

      List<model.Transaction> transaction = data.docs.map((e) {
        return model.Transaction.fromJson(e.data());
      }).toList();

      int total =
          transaction.map((e) => e.value * e.mode).toList().reduce((a, b) => a + b);

      log('total $total');

      reportCollection.doc('$year$month').set({'total': total});
    });
  }
}
