part of 'suggest_money_cubit.dart';

@immutable
abstract class SuggestMoneyState {}

class SuggestMoneyInitial extends SuggestMoneyState {
  final int number;

  SuggestMoneyInitial(this.number);
}
