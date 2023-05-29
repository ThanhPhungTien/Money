import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:money/domain/transaction/i_group_repository.dart';
import 'package:money/model/group/group.dart';

part 'create_group_event.dart';

part 'create_group_state.dart';

part 'create_group_bloc.freezed.dart';

@injectable
class CreateGroupBloc extends Bloc<CreateGroupEvent, CreateGroupState> {
  IGroupRepository groupRepository = GetIt.I.get();

  CreateGroupBloc() : super(const CreateGroupState.initial()) {
    on<CreateGroupEvent>((event, emit) async {
      await event.map<dynamic>(
        save: (event) => createGroup(event, emit),
        init: (_) => emit(const CreateGroupStateNormal(true)),
        updateCheck: (event) => emit(CreateGroupStateNormal(event.paid)),
      );
    });
  }

  Future<void> createGroup(
    CreateGroupEventSave event,
    Emitter<CreateGroupState> emit,
  ) async {
    await groupRepository.create(group: event.group);
    emit(const CreateGroupStateDone());
  }
}
