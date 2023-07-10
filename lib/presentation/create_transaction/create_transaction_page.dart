import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:money/application/create_transaction/create_transaction_bloc.dart';
import 'package:money/model/group/group.dart';
import 'package:money/domain/transaction/transaction.dart';
import 'package:money/presentation/money_keyboard/money_keyboard_widget.dart';
import 'package:money/presentation/suggest_money/suggest_money.dart';
import 'package:money/route/route_name.dart';
import 'package:money/presentation/tool/tool.dart';

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

  final moneyFormat = CurrencyInputFormatter(
    thousandSeparator: ThousandSeparator.Comma,
    mantissaLength: 0,
    trailingSymbol: '',
  );

  @override
  void initState() {
    bloc.add(CreateTransactionEventInit(widget.transaction));
    valueTEC.value = moneyFormat.formatEditUpdate(
      TextEditingValue.empty,
      TextEditingValue(text: widget.transaction.value.toString()),
    );
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
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        if (_controller != null) {
          _controller?.close();
        }
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title:
              Text('${widget.transaction.isEmpty ? 'Tạo' : 'Sửa'} giao dịch'),
        ),
        body: BlocConsumer<CreateTransactionBloc, CreateTransactionState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is CreateTransactionStateShowLoading) {
            } else if (state is CreateTransactionStateCreateDone) {
              Navigator.pop(context);
            }
          },
          buildWhen: (prev, state) {
            bool check = state is CreateTransactionStateGotData ||
                state is CreateTransactionInitial;
            return check;
          },
          builder: (context, state) {
            if (state is CreateTransactionStateGotData) {
              dateTEC.text = convertTime(
                'dd/MM/yyyy',
                state.dateTime.millisecondsSinceEpoch,
                false,
              );
              nameTEC.text = state.group.name;
              return Form(
                key: keyForm,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    TextFormField(
                      controller: dateTEC,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Ngày tạo',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_month_outlined),
                          onPressed: () => openDateSelector(state.dateTime),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: nameTEC,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Tên giao dịch',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.bookmark_add_outlined),
                          onPressed: openGroupSelector,
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Không để trống giá trị';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: valueTEC,
                      decoration: const InputDecoration(labelText: 'Giá trị'),
                      inputFormatters: [moneyFormat],
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
                    SuggestMoneyView(textController: valueTEC),
                    TextFormField(
                      controller: descriptionTEC,
                      decoration: const InputDecoration(
                        labelText: 'Mô tả',
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      onTap: () => showSelectGoal(context),
                      contentPadding: EdgeInsets.zero,
                      leading: SizedBox(
                        height: double.infinity,
                        child: iconByGoal(state.transactionFor),
                      ),
                      minLeadingWidth: 0,
                      title: Text(
                        'Giao dịch của ${textByGoal(state.transactionFor)}',
                        style: textTheme.labelMedium,
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () => createTransaction(state),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
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
        value: int.parse(
            valueTEC.text.replaceAll(',', '').replaceAll('.', '').trim()),
        month: state.dateTime.month,
        year: state.dateTime.year,
        mode: state.group.mode,
        transactionFor: state.transactionFor,
      )));
    }
  }

  showKeyMoneyBoard(BuildContext context, TextEditingController valueTEC) {
    _controller = Scaffold.of(context).showBottomSheet(
      (context) => MoneyKeyBoardWidget(tec: valueTEC),
    );
  }

  showSelectGoal(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              title: Text('Giao dịch này dùng cho ai?'),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    bloc.add(CreateTransactionEventUpdateCreated(index));
                    Navigator.pop(context);
                  },
                  title: Text(textByGoal(index)),
                  trailing: iconByGoal(index),
                );
              },
            )
          ],
        );
      },
    );
  }
}
