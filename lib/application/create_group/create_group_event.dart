part of 'create_group_bloc.dart';

@freezed
class CreateGroupEvent with _$CreateGroupEvent {
  const factory CreateGroupEvent.init() = CreateGroupEventInit;
  const factory CreateGroupEvent.updateCheck(bool paid) =
      CreateGroupEventUpdateCheck;
  const factory CreateGroupEvent.save(Group group) = CreateGroupEventSave;
}
