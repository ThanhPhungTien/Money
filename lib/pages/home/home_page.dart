import 'dart:async';
import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:money/enum/constant.dart';
import 'package:money/pages/home/home_cubit.dart';
import 'package:money/pages/report/report_page.dart';
import 'package:money/pages/transaction_list/transaction_list_view.dart';
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

  List<Widget> pageList = <Widget>[
    const TransactionListView(),
    Container(),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is HomeInitial) {
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
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is HomeInitial) {
            return NavigationBar(
              selectedIndex: state.index,
              onDestinationSelected: (index) {
                if (index != 1) {
                  bloc.updateIndex(index);
                }
              },
              destinations: [
                const NavigationDestination(
                  icon: Icon(Icons.fact_check),
                  label: 'Giao dịch',
                ),
                NavigationDestination(
                  icon: FloatingActionButton(
                    onPressed: () => Navigator.pushNamed(
                        context, RouteName.createTransaction),
                    child: const Icon(Icons.add),
                  ),
                  label: '',
                ),
                const NavigationDestination(
                  icon: Icon(Icons.bar_chart),
                  label: 'Báo cáo',
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Future<void> _setupConnectivity() async {
    SharedPreferences prefs = GetIt.I.get<SharedPreferences>();

    try {
      var result = await Connectivity().checkConnectivity();
      prefs.setBool(Constant.hasInternet, result != ConnectivityResult.none);
    } on PlatformException catch (_) {
      prefs.setBool(Constant.hasInternet, false);
    }

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
          log('result $result');
      _showConnectionMessage(result != ConnectivityResult.none);
      prefs.setBool(Constant.hasInternet, result != ConnectivityResult.none);
    });
  }

  void _showConnectionMessage(bool hasConnection) {
    Flushbar(
      icon: Icon(
        hasConnection ? Icons.wifi : Icons.wifi_off,
        color: Colors.white,
      ),
      title: 'Ét ô Ét',
      message:
          hasConnection ? 'Đã khôi phục kết nối mạng' : 'Không có kết nối mạng',
      duration: const Duration(seconds: 3),
      backgroundColor: hasConnection ? Colors.green : Colors.black,
      flushbarStyle: FlushbarStyle.FLOATING,
    ).show(context);
  }
}
