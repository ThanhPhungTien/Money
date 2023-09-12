import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:money/domain/transaction/i_group_repository.dart';
import 'package:money/enum/constant.dart';
import 'package:money/model/group/group.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: IGroupRepository)
class GroupRepository implements IGroupRepository {
  CollectionReference groupCollection = FirebaseFirestore.instance.collection(
    Constant.group,
  );
  SharedPreferences prefs = GetIt.I.get();
  // GroupLocalRepository groupLocalRepository = GetIt.I.get();

  @override
  Future<Group> create({required Group group}) async {
    DocumentReference result = await groupCollection.add(group.toJson());

    return group.copyWith(
      id: result.id,
      createTime: DateTime.now().millisecondsSinceEpoch,
      updateTime: DateTime.now().millisecondsSinceEpoch,
    );
  }

  @override
  Future<Group> update({required Group group}) async {
    await groupCollection.doc(group.id).update(group.toJson());

    return group.copyWith(
      updateTime: DateTime.now().millisecondsSinceEpoch,
    );
  }

  @override
  Future<List<Group>> get() async {
    List<Group> data = <Group>[];
    QuerySnapshot snapshot = await groupCollection.get();

    for (var item in snapshot.docs) {
      data.add(Group.fromJson(item.data() as Map<String, dynamic>)
          .copyWith(id: item.id));
    }

    data.sort((a, b) => b.updateTime.compareTo(a.updateTime));
    return data;
  }

  @override
  Future<Group> view({required String id}) async {
    try {
      DocumentSnapshot documentSnapshot = await groupCollection.doc(id).get();
      if (documentSnapshot.exists) {
        return Group.fromJson(documentSnapshot.data() as Map<String, dynamic>)
            .copyWith(
          id: documentSnapshot.id,
        );
      }
    } on FirebaseException catch (_) {
      return const Group();
    }
    return const Group();
  }

  @override
  Future<void> delete({required String id}) async {
    await groupCollection.doc(id).delete();
  }
}
