import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:money/enum/constant.dart';
import 'package:money/enum/local_db/db_constant.dart';
import 'package:money/model/group/group.dart';
import 'package:sqflite/sqlite_api.dart';

@singleton
class GroupLocalRepository {
  final db = GetIt.I.get<Database>();

  Future<void> saveAll(List<Group> groups) async {
    for (Group item in groups) {
      db.insert(
        TableName.group,
        item.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> save(Group group) async {
    db.insert(
      TableName.group,
      group.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Group>> get() async {
    List<Group> data = <Group>[];
    List<Map<String, dynamic>> result = await db.query(TableName.group);

    for (Map<String, dynamic> item in result) {
      data.add(Group.fromJson(item));
    }

    return data;
  }

  Future<Group> view(String id) async {
    List<Group> data = <Group>[];
    List<Map<String, dynamic>> result = await db.query(
      TableName.group,
      where: '"${Constant.id}"=$id',
    );

    for (Map<String, dynamic> item in result) {
      data.add(Group.fromJson(item));
    }

    return data.isEmpty ? const Group() : data.first;
  }
}
