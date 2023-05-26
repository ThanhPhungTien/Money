import 'package:money/domain/transaction/i_transaction_repository.dart';
import 'package:money/domain/transaction/transaction.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: ITransactionRepository)
class TransactionRepository implements ITransactionRepository {
  @override
  Future<Transaction> create({required Transaction transaction}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Transaction> delete({required String id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Transaction>> get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Stream<List<Transaction>> listenReport() {
    // TODO: implement listenReport
    throw UnimplementedError();
  }

  @override
  Stream<List<Transaction>> listenTransaction() {
    // TODO: implement listenTransaction
    throw UnimplementedError();
  }

  @override
  Future<Transaction> update({required Transaction transaction}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<Transaction> view({required String id}) {
    // TODO: implement view
    throw UnimplementedError();
  }
}
