import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/enum/constant.dart';
import 'package:money/model/group_transaction/group_transaction.dart';
import 'package:money/model/transaction/transaction.dart';
import 'package:money/pages/transaction_list/transaction_list_cubit.dart';
import 'package:money/route/route_name.dart';
import 'package:money/tool/tool.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../widgets/failure/failure_view.dart';

class TransactionListView extends StatefulWidget {
  const TransactionListView({Key? key}) : super(key: key);

  @override
  State<TransactionListView> createState() => _TransactionListViewState();
}

class _TransactionListViewState extends State<TransactionListView> {
  TransactionListCubit bloc = TransactionListCubit();

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giao dịch'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TransactionListCubit, TransactionListState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is TransactionListStateGotData) {
              return Column(
                children: [
                  Material(
                    color: Colors.green,
                    elevation: 1,
                    borderRadius: BorderRadius.circular(8),
                    child: ListTile(
                      onTap: () => openSelectDate(state.time),
                      leading:
                          const Icon(Icons.date_range, color: Colors.white),
                      title: Text(
                        convertTime('MM/yyyy',
                            state.time.millisecondsSinceEpoch, false),
                        style: textTheme.subtitle1?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: state.data.isEmpty
                        ? const FailureView(message: 'Không có dữ liệu')
                        : ListView.separated(
                            itemCount: state.data.length,
                            padding: const EdgeInsets.all(8),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 16);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              GroupTransaction item = state.data[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.dateTime,
                                      style: textTheme.headline6),
                                  const SizedBox(height: 8),
                                  Material(
                                    elevation: 2,
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: item.data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        Transaction transaction =
                                            item.data[index];
                                        return ListTile(
                                          onLongPress: () => showMenuBottom(
                                            context,
                                            transaction,
                                          ),
                                          onTap: () => Navigator.pushNamed(
                                            context,
                                            RouteName.createTransaction,
                                            arguments: {
                                              Constant.transaction: transaction,
                                            },
                                          ),
                                          leading: const SizedBox(
                                            height: double.infinity,
                                            child: Icon(Icons.attach_money),
                                          ),
                                          minLeadingWidth: 0,
                                          title: Text(transaction.groupName),
                                          subtitle:
                                              Text(transaction.description),
                                          trailing: Text(
                                            moneyFormat(transaction.value *
                                                transaction.mode),
                                            style:
                                                textTheme.subtitle1?.copyWith(
                                              color: transaction.mode == -1
                                                  ? Colors.red
                                                  : Colors.green,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
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

  showMenuBottom(BuildContext context, Transaction item) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Menu', style: Theme.of(context).textTheme.headline6),
            ),
            const SizedBox(height: 16),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                bloc.deleteTransaction(item.id);
              },
              leading: const Icon(Icons.delete),
              title: const Text('Xóa'),
            ),
          ],
        );
      },
    );
  }
}
