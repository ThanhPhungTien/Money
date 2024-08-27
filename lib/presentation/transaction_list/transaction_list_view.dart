import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/application/transaction_list/transaction_list_cubit.dart';
import 'package:money/domain/transaction/transaction_model.dart';
import 'package:money/model/group_transaction/group_transaction.dart';
import 'package:money/presentation/create_transaction/create_transaction_page.dart';
import 'package:money/presentation/failure/failure_view.dart';
import 'package:money/presentation/tool/palatte.dart';
import 'package:money/presentation/tool/tool.dart';

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
    return BlocBuilder<TransactionListCubit, TransactionListState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is TransactionListStateGotData) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OverflowBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilledButton.icon(
                      icon: const Icon(Icons.date_range),
                      onPressed: () => openSelectDate(state.time),
                      label: Text(
                        convertTime(
                          'MM/yyyy',
                          state.time.millisecondsSinceEpoch,
                          false,
                        ),
                      ),
                    ),
                    FilledButton.icon(
                      icon: const Icon(
                        Icons.nights_stay_outlined,
                      ),
                      onPressed: () {},
                      label: Text(
                        convertTime(
                          'dd/MM/yyyy',
                          solarToLunar(DateTime.now()).millisecondsSinceEpoch,
                          false,
                        ),
                      ),
                    ),
                  ],
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
                          padding: const EdgeInsets.all(8),
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
    );
  }

  openSelectDate(DateTime time) async {
    dynamic result = showMonthDialog(context: context, initTime: time);
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
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    return Card.filled(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.dateTime,
                  style: textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
                Text(
                  moneyFormat(item.totalValue),
                  style: textTheme.titleMedium?.copyWith(
                    color: item.totalValue < 0
                        ? theme.colorScheme.error
                        : theme.colorScheme.primary,
                  ),
                ),
              ],
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
                  title: Text(
                    transaction.groupName,
                    style: textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  subtitle: transaction.description.isNotEmpty
                      ? Text(
                          transaction.description,
                          style: textTheme.bodyMedium?.copyWith(),
                        )
                      : null,
                  trailing: Text(
                    moneyFormat(transaction.value * transaction.mode),
                    style: textTheme.labelMedium?.copyWith(
                      color: transaction.mode == -1
                          ? theme.colorScheme.error
                          : theme.colorScheme.primary,
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
