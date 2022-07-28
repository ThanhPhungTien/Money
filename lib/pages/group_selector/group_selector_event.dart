part of 'group_selector_bloc.dart';

abstract class GroupSelectorEvent extends Equatable {
  const GroupSelectorEvent();
}

class GroupSelectorEventInit extends GroupSelectorEvent {
  @override
  List<Object?> get props => [];
}

class GroupSelectorEventSearching extends GroupSelectorEvent {
  final String searchKey;

  const GroupSelectorEventSearching(this.searchKey);

  @override
  List<Object?> get props => [searchKey];
}
