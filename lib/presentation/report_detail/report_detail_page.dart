import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/application/report_detail/report_detail_cubit.dart';
import 'package:money/domain/transaction/transaction.dart';
import 'package:money/domain/transaction/transaction_by_name.dart';

import 'package:money/presentation/tool/tool.dart';

class ReportDetailPage extends StatelessWidget {
  const ReportDetailPage({Key? key, required this.data, required this.title})
      : super(key: key);

  final List<TransactionByName> data;
  final String title;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final bloc = ReportDetailCubit()..initData(data);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () => showSelectGoal(context, bloc),
          ),
        ],
      ),
      body: BlocBuilder<ReportDetailCubit, ReportDetailState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is ReportDetailInitial) {
            int total = state.data.fold(0, (p, c) => p + c.totalValue);
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          textByGoal(state.filter),
                          style: textTheme.labelMedium?.copyWith(
                            color: total < 0 ? Colors.red : Colors.green,
                          ),
                        ),
                      ),
                      Text(
                        moneyFormat(total),
                        style: textTheme.labelMedium?.copyWith(
                          color: total < 0 ? Colors.red : Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.data.isEmpty)
                  Center(
                    child: Text(
                      'Không có dữ liệu',
                      style: textTheme.labelMedium,
                    ),
                  ),
                ExpansionPanelList(
                  expansionCallback: (index, duration) {
                    bloc.changeOpen(index);
                  },
                  elevation: 0,
                  children: state.data
                      .map((item) => ExpansionPanel(
                            headerBuilder: (context, isExpanded) {
                              return ListTile(
                                title: Text(
                                  item.name,
                                  style: textTheme.labelMedium,
                                ),
                                trailing: Text(
                                  moneyFormat(item.totalValue),
                                  style: textTheme.labelSmall?.copyWith(
                                    color: item.totalValue < 0
                                        ? Colors.red
                                        : Colors.green,
                                  ),
                                ),
                              );
                            },
                            canTapOnHeader: true,
                            isExpanded: item.isOpen,
                            body: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: item.data.length,
                              itemBuilder: (context, index) {
                                int value = item.data[index].value *
                                    item.data[index].mode;
                                Transaction itemTrans = item.data[index];
                                return ListTile(
                                  minLeadingWidth: 0,
                                  title: Text(
                                    convertTime(
                                      'dd/MM/yyyy',
                                      itemTrans.createdTime,
                                      false,
                                    ),
                                    style: textTheme.labelMedium,
                                  ),
                                  subtitle: Text(
                                    itemTrans.description,
                                    style: textTheme.labelSmall,
                                  ),
                                  leading: SizedBox(
                                    height: double.infinity,
                                    child: iconByGoal(state.filter),
                                  ),
                                  trailing: Text(
                                    moneyFormat(value),
                                    style: textTheme.labelSmall?.copyWith(
                                      color:
                                          value < 0 ? Colors.red : Colors.green,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ))
                      .toList(),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  showSelectGoal(BuildContext context, ReportDetailCubit bloc) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              title: Text('Giao dịch này dùng cho ai?'),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    bloc.applyFilter(index);
                    Navigator.pop(context);
                  },
                  title: Text(textByGoal(index)),
                  trailing: iconByGoal(index),
                );
              },
            ),
            ListTile(
              onTap: () {
                bloc.applyFilter(-1);
                Navigator.pop(context);
              },
              title: const Text('Bỏ lọc'),
              trailing: const Icon(Icons.filter_alt_off_outlined),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
