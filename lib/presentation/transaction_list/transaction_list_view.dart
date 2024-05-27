import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/application/transaction_list/transaction_list_cubit.dart';
import 'package:money/domain/transaction/transaction_model.dart';
import 'package:money/model/group_transaction/group_transaction.dart';
import 'package:money/presentation/create_transaction/create_transaction_page.dart';
import 'package:money/presentation/failure/failure_view.dart';
import 'package:money/presentation/tool/palatte.dart';
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
      body: BlocBuilder<TransactionListCubit, TransactionListState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is TransactionListStateGotData) {
            return Column(
              children: [
                ListTile(
                  onTap: () => openSelectDate(state.time),
                  leading:
                      const Icon(Icons.date_range, color: Palette.textColor),
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
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Palette.primary,
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
                            solarToLunar(DateTime.now()).millisecondsSinceEpoch,
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
                      ? FailureView(
                          message: 'Không có dữ liệu',
                          onPressedRetry: () => bloc.fetchData(state.time),
                        )
                      : RefreshIndicator(
                          onRefresh: () async => bloc.fetchData(state.time),
                          child: ListView.separated(
                            itemCount: state.data.length,
                            padding: const EdgeInsets.all(0),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                            itemBuilder: (BuildContext context, int index) =>
                                ItemTransactionWidget(
                              item: state.data[index],
                              bloc: bloc,
                            ),
                          ),
                        ),
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
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(item.dateTime, style: textTheme.titleMedium),
            trailing: Text(
              moneyFormat(item.totalValue),
              style: textTheme.labelLarge?.copyWith(
                color:
                    item.totalValue < 0 ? Palette.decrease : Palette.increase,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: item.data.length,
            itemBuilder: (BuildContext context, int index) {
              TransactionModel transaction = item.data[index];
              return Dismissible(
                key: Key(transaction.id),
                onDismissed: (direction) =>
                    bloc.deleteTransaction(transaction.id),
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Palette.decrease,
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
                  onTap: () => CreateTransactionPage.show(
                    context: context,
                    transaction: transaction,
                  ),
                  minVerticalPadding: 0,
                  leading: SizedBox(
                    height: double.infinity,
                    child: iconByGoal(transaction.transactionFor),
                  ),
                  minLeadingWidth: 0,
                  title: Text(transaction.groupName),
                  subtitle: transaction.description.isNotEmpty
                      ? Text(transaction.description)
                      : null,
                  trailing: Text(
                    moneyFormat(transaction.value * transaction.mode),
                    style: textTheme.labelMedium?.copyWith(
                      color: transaction.mode == -1
                          ? Palette.decrease
                          : Palette.increase,
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

  showMenuBottom(BuildContext context, TransactionModel item) {
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
      BuildContext context, TransactionModel transaction) async {
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
