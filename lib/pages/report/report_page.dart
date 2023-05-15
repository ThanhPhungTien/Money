import 'package:animations/animations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/pages/report/report_cubit.dart';
import 'package:money/pages/report_detail/report_detail_page.dart';
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
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    padding: const EdgeInsets.all(8),
                    children: [
                      ItemView(
                        title: 'Tổng cộng',
                        content: moneyFormat(state.total),
                        onTap: () {},
                        backgroundColor: Colors.blue.shade50,
                      ),
                      ItemView(
                        title: 'Đầu kỳ',
                        content: moneyFormat(state.remain),
                        onTap: () {},
                        backgroundColor: Colors.purple.shade50,
                      ),
                      OpenContainer(
                        closedBuilder: (context, action) {
                          return ItemView(
                            title: 'Thu',
                            content: moneyFormat(state.totalEarn),
                            onTap: () {},
                            backgroundColor: Colors.green.shade50,
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
                          return ItemView(
                            title: 'Chi',
                            content: moneyFormat(state.totalPaid),
                            onTap: () {},
                            backgroundColor: Colors.red.shade50,
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
                    ],
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
                                    color: Colors.blueAccent,
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
      roundedCornersRadius: 8,
      selectedMonthBackgroundColor: Colors.green,
      selectedMonthTextColor: Colors.white,
      unselectedMonthTextColor: Colors.green,
    );
    if (result != null && result is DateTime) {
      bloc.fetchData(result);
    }
  }
}

class ItemView extends StatelessWidget {
  const ItemView({
    Key? key,
    required this.title,
    required this.content,
    required this.onTap,
    required this.backgroundColor,
  }) : super(key: key);

  final String title;
  final String content;
  final VoidCallback onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: textTheme.labelSmall),
          Text(
            content,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xff1B1C21),
            ),
          ),
        ],
      ),
    );
  }
}
