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

  const GroupSelectorStateGotData(this.data);

  @override
  List<Object?> get props => [data];
}

class GroupSelectorStateFetchingError extends GroupSelectorState {

  final String message;
  const GroupSelectorStateFetchingError(this.message);

  @override
  List<Object?> get props => [message];

}