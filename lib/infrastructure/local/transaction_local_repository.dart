import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:money/domain/transaction/transaction.dart' as model;
import 'package:money/enum/local_db/db_constant.dart';
import 'package:sqflite/sqflite.dart';

@singleton
class TransactionLocalRepository {
  final db = GetIt.I.get<Database>();

  Future<void> saveAll(List<model.Transaction> transactions) async {
    for (model.Transaction item in transactions) {
      db.insert(
        TableName.transaction,
        item.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<model.Transaction>> get(DateTime time) async {
    List<model.Transaction> data = <model.Transaction>[];

    List<Map<String, dynamic>> result = await db.query(
      TableName.transaction,
      where: '"year"=${time.year} AND "month"=${time.month}',
      orderBy: 'createdTime DESC',
    );

    for (Map<String, dynamic> item in result) {
      data.add(model.Transaction.fromJson(item));
    }

    return data;
  }
}
