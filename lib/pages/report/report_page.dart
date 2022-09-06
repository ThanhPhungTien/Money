import 'dart:math';

import 'package:animations/animations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/pages/report/report_cubit.dart';
import 'package:money/pages/report_detail/report_detail_page.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';

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
    TextTheme textTheme = Theme.of(context).textTheme;
    double sizePie = (MediaQuery.of(context).size.width - 32);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ReportCubit, ReportState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is ReportStateGotData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: Colors.green,
                      elevation: 1,
                      borderRadius: BorderRadius.circular(8),
                      child: ListTile(
                        onTap: () => openSelectDate(state.time),
                        minLeadingWidth: 0,
                        leading:
                            const Icon(Icons.date_range, color: Colors.white),
                        title: Text(
                          convertTime(
                            'MM/yyyy',
                            state.time.millisecondsSinceEpoch,
                            false,
                          ),
                          style: textTheme.headline6?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    title: const Text('Tổng cộng'),
                    trailing: Text(
                      moneyFormat(state.total),
                      style: textTheme.headline5?.copyWith(
                        color: state.total > 0 ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black,
                    endIndent: 16,
                    indent: 16,
                  ),
                  ListTile(
                    title: const Text('Đầu kỳ'),
                    trailing: Text(
                      moneyFormat(state.remain),
                      style: textTheme.headline5?.copyWith(
                        color: state.remain > 0 ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black,
                    endIndent: 16,
                    indent: 16,
                  ),
                  OpenContainer(
                    closedBuilder: (context, action) {
                      return ListTile(
                        title: const Text('Thu'),
                        trailing: Text(
                          moneyFormat(state.totalEarn),
                          style: textTheme.headline6?.copyWith(
                            color: Colors.green,
                          ),
                        ),
                      );
                    },
                    openBuilder: (context, action) {
                      return ReportDetailPage(
                        data: state.earnList,
                        title:
                            'Chi tiết thu ${convertTime('MM/yyyy', state.time.millisecondsSinceEpoch, false)}',
                      );
                    },
                    closedElevation: 0,
                  ),
                  OpenContainer(
                    closedElevation: 0,
                    closedBuilder: (context, action) {
                      return ListTile(
                        title: const Text('Chi'),
                        trailing: Text(
                          moneyFormat(state.totalPaid),
                          style: textTheme.headline6?.copyWith(
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                    openBuilder: (context, action) {
                      return ReportDetailPage(
                        data: state.paidList,
                        title:
                            'Chi tiết chi ${convertTime('MM/yyyy', state.time.millisecondsSinceEpoch, false)}',
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    height: sizePie,
                    child: PieChart(
                      PieChartData(
                        sections: state.paidList
                            .map((e) => PieChartSectionData(
                                  title:
                                      '${(e.totalValue.abs() / state.totalPaid * 100).round()}%',
                                  titleStyle: textTheme.subtitle2,
                                  value: e.totalValue.abs() /
                                      state.totalPaid *
                                      100,
                                  showTitle: true,
                                  color: Colors.accents.elementAt(
                                      Random().nextInt(Colors.accents.length)),
                                  titlePositionPercentageOffset: 1.2,
                                  radius: sizePie / 4,
                                ))
                            .toList(),
                        centerSpaceRadius: sizePie / 6,
                        startDegreeOffset: 0,
                        pieTouchData: PieTouchData(
                          enabled: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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

  openReportDetail(bool isPaid) async {}
}
