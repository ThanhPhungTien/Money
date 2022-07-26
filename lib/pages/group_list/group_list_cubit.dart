import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../enum/constant.dart';

part 'group_list_state.dart';

class GroupListCubit extends Cubit<GroupListState> {
  GroupListCubit() : super(GroupListInitial());

  CollectionReference groupCR =
      FirebaseFirestore.instance.collection(Constant.group);
}
