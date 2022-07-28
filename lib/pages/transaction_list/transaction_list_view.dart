import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/model/group_transaction/group_transaction.dart';
import 'package:money/model/transaction/transaction.dart';
import 'package:money/pages/transaction_list/transaction_list_cubit.dart';
import 'package:money/tool/tool.dart';

class TransactionListView extends StatefulWidget {
  const TransactionListView({Key? key}) : super(key: key);

  @override
  State<TransactionListView> createState() => _TransactionListViewState();
}

class _TransactionListViewState extends State<TransactionListView> {
  TransactionListCubit bloc = TransactionListCubit()..fetchData();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TransactionListCubit, TransactionListState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is TransactionListStateGotData) {
              if (state.data.isEmpty) {
                return const Center(
                  child: Text('Không có dữ liệu'),
                );
              }
              return ListView.separated(
                itemCount: state.data.length,
                padding: const EdgeInsets.all(8),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 16);
                },
                itemBuilder: (BuildContext context, int index) {
                  GroupTransaction item = state.data[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.dateTime, style: textTheme.headline6),
                      const SizedBox(height: 8),
                      Material(
                        elevation: 2,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: item.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            Transaction transaction = item.data[index];
                            return ListTile(
                              leading: const SizedBox(
                                height: double.infinity,
                                child: Icon(Icons.attach_money),
                              ),
                              minLeadingWidth: 0,
                              title: Text(transaction.groupName),
                              subtitle: Text(transaction.description),
                              trailing: Text(moneyFormat(transaction.value)),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
