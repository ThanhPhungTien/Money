import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:money/enum/local_db/db_constant.dart';
import 'package:money/main.config.dart';
import 'package:money/presentation/tool/style.dart';
import 'package:money/route/app_route.dart';
import 'package:money/route/route_name.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'firebase_options.dart';

final GetIt getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);

  await configureDependencies();

  runApp(const MyApp());
}

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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: RouteName.homePage,
      onGenerateRoute: onGenerateRoute,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('vi', ''),
      supportedLocales: const [
        Locale('vi', ''),
        Locale('en', ''),
      ],
    );
  }
}
