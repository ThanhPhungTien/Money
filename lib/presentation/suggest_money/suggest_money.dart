import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:money/application/suggest_money/suggest_money_cubit.dart';
import 'package:money/presentation/tool/tool.dart';

class SuggestMoneyView extends StatefulWidget {
  const SuggestMoneyView({
    Key? key,
    required this.textController,
  }) : super(key: key);

  final TextEditingController textController;

  @override
  State<SuggestMoneyView> createState() => _SuggestMoneyViewState();
}

class _SuggestMoneyViewState extends State<SuggestMoneyView> {
  SuggestMoneyCubit bloc = SuggestMoneyCubit();
  final moneyFormatter = CurrencyInputFormatter(
    thousandSeparator: ThousandSeparator.Comma,
    mantissaLength: 0,
    trailingSymbol: '',
  );

  @override
  void initState() {
    widget.textController.addListener(() {
      bloc.updateValue(widget.textController.text
          .replaceAll(',', '')
          .replaceAll('.', '')
          .trim());
    });
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
    return BlocBuilder<SuggestMoneyCubit, SuggestMoneyState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is SuggestMoneyInitial && state.number > 0) {
          return Wrap(
            spacing: 8,
            children: [1000, 10000, 10000]
                .map(
                  (e) => ActionChip(
                    onPressed: () {
                      widget.textController.value =
                          moneyFormatter.formatEditUpdate(
                        TextEditingValue.empty,
                        TextEditingValue(text: (state.number * e).toString()),
                      );
                      widget.textController.selection = TextSelection.collapsed(
                          offset: widget.textController.text.length);
                    },
                    shape: const StadiumBorder(),
                    label: Text(
                      moneyFormat(state.number * e),
                      style: textTheme.bodyMedium,
                    ),
                  ),
                )
                .toList(),
          );
        }
        return Container();
      },
    );
  }
}
