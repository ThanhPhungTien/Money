

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:money/model/transaction/transaction.dart' as model;

import '../enum/constant.dart';

class TransactionRepository {
  CollectionReference transactionCollection = FirebaseFirestore.instance.collection(
    Constant.transaction,
  );

  Future<void> createTransaction(model.Transaction transaction) async {

    await transactionCollection.add(transaction.toJson());
  }
}