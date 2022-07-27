import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/pages/group_list/group_list_view.dart';
import 'package:money/pages/home/home_cubit.dart';
import 'package:money/pages/report/report_page.dart';
import 'package:money/pages/transaction_list/transaction_list_view.dart';
import 'package:money/route/route_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeCubit bloc = HomeCubit();

  List<Widget> pageList = <Widget>[
    const TransactionListView(),
    Container(),
    const ReportPage(),
  ];

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onPressed: () => Navigator.pushNamed(context, RouteName.createTransaction),
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
}
