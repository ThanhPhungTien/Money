import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:money/repository/group_repository.dart';

import '../../model/group/group.dart';

part 'group_selector_event.dart';

part 'group_selector_state.dart';

class GroupSelectorBloc extends Bloc<GroupSelectorEvent, GroupSelectorState> {
  List<Group> data = <Group>[];

  GroupSelectorBloc() : super(GroupSelectorInitial()) {
    on<GroupSelectorEventInit>((event, emit) async {
      await _fetching(emit);
    });
    on<GroupSelectorEventSearching>((event, emit) async {
      emit(GroupSelectorStateGotData(data
          .where((item) =>
              item.name.toLowerCase().contains(event.searchKey.toLowerCase()))
          .toList()));
    });

    on<GroupSelectorEventDelete>((event, emit) async {
      await groupRepository.groupCollection.doc(event.item.id).delete();
      await _fetching(emit);
    });
  }

  GroupRepository groupRepository = GetIt.I.get();

   _fetching(Emitter<GroupSelectorState> emit) async {
    try {
      emit(GroupSelectorStateFetching());
      data = await groupRepository.get();
      emit(GroupSelectorStateGotData(data));
    } on Exception catch (e) {
      emit(GroupSelectorStateFetchingError(e.toString()));
    }
  }
}
