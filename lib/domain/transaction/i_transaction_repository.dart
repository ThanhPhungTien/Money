import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:money/domain/transaction/transaction.dart';

abstract class ITransactionRepository {
  Future<void> create({required Transaction transaction});
  Future<void> update({required Transaction transaction});
  Future<void> delete({required String id});
  Future<Transaction> view({required String id});
  Future<List<Transaction>> get();
  Stream<List<Transaction>> listenTransaction(DateTime time);
  Stream<List<Transaction>> listenReport(DateTime time);
  Future<firestore.QuerySnapshot<Object?>> getReport();
}
