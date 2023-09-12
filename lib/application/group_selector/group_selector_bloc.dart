import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:money/domain/transaction/i_group_repository.dart';
import 'package:money/presentation/tool/tool.dart';

import '../../model/group/group.dart';

part 'group_selector_event.dart';
part 'group_selector_state.dart';

class GroupSelectorBloc extends Bloc<GroupSelectorEvent, GroupSelectorState> {
  List<Group> data = <Group>[];
  bool _showSearch = false;

  GroupSelectorBloc() : super(GroupSelectorInitial()) {
    on<GroupSelectorEventInit>((event, emit) async {
      await _fetching(emit);
    });

    on<GroupSelectorEventSearching>((event, emit) async {
      emit(
        GroupSelectorStateGotData(
          data
              .where((item) => unsigned(item.name.toLowerCase().trim())
                  .contains(unsigned(event.searchKey.toLowerCase().trim())))
              .toList(),
          _showSearch,
        ),
      );
    });

    on<GroupSelectorEventDelete>((event, emit) async {
      await groupRepository.delete(id: event.item.id);
      await _fetching(emit);
    });

    on<GroupSelectorEventShowSearch>((event, emit) async {
      _updateShow(!_showSearch, emit);
    });
  }

  IGroupRepository groupRepository = GetIt.I.get();

  _fetching(Emitter<GroupSelectorState> emit) async {
    try {
      emit(GroupSelectorStateFetching());
      data = await groupRepository.get();
      emit(GroupSelectorStateGotData(data, _showSearch));
    } on Exception catch (e) {
      emit(GroupSelectorStateFetchingError(e.toString()));
    }
  }

  _updateShow(bool check, Emitter<GroupSelectorState> emit) {
    _showSearch = check;
    emit(GroupSelectorStateGotData(data, _showSearch));
  }
}
