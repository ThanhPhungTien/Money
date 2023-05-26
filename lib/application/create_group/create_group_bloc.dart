import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:money/model/group/group.dart';
import 'package:money/infrastructure/remote/group_repository.dart';

part 'create_group_event.dart';
part 'create_group_state.dart';

class CreateGroupBloc extends Bloc<CreateGroupEvent, CreateGroupState> {
  CreateGroupBloc() : super(CreateGroupInitial()) {
    on<CreateGroupEventInit>((event, emit) {
      emit(const CreateGroupStateNormal(true));
    });
    on<CreateGroupEventUpdateCheck>((event, emit) {
      emit(CreateGroupStateNormal(event.paid));
    });
    on<CreateGroupEventSave>((event, emit) async {
      await groupRepository.groupCollection.add(event.group.toJson());
      emit(CreateGroupStateDone());
    });
  }

  GroupRepository groupRepository = GetIt.I.get();
}
