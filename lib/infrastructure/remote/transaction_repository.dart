import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money/domain/transaction/i_transaction_repository.dart';
import 'package:money/domain/transaction/transaction.dart' as model;

import 'package:injectable/injectable.dart';
import 'package:money/enum/constant.dart';

@Injectable(as: ITransactionRepository)
class TransactionRepository implements ITransactionRepository {
  CollectionReference transactionCollection =
      FirebaseFirestore.instance.collection(Constant.transaction);

  CollectionReference reportCollection =
      FirebaseFirestore.instance.collection(Constant.report);

  @override
  Future<void> create({required model.Transaction transaction}) async {
    await transactionCollection.add(transaction.toJson());
    updateReport(transaction.year, transaction.month);
  }

  @override
  Future<void> delete({required String id}) async {
    await transactionCollection.doc(id).delete();
  }

  @override
  Future<List<model.Transaction>> get() async {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Stream<List<model.Transaction>> listenReport(DateTime time) {
    return transactionCollection
        .withConverter<model.Transaction>(
          fromFirestore: (snapshot, _) =>
              model.Transaction.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        )
        .where('year', isEqualTo: time.year)
        .where('month', isEqualTo: time.month)
        .snapshots()
        .asyncMap((QuerySnapshot<model.Transaction> data) {
      List<model.Transaction> transactions =
          data.docs.map((e) => e.data().copyWith(id: e.id)).toList();
      return transactions;
    });
  }

  @override
  Stream<List<model.Transaction>> listenTransaction(DateTime time) {
    return transactionCollection
        .withConverter<model.Transaction>(
          fromFirestore: (snapshot, _) =>
              model.Transaction.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        )
        .where('year', isEqualTo: time.year)
        .where('month', isEqualTo: time.month)
        .orderBy('createdTime', descending: true)
        .snapshots()
        .asyncMap((QuerySnapshot<model.Transaction> data) {
      List<model.Transaction> transactions =
          data.docs.map((e) => e.data().copyWith(id: e.id)).toList();
      return transactions;
    });
  }

  @override
  Future<void> update({required model.Transaction transaction}) async {
    await transactionCollection
        .doc(transaction.id)
        .update(transaction.toJson());
    updateReport(transaction.year, transaction.month);
  }

  @override
  Future<model.Transaction> view({required String id}) async {
    // TODO: implement view
    throw UnimplementedError();
  }

  Future<void> updateReport(int year, int month) async {
    var data = await transactionCollection
        .where('year', isEqualTo: year)
        .where('month', isEqualTo: month)
        .get();

    List<model.Transaction> transaction = data.docs.map((e) {
      return model.Transaction.fromJson(e.data() as Map<String, dynamic>);
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

  @override
  Future<QuerySnapshot<Object?>> getReport() async {
    return reportCollection.get();
  }
}
