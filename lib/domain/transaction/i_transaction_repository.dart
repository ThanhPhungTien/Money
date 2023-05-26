import 'package:money/domain/transaction/transaction.dart';

abstract class ITransactionRepository {
  Future<Transaction> create({required Transaction transaction});
  Future<Transaction> update({required Transaction transaction});
  Future<Transaction> delete({required String id});
  Future<Transaction> view({required String id});
  Future<List<Transaction>> get();
  Stream<List<Transaction>> listenTransaction();
  Stream<List<Transaction>> listenReport();
}
