
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
      try {
        emit(GroupSelectorStateFetching());
        data = await groupRepository.get();
        emit(GroupSelectorStateGotData(data));
      } on Exception catch (e) {
        emit(GroupSelectorStateFetchingError(e.toString()));
      }
    });
    on<GroupSelectorEventSearching>((event, emit) async {
      emit(GroupSelectorStateGotData(data
          .where((item) => item.name
              .toLowerCase()
              .contains(event.searchKey.toLowerCase()))
          .toList()));
    });
  }

  GroupRepository groupRepository = GetIt.I.get();
}
