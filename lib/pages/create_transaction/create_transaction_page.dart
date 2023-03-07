import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/model/group/group.dart';
import 'package:money/model/transaction/transaction.dart';
import 'package:money/pages/create_transaction/create_transaction_bloc.dart';
import 'package:money/route/route_name.dart';
import 'package:money/tool/tool.dart';
import 'package:money/widgets/money_keyboard/money_keyboard_widget.dart';

class CreateTransactionPage extends StatefulWidget {
  const CreateTransactionPage({
    Key? key,
    this.transaction = const Transaction(),
  }) : super(key: key);

  final Transaction transaction;

  @override
  State<CreateTransactionPage> createState() => _CreateTransactionPageState();
}

class _CreateTransactionPageState extends State<CreateTransactionPage> {
  CreateTransactionBloc bloc = CreateTransactionBloc();

  var dateTEC = TextEditingController();
  var nameTEC = TextEditingController();
  var valueTEC = TextEditingController();
  var descriptionTEC = TextEditingController();

  var nameNode = FocusNode();
  var valueNode = FocusNode();
  var descriptionNode = FocusNode();

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  PersistentBottomSheetController? _controller;

  @override
  void initState() {
    bloc.add(CreateTransactionEventInit(widget.transaction));
    valueTEC.text = widget.transaction.value.toString();
    descriptionTEC.text = widget.transaction.description;

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
    return GestureDetector(
      onTap: () {
        if (_controller != null) {
          _controller?.close();
        }
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text(
                '${widget.transaction.isEmpty() ? 'Tạo' : 'Sửa'} giao dịch')),
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
              dateTEC.text = convertTime(
                  'dd/MM/yyyy', state.dateTime.millisecondsSinceEpoch, true);
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
                      decoration: const InputDecoration(labelText: 'Giá trị'),
                      // readOnly: true,
                      // onTap: () => showKeyMoneyBoard(context, valueTEC),
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
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50)),
                      child: const Text('Cập nhật'),
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
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
      bloc.add(CreateTransactionEventCreate(widget.transaction.copyWith(
        createdTime: state.dateTime.millisecondsSinceEpoch,
        updateTime: DateTime.now().millisecondsSinceEpoch,
        description: descriptionTEC.text,
        groupName: state.group.name,
        groupId: state.group.id,
        value: int.parse(valueTEC.text.replaceAll(',', '').trim()),
        month: state.dateTime.month,
        year: state.dateTime.year,
        mode: state.group.mode,
      )));
    }
  }

  showKeyMoneyBoard(BuildContext context, TextEditingController valueTEC) {
    _controller = Scaffold.of(context).showBottomSheet(
      (context) => MoneyKeyBoardWidget(tec: valueTEC),
    );
  }
}
