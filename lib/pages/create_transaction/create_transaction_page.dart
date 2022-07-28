import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/model/group/group.dart';
import 'package:money/model/transaction/transaction.dart';
import 'package:money/pages/create_transaction/create_transaction_bloc.dart';
import 'package:money/route/route_name.dart';
import 'package:money/tool/tool.dart';

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

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    bloc.add(CreateTransactionEventInit(DateTime.now(), const Group()));
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
      appBar: AppBar(title: const Text('Tạo giao dịch')),
      body: BlocConsumer<CreateTransactionBloc, CreateTransactionState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is CreateTransactionStateShowLoading) {
          } else if (state is CreateTransactionStateCreateDone) {
            Navigator.pop(context);
          }
        },
        buildWhen: (prev, state) {
          return state is CreateTransactionStateGotData ||
              state is CreateTransactionInitial;
        },
        builder: (context, state) {
          if (state is CreateTransactionStateGotData) {
            dateTEC.text = convertTime('dd/MM/yyyy', state.dateTime.millisecondsSinceEpoch, true);
            nameTEC.text = state.group.name;
            return Form(
              key: keyForm,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  GestureDetector(
                    onTap: () => openDateSelector(DateTime.now()),
                    child: TextFormField(
                      controller: dateTEC,
                      decoration: const InputDecoration(
                        labelText: 'Ngày tạo',
                        enabled: false,
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: openGroupSelector,
                    child: TextFormField(
                      controller: nameTEC,
                      decoration: const InputDecoration(
                        labelText: 'Tên giao dịch',
                        enabled: false,
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Không để trống giá trị';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: valueTEC,
                    decoration: const InputDecoration(
                      labelText: 'Giá trị',
                    ),
                    validator: (text) {
                      if (text == null ||
                          text.isEmpty ||
                          nameTEC.text.trim().isEmpty) {
                        return 'Không để trống loại giao dịch và  giá trị';
                      } else if (!isMoney(text)) {
                        return 'Tiền không hợp lệ';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: descriptionTEC,
                    decoration: const InputDecoration(
                      labelText: 'Mô tả',
                    ),
                  ),

                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => createTransaction(state),
                    child: const Text('Cập nhật'),
                  )
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  openGroupSelector() async {
    dynamic result =
        await Navigator.pushNamed(context, RouteName.groupSelector);

    if (result != null && result is Group) {
      bloc.add(CreateTransactionEventUpdateGroup(result));
    }
  }

  openDateSelector(DateTime initialDate) async {
    DateTime dateNow = DateTime.now();
    dynamic result = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(dateNow.year, dateNow.month - 1),
      lastDate: DateTime(dateNow.year + 1),
    );
    if (result != null && result is DateTime) {
      bloc.add(CreateTransactionEventUpdateDate(result));
    }
  }

  createTransaction(CreateTransactionStateGotData state) {
    if (keyForm.currentState!.validate()) {
      bloc.add(CreateTransactionEventCreate(Transaction(
        createdTime: state.dateTime.millisecondsSinceEpoch,
        description: descriptionTEC.text,
        groupName: state.group.name,
        groupId: state.group.id,
        value: int.parse(valueTEC.text),
        month: state.dateTime.month,
        year: state.dateTime.year,
        mode: state.group.mode,
      )));
    }
  }
}
