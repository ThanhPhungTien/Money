part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.normal({
    @Default([]) List<TransactionModel> data,
  }) = SearchStateNormal;
}
