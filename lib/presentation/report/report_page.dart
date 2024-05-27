import 'package:animations/animations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/application/report/report_cubit.dart';
import 'package:money/domain/transaction/transaction_by_date.dart';
import 'package:money/presentation/report_detail/report_detail_page.dart';
import 'package:money/presentation/tool/palatte.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import 'package:money/presentation/tool/tool.dart';

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
                      elevation: 0,
                      borderRadius: BorderRadius.circular(8),
                      child: ListTile(
                        onTap: () => openSelectDate(state.time),
                        minLeadingWidth: 0,
                        leading: const Icon(Icons.date_range),
                        title: Text(
                          convertTime(
                            'MM/yyyy',
                            state.time.millisecondsSinceEpoch,
                            false,
                          ),
                          style: textTheme.titleLarge,
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
                        backgroundColor: Palette.primaryContainer,
                      ),
                      ItemView(
                        title: 'Đầu kỳ',
                        content: moneyFormat(state.remain),
                        backgroundColor: Palette.primaryContainer,
                      ),
                      OpenContainer(
                        closedColor: context.theme.colorScheme.surface,
                        closedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        closedBuilder: (context, action) {
                          return ItemView(
                            title: 'Thu',
                            content: moneyFormat(state.totalEarn),
                            backgroundColor: Palette.primaryContainer,
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
                        closedColor: context.theme.colorScheme.surface,
                        closedElevation: 0,
                        closedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        closedBuilder: (context, action) {
                          return ItemView(
                            title: 'Chi',
                            content: moneyFormat(state.totalPaid),
                            backgroundColor: Palette.primaryContainer,
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
                          backgroundColor: context.theme.colorScheme.surface,
                          barGroups: state.paidDateList.map(
                            (TransactionByDate e) {
                              return BarChartGroupData(
                                x: state.paidDateList.indexOf(e),
                                barRods: [
                                  BarChartRodData(
                                    toY: (e.totalValue / 1000).abs().toDouble(),
                                    color: context.theme.colorScheme.tertiary,
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
                                textTheme.labelMedium!.copyWith(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
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
      backgroundColor: context.colorScheme.surfaceContainerHighest,
      headerColor: context.colorScheme.surfaceContainerHighest,
      headerTextColor: Palette.textColor,
      roundedCornersRadius: 28,
      firstDate: DateTime(dateNow.year - 1),
      lastDate: DateTime(dateNow.year + 1),
      confirmWidget: const Text('OK'),
      cancelWidget: const Text('Hủy'),
      selectedMonthBackgroundColor: context.colorScheme.primary,
      selectedMonthTextColor: context.colorScheme.onPrimary,
      capitalizeFirstLetter: true,
      selectableMonthPredicate: (date) => true,
      unselectedMonthTextColor: Palette.textColor,
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
    required this.backgroundColor,
  }) : super(key: key);

  final String title;
  final String content;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.theme.colorScheme.surfaceTint,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.labelSmall?.copyWith(
              color: Colors.white,
            ),
          ),
          Text(
            content,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
