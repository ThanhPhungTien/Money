import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/application/transaction_list/transaction_list_cubit.dart';
import 'package:money/enum/constant.dart';
import 'package:money/model/group_transaction/group_transaction.dart';
import 'package:money/domain/transaction/transaction.dart';
import 'package:money/presentation/failure/failure_view.dart';
import 'package:money/route/route_name.dart';
import 'package:money/presentation/tool/tool.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TransactionListCubit, TransactionListState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is TransactionListStateGotData) {
              return Column(
                children: [
                  ListTile(
                    onTap: () => openSelectDate(state.time),
                    leading: const Icon(Icons.date_range),
                    title: Text(
                      convertTime(
                        'MM/yyyy',
                        state.time.millisecondsSinceEpoch,
                        false,
                      ),
                      style: textTheme.titleMedium,
                    ),
                    minLeadingWidth: 0,
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.nights_stay_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            convertTime(
                              'dd/MM/yyyy',
                              solarToLunar(DateTime.now())
                                  .millisecondsSinceEpoch,
                              false,
                            ),
                            style: textTheme.titleSmall?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: state.data.isEmpty
                        ? const FailureView(message: 'Không có dữ liệu')
                        : RefreshIndicator(
                            onRefresh: () async {
                              bloc.fetchData(state.time);
                            },
                            child: ListView.separated(
                              itemCount: state.data.length,
                              padding: const EdgeInsets.all(8),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(height: 8);
                              },
                              itemBuilder: (BuildContext context, int index) {
                                GroupTransaction item = state.data[index];
                                return ItemTransactionWidget(
                                  item: item,
                                  bloc: bloc,
                                );
                              },
                            ),
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
      firstDate: DateTime(dateNow.year - 1),
      lastDate: DateTime(dateNow.year + 1),
      roundedCornersRadius: 8,
      confirmWidget: const Text('OK'),
      cancelWidget: const Text('Hủy'),
    );
    if (result != null && result is DateTime) {
      bloc.fetchData(result);
    }
  }
}

class ItemTransactionWidget extends StatelessWidget {
  const ItemTransactionWidget({
    Key? key,
    required this.item,
    required this.bloc,
  }) : super(key: key);

  final GroupTransaction item;
  final TransactionListCubit bloc;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(item.dateTime, style: textTheme.labelMedium),
            trailing: Text(
              moneyFormat(item.totalValue),
              style: textTheme.labelMedium?.copyWith(
                color: item.totalValue < 0 ? Colors.red : Colors.green,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: item.data.length,
            itemBuilder: (BuildContext context, int index) {
              Transaction transaction = item.data[index];
              return Dismissible(
                key: Key(transaction.id),
                onDismissed: (direction) {
                  bloc.deleteTransaction(transaction.id);
                },
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                  ),
                ),
                confirmDismiss: (DismissDirection direction) =>
                    showDeleteConfirm(context, transaction),
                direction: DismissDirection.endToStart,
                child: ListTile(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RouteName.createTransaction,
                    arguments: {
                      Constant.transaction: transaction,
                    },
                  ),
                  minVerticalPadding: 0,
                  leading: SizedBox(
                    height: double.infinity,
                    child: iconByGoal(transaction.transactionFor),
                  ),
                  minLeadingWidth: 0,
                  title: Text(
                    transaction.groupName,
                    style: textTheme.labelMedium,
                  ),
                  subtitle: Text(transaction.description),
                  trailing: Text(
                    moneyFormat(transaction.value * transaction.mode),
                    style: textTheme.labelMedium?.copyWith(
                      color: transaction.mode == -1 ? Colors.red : Colors.green,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  showMenuBottom(BuildContext context, Transaction item) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                    Text('Menu', style: Theme.of(context).textTheme.titleLarge),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  bloc.deleteTransaction(item.id);
                },
                minLeadingWidth: 0,
                leading: const Icon(Icons.delete),
                title: const Text('Xóa'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<bool?> showDeleteConfirm(
      BuildContext context, Transaction transaction) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Xác nhận xóa'),
          content: Text(
            'Bạn có chắc muốn xóa "${transaction.groupName}/${transaction.description}" ?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Đóng'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Xác nhận'),
            ),
          ],
        );
      },
    );
  }
}
