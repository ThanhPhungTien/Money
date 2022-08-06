

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:money/model/transaction/transaction.dart' as model;

import '../enum/constant.dart';

class TransactionRepository {
  CollectionReference transactionCollection = FirebaseFirestore.instance.collection(
    Constant.transaction,
  );

  Future<void> create(model.Transaction transaction) async {

    await transactionCollection.add(transaction.toJson());
  }

  Future<void> update(model.Transaction transaction) async {
    log('data ${transaction.toJson()}');
    await transactionCollection.doc(transaction.id).update(transaction.toJson());
  }
}