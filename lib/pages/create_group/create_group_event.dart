part of 'create_group_bloc.dart';

abstract class CreateGroupEvent extends Equatable {
  const CreateGroupEvent();
}

class CreateGroupEventInit extends CreateGroupEvent {
  @override
  List<Object?> get props => [];
}

class CreateGroupEventUpdateCheck extends CreateGroupEvent {
  final bool paid;

  const CreateGroupEventUpdateCheck(this.paid);

  @override
  List<Object?> get props => [paid];
}

class CreateGroupEventSave extends CreateGroupEvent {
  final Group group;

  const CreateGroupEventSave(this.group);

  @override
  List<Object?> get props => [group];
}
