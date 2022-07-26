import 'package:flutter/material.dart';
import 'package:money/pages/transaction_list/transaction_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xin chào'),
        centerTitle: false,
      ),
      body: const TransactionListView(),
    );
  }
}
