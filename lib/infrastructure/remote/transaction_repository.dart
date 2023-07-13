import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:money/domain/transaction/i_transaction_repository.dart';
import 'package:money/domain/transaction/transaction_model.dart';
import 'package:money/enum/constant.dart';
import 'package:money/presentation/tool/diacritics.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: ITransactionRepository)
class TransactionRepository implements ITransactionRepository {
  CollectionReference transactionCollection =
      FirebaseFirestore.instance.collection(Constant.transaction);

  CollectionReference reportCollection =
      FirebaseFirestore.instance.collection(Constant.report);

  @override
  Future<void> create({required TransactionModel transaction}) async {
    await transactionCollection.add(transaction.toJson());

    GetIt.I
        .get<SharedPreferences>()
        .setString(Constant.transaction, json.encode(transaction.toJson()));

    updateReport(transaction.year, transaction.month);
  }

  @override
  Future<void> delete({required String id}) async {
    await transactionCollection.doc(id).delete();
  }

  @override
  Stream<List<TransactionModel>> listenReport(DateTime time) {
    return transactionCollection
        .withConverter<TransactionModel>(
          fromFirestore: (snapshot, _) =>
              TransactionModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        )
        .where('year', isEqualTo: time.year)
        .where('month', isEqualTo: time.month)
        .snapshots()
        .asyncMap((QuerySnapshot<TransactionModel> data) {
      List<TransactionModel> transactions =
          data.docs.map((e) => e.data().copyWith(id: e.id)).toList();
      return transactions;
    });
  }

  @override
  Stream<List<TransactionModel>> listenTransaction(DateTime time) {
    return transactionCollection
        .withConverter<TransactionModel>(
          fromFirestore: (snapshot, _) =>
              TransactionModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        )
        .where('year', isEqualTo: time.year)
        .where('month', isEqualTo: time.month)
        .orderBy('createdTime', descending: true)
        .snapshots()
        .asyncMap((QuerySnapshot<TransactionModel> data) {
      List<TransactionModel> transactions =
          data.docs.map((e) => e.data().copyWith(id: e.id)).toList();
      return transactions;
    });
  }

  @override
  Future<void> update({required TransactionModel transaction}) async {
    await transactionCollection
        .doc(transaction.id)
        .update(transaction.toJson());

    GetIt.I
        .get<SharedPreferences>()
        .setString(Constant.transaction, json.encode(transaction.toJson()));

    updateReport(transaction.year, transaction.month);
  }

  Future<void> updateReport(int year, int month) async {
    var data = await transactionCollection
        .where('year', isEqualTo: year)
        .where('month', isEqualTo: month)
        .get();

    List<TransactionModel> transaction = data.docs.map((e) {
      return TransactionModel.fromJson(e.data() as Map<String, dynamic>);
    }).toList();

    int total = transaction.isEmpty
        ? 0
        : transaction
            .map((e) => e.value * e.mode)
            .toList()
            .reduce((a, b) => a + b);

    String id = '$year${month > 9 ? '$month' : '0$month'}';

    reportCollection.doc(id).set({'total': total});
  }

  @override
  Future<QuerySnapshot<Object?>> getReport() async {
    return reportCollection.get();
  }

  @override
  Future<TransactionModel> getLastTransaction() async {
    String lastTransaction =
        GetIt.I.get<SharedPreferences>().getString(Constant.transaction) ?? '';
    return lastTransaction.isEmpty
        ? const TransactionModel()
        : TransactionModel.fromJson(json.decode(lastTransaction));
  }

  @override
  Future<List<TransactionModel>> searchByWord(String query) async {
    List<String> searchOptions = <String>[];
    String text = query.trim().toLowerCase().withoutDiacritics;

    for (int i = 0; i <= text.length - 3; i++) {
      searchOptions.add(text.substring(i, i + 3));
    }
    QuerySnapshot<TransactionModel> result = await transactionCollection
        .withConverter<TransactionModel>(
          fromFirestore: (snapshot, _) =>
              TransactionModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        )
        .where('searchOptions', arrayContainsAny: searchOptions)
        .limit(10)
        .get();

    log('searchByWord ${result.docs.length}');
    return result.docs.map((e) => e.data().copyWith(id: e.id)).toList();
  }
}
