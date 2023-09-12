part of 'group_selector_bloc.dart';

abstract class GroupSelectorState extends Equatable {
  const GroupSelectorState();
}

class GroupSelectorInitial extends GroupSelectorState {
  @override
  List<Object> get props => [];
}

class GroupSelectorStateFetching extends GroupSelectorState {
  @override
  List<Object?> get props => [];
}

class GroupSelectorStateGotData extends GroupSelectorState {
  final List<Group> data;
  final bool showSearch;

  const GroupSelectorStateGotData(this.data, this.showSearch);

  @override
  List<Object?> get props => [data, showSearch];
}

class GroupSelectorStateFetchingError extends GroupSelectorState {
  final String message;
  const GroupSelectorStateFetchingError(this.message);

  @override
  List<Object?> get props => [message];
}
