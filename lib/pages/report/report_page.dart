import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/pages/report/report_cubit.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../tool/tool.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  ReportCubit bloc = ReportCubit();

  @override
  void initState() {
    bloc.fetchData(DateTime.now());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ReportCubit, ReportState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is ReportStateGotData) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: Colors.white,
                    elevation: 1,
                    child: ListTile(
                      onTap: () => openSelectDate(state.time),
                      leading: const Icon(Icons.date_range),
                      title: Text(convertTime(
                          'MM/yyyy', state.time.millisecondsSinceEpoch, false)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: const Text('Tổng cộng'),
                  trailing: Text(moneyFormat(state.total)),
                ),
                ListTile(
                  title: const Text('Thu'),
                  trailing: Text(moneyFormat(state.totalEarn)),
                ),
                ListTile(
                  title: const Text('Chi'),
                  trailing: Text(moneyFormat(state.totalPaid)),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  openSelectDate(DateTime time) async {
    DateTime dateNow = DateTime.now();
    dynamic result = await showMonthPicker(
      context: context,
      initialDate: time,
      firstDate: DateTime(dateNow.year, dateNow.month - 1),
      lastDate: DateTime(dateNow.year + 1),
    );
    if (result != null && result is DateTime) {
      bloc.fetchData(result);
    }
  }
}
