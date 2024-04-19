import 'dart:async';

import 'package:animations/animations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:money/application/home/home_cubit.dart';
import 'package:money/enum/constant.dart';
import 'package:money/presentation/create_transaction/create_transaction_page.dart';
import 'package:money/presentation/report/report_page.dart';
import 'package:money/presentation/transaction_list/transaction_list_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeCubit bloc = HomeCubit();

  late StreamSubscription<List<ConnectivityResult>> subscription;

  List<ConnectivityResult> lastNetworkStatus = [];

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(elevation: 0, toolbarHeight: 0),
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
          child: const Icon(Icons.add),
          onPressed: () => CreateTransactionPage.show(context: context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is HomeStateInitial) {
              return BottomAppBar(
                child: Row(
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
                    ),
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

    try {
      var result = await Connectivity().checkConnectivity();
      prefs.setBool(Constant.hasInternet, result != ConnectivityResult.none);
    } on PlatformException catch (_) {
      prefs.setBool(Constant.hasInternet, false);
    }

    subscription = Connectivity().onConnectivityChanged.listen((result) {
      lastNetworkStatus = result;
      prefs.setBool(
          Constant.hasInternet, !result.contains(ConnectivityResult.none));
    });
  }
}
