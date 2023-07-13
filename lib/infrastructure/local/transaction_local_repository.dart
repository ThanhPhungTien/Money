import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:money/domain/transaction/transaction_model.dart';
import 'package:money/enum/constant.dart';
import 'package:money/enum/local_db/db_constant.dart';
import 'package:sqflite/sqflite.dart';

@singleton
class TransactionLocalRepository {
  final db = GetIt.I.get<Database>();

  Future<void> saveAll(List<TransactionModel> transactions) async {
    log('save all');
    for (TransactionModel item in transactions) {
      Map<String, dynamic> itemJson = item.toJson();
      itemJson[Constant.searchOptions] = item.searchOptions.join(',');
      db.insert(
        TableName.transaction,
        itemJson,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<TransactionModel>> get(DateTime time) async {
    List<TransactionModel> data = <TransactionModel>[];

    log('get local db ');
    List<Map<String, dynamic>> result = await db.query(
      TableName.transaction,
      where: '"year"=${time.year} AND "month"=${time.month}',
      orderBy: 'createdTime DESC',
    );

    for (Map<String, dynamic> item in result) {
      List<String> searchOptions =
          item[Constant.searchOptions].toString().split(',');

      item[Constant.searchOptions] = searchOptions;
      data.add(TransactionModel.fromJson(item));
    }

    return data;
  }
}
