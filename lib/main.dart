import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:money/route/app_route.dart';
import 'package:money/route/route_name.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteName.homePage,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
