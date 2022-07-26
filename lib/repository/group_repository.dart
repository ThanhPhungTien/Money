import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money/enum/constant.dart';
import 'package:money/model/group/group.dart';

class GroupRepository {
  CollectionReference groupCollection = FirebaseFirestore.instance.collection(
    Constant.group,
  );

  Future<Group> create(Group group) async {
    DocumentReference result = await groupCollection.add(group);
    return group.copyWith(
      id: result.id,
      createTime: DateTime.now().millisecondsSinceEpoch,
      updateTime: DateTime.now().millisecondsSinceEpoch,
    );
  }

  Future<Group> update(Group group) async {
    await groupCollection.doc(group.id).update(group.toJson());
    return group.copyWith(
      updateTime: DateTime.now().millisecondsSinceEpoch,
    );
  }

  Future<List<Group>> get() async {
    List<Group> data = <Group>[];
    QuerySnapshot snapshot = await groupCollection.get();

    for (var item in snapshot.docs) {
      data.add(Group.fromJson(item));
    }
    return data;
  }
}
