import 'dart:async';

import 'package:animations/animations.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:money/application/home/home_cubit.dart';
import 'package:money/enum/constant.dart';
import 'package:money/presentation/report/report_page.dart';
import 'package:money/presentation/transaction_list/transaction_list_view.dart';
import 'package:money/route/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeCubit bloc = HomeCubit();

  late StreamSubscription<ConnectivityResult> subscription;

  ConnectivityResult lastNetworkStatus = ConnectivityResult.none;

  List<Widget> pageList = <Widget>[
    const TransactionListView(),
    const ReportPage(),
  ];

  @override
  void initState() {
    _setupConnectivity();
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    subscription.cancel();
    GetIt.I.get<Database>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is HomeStateInitial) {
              return PageTransitionSwitcher(
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return FadeThroughTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                child: pageList[state.index],
              );
            }
            return Container();
          },
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 2,
          backgroundColor: Colors.green,
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () =>
              Navigator.pushNamed(context, RouteName.createTransaction),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is HomeStateInitial) {
              return BottomAppBar(
                child: ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => bloc.updateIndex(0),
                      icon: const Icon(Icons.wysiwyg),
                      tooltip: 'Giao dịch',
                    ),
                    IconButton(
                      onPressed: () => bloc.updateIndex(1),
                      icon: const Icon(Icons.bar_chart),
                      tooltip: 'Báo cáo',
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Future<void> _setupConnectivity() async {
    SharedPreferences prefs = GetIt.I.get<SharedPreferences>();

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await FirebaseMessaging.instance.subscribeToTopic('Money');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {});

    try {
      var result = await Connectivity().checkConnectivity();
      prefs.setBool(Constant.hasInternet, result != ConnectivityResult.none);
    } on PlatformException catch (_) {
      prefs.setBool(Constant.hasInternet, false);
    }

    final flushBar = Flushbar(
      icon: const Icon(
        Icons.wifi,
        color: Colors.white,
      ),
      title: 'Mừng quá',
      message: 'Đã khôi phục kết nối mạng',
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.green,
      flushbarStyle: FlushbarStyle.FLOATING,
    );

    final flushBarNoInternet = Flushbar(
      icon: const Icon(
        Icons.wifi_off,
        color: Colors.white,
      ),
      title: 'Ét ô Ét',
      message: 'Không có kết nối mạng',
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.black,
      flushbarStyle: FlushbarStyle.FLOATING,
    );

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none &&
          lastNetworkStatus != ConnectivityResult.none) {
        if (flushBar.isShowing()) {
          flushBar.dismiss();
        }
        flushBarNoInternet.show(context);
      } else if (lastNetworkStatus == ConnectivityResult.none &&
          flushBar.isShowing()) {
        if (flushBarNoInternet.isShowing()) {
          flushBarNoInternet.dismiss();
        }
        flushBar.show(context);
      }
      lastNetworkStatus = result;
      prefs.setBool(Constant.hasInternet, result != ConnectivityResult.none);
    });
  }
}
