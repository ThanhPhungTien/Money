import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:money/pages/create_transaction/create_transaction_bloc.dart';

class CreateTransactionPage extends StatefulWidget {
  const CreateTransactionPage({Key? key}) : super(key: key);

  @override
  State<CreateTransactionPage> createState() => _CreateTransactionPageState();
}

class _CreateTransactionPageState extends State<CreateTransactionPage> {
  CreateTransactionBloc bloc = CreateTransactionBloc();

  TextEditingController dateTEC = TextEditingController();
  TextEditingController nameTEC = TextEditingController();
  TextEditingController valueTEC = TextEditingController();
  TextEditingController descriptionTEC = TextEditingController();

  FocusNode nameNode = FocusNode();
  FocusNode valueNode = FocusNode();
  FocusNode descriptionNode = FocusNode();

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    dateTEC.dispose();
    nameTEC.dispose();
    valueTEC.dispose();
    descriptionTEC.dispose();

    nameNode.dispose();
    valueNode.dispose();
    descriptionNode.dispose();

    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo giao dịch'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GestureDetector(
            onTap: () {},
            child: TextFormField(
              controller: dateTEC,
              decoration: const InputDecoration(
                  labelText: 'Ngày tạo',
                  enabled: false,
                  suffixIcon: Icon(Icons.arrow_drop_down)),
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {},
            child: TextFormField(
              controller: nameTEC,
              decoration: const InputDecoration(
                  labelText: 'Tên giao dịch',
                  enabled: false,
                  suffixIcon: Icon(Icons.arrow_drop_down)),
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {},
            child: TextFormField(
              controller: valueTEC,
              decoration: const InputDecoration(
                labelText: 'Giá trị',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {},
            child: TextFormField(
              controller: descriptionTEC,
              decoration: const InputDecoration(
                labelText: 'Mô tả',
              ),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Cập nhật'),
          )
        ],
      ),
    );
  }
}
