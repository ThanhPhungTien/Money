part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.normal({
    @Default([]) List<TransactionModel> data,
    @Default(0) int month,
    @Default(Group()) Group group,
    @Default(0) int useFor,
  }) = SearchStateNormal;
}
