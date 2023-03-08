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
                          style: textTheme.titleLarge?.copyWith(
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
                      style: textTheme.headlineSmall?.copyWith(
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
                      style: textTheme.headlineSmall?.copyWith(
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
                          style: textTheme.titleLarge?.copyWith(
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
                          style: textTheme.titleLarge?.copyWith(
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      height: sizePie,
                      width: (32 * state.paidDateList.length).toDouble(),
                      child: BarChart(
                        BarChartData(
                          minY: 0,
                          backgroundColor: Colors.white,
                          barGroups: state.paidDateList.map(
                            (e) {
                              return BarChartGroupData(
                                x: state.paidDateList.indexOf(e),
                                barRods: [
                                  BarChartRodData(
                                    toY: (e.totalValue / 1000).abs().toDouble(),
                                    color: Colors.red,
                                    width: 16,
                                  )
                                ],
                              );
                            },
                          ).toList(),
                          borderData: FlBorderData(show: false),
                          barTouchData: BarTouchData(
                            touchTooltipData: BarTouchTooltipData(
                              getTooltipItem: (
                                BarChartGroupData group,
                                int groupIndex,
                                BarChartRodData rod,
                                int rodIndex,
                              ) =>
                                  BarTooltipItem(
                                moneyFormat(rod.toY.toInt() + 1000),
                                textTheme.labelMedium!,
                              ),
                            ),
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) => Text(
                                    state.paidDateList[value.toInt()].date),
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                                interval: 1,
                                getTitlesWidget: (value, meta) =>
                                    Text(value.toString()),
                              ),
                            ),
                          ),
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
      firstDate: DateTime(dateNow.year - 1),
      lastDate: DateTime(dateNow.year + 1),
      headerColor: Colors.green,
    );
    if (result != null && result is DateTime) {
      bloc.fetchData(result);
    }
  }
}
