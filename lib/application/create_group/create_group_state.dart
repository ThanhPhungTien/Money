part of 'create_group_bloc.dart';

@freezed
class CreateGroupState with _$CreateGroupState {
  const factory CreateGroupState.initial() = CreateGroupStateInitial;
  const factory CreateGroupState.normal(bool paid) = CreateGroupStateNormal;
  const factory CreateGroupState.done() = CreateGroupStateDone;
}
