import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:money/enum/local_db/db_constant.dart';
import 'package:money/presentation/configure_injection.config.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(initializerName: 'configDI')
Future<void> configureDependencies() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  getIt.registerSingletonAsync<SharedPreferences>(() async => prefs);

  //setup db
  getIt.registerSingletonAsync(
    () async {
      String databasesPath = await getDatabasesPath();
      String path = join(databasesPath, DBConfig.name);

      return openDatabase(
        path,
        version: 2,
        onCreate: (Database db, int version) async {
          await db.execute(DBCommand.createTransactionTable);
          await db.execute(DBCommand.createGroupTable);
        },
      );
    },
    dependsOn: [SharedPreferences],
  );

  await getIt.allReady();

  getIt.configDI();
}
