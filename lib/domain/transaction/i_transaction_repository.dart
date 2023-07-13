import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money/domain/transaction/transaction_model.dart';

abstract class ITransactionRepository {
  Future<void> create({required TransactionModel transaction});
  Future<void> update({required TransactionModel transaction});
  Future<void> delete({required String id});
  Stream<List<TransactionModel>> listenTransaction(DateTime time);
  Stream<List<TransactionModel>> listenReport(DateTime time);
  Future<QuerySnapshot<Object?>> getReport();
  Future<TransactionModel> getLastTransaction();
  Future<List<TransactionModel>> searchByWord(String query);
}
