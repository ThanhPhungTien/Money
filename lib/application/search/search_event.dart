part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.search({required String query}) = SearchEventSearch;

  const factory SearchEvent.updateMonth({
    required DateTime dateTime,
  }) = SearchEventUpdateMonth;

  const factory SearchEvent.updateUseFor({required int useFor}) =
      SearchEventUpdateUseFor;

  const factory SearchEvent.updateGroup({required Group group}) =
      SearchEventUpdateGroup;
}
