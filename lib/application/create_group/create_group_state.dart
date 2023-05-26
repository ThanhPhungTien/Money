part of 'create_group_bloc.dart';

abstract class CreateGroupState extends Equatable {
  const CreateGroupState();
}

class CreateGroupInitial extends CreateGroupState {
  @override
  List<Object> get props => [];
}

class CreateGroupStateNormal extends CreateGroupState {
  final bool paid;

  const CreateGroupStateNormal(this.paid);

  @override
  List<Object?> get props => [paid];
}

class CreateGroupStateDone extends CreateGroupState {
  @override
  List<Object?> get props => [];
}
