import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money/presentation/tool/tool.dart';

part 'suggest_money_state.dart';

class SuggestMoneyCubit extends Cubit<SuggestMoneyState> {
  SuggestMoneyCubit() : super(SuggestMoneyInitial(0));

  void updateValue(String text) {
    if (text.isNotEmpty && isMoney(text)) {
      emit(SuggestMoneyInitial(int.parse(text)));
    }
  }
}
