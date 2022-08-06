import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money/repository/group_repository.dart';
import 'package:money/repository/transaction_repository.dart';
import 'package:money/route/app_route.dart';
import 'package:money/route/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: false);

  await configureDependencies();

  runApp(const MyApp());
}

Future<void> configureDependencies() async {
  final GetIt getIt = GetIt.instance;

  SharedPreferences prefs = await SharedPreferences.getInstance();

  getIt.registerSingletonAsync<SharedPreferences>(() async => prefs);

  getIt.registerSingletonAsync(
    () async => GroupRepository(),
    dependsOn: [SharedPreferences],
  );
  getIt.registerSingletonAsync(
    () async => TransactionRepository(),
    dependsOn: [SharedPreferences],
  );

  await getIt.allReady();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money',
      theme: ThemeData(
        primarySwatch: Colors.green,
        backgroundColor: Colors.grey,
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.black,
        ),

      ),
      initialRoute: RouteName.homePage,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
