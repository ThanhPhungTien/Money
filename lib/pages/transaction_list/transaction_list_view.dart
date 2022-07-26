import 'package:flutter/material.dart';
import 'package:money/model/transaction/transaction.dart';
import 'package:money/pages/transaction_list/cubit/transaction_list_cubit.dart';

class TransactionListView extends StatefulWidget {
  const TransactionListView({Key? key}) : super(key: key);

  @override
  State<TransactionListView> createState() => _TransactionListViewState();
}

class _TransactionListViewState extends State<TransactionListView> {
  TransactionListCubit bloc = TransactionListCubit();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: bloc.transactionCR.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text('Không có dữ liệu'),
              );
            }
            final data = snapshot.requireData;

            return ListView.builder(
              itemCount: data.size,
              itemBuilder: (BuildContext context, int index) {
                Transaction item = Transaction.fromJson(
                  data.docs[index].data(),
                );
                return Material(
                  elevation: 1,
                  color: Colors.white,
                  child: ListTile(
                    title: Text(item.description),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
