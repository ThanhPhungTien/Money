import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/model/transaction/transaction.dart';
import 'package:money/model/transaction_by_name/transaction_by_name.dart';
import 'package:money/pages/report_detail/report_detail_cubit.dart';

import '../../tool/tool.dart';

class ReportDetailPage extends StatelessWidget {
  const ReportDetailPage({Key? key, required this.data, required this.title})
      : super(key: key);

  final List<TransactionByName> data;
  final String title;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: BlocProvider(
        create: (context) => ReportDetailCubit()..initData(data),
        child: BlocBuilder<ReportDetailCubit, ReportDetailState>(
          builder: (context, state) {
            if (state is ReportDetailInitial) {
              return ListView(
                children: [
                  ExpansionPanelList(
                    expansionCallback: (index, duration) {
                      BlocProvider.of<ReportDetailCubit>(context)
                          .changeOpen(index, data);
                    },
                    children: data
                        .map((item) => ExpansionPanel(
                              headerBuilder: (context, isExpanded) {
                                return ListTile(
                                  title: Text(item.name),
                                  trailing: Text(
                                    moneyFormat(item.totalValue),
                                    style: textTheme.subtitle1?.copyWith(
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
                                    title: Text(
                                      convertTime(
                                        'dd/MM/yyyy',
                                        itemTrans.createdTime,
                                        false,
                                      ),
                                    ),
                                    subtitle: Text(itemTrans.description),
                                    trailing: Text(
                                      moneyFormat(value),
                                      style: textTheme.subtitle1?.copyWith(
                                        color: value < 0
                                            ? Colors.red
                                            : Colors.green,
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
      ),
    );
  }
}
