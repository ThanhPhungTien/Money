
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:money/enum/constant.dart';
import 'package:money/model/group/group.dart';
import 'package:money/repository/group_local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupRepository {
  CollectionReference groupCollection = FirebaseFirestore.instance.collection(
    Constant.group,
  );

  SharedPreferences prefs = GetIt.I.get();
  GroupLocalRepository groupLocalRepository = GetIt.I.get();

  Future<Group> create(Group group) async {
    DocumentReference result = await groupCollection.add(group);

    return group.copyWith(
      id: result.id,
      createTime: DateTime.now().millisecondsSinceEpoch,
      updateTime: DateTime.now().millisecondsSinceEpoch,
    );
  }

  Future<Group> update(Group group) async {
    if (prefs.getBool(Constant.hasInternet) ?? false) {
      await groupCollection.doc(group.id).update(group.toJson());
    } else {
      groupLocalRepository.save(group);
    }

    return group.copyWith(
      updateTime: DateTime.now().millisecondsSinceEpoch,
    );
  }

  Future<List<Group>> get() async {
    List<Group> data = <Group>[];

    if (prefs.getBool(Constant.hasInternet) ?? false) {
      QuerySnapshot snapshot = await groupCollection.get();

      for (var item in snapshot.docs) {
        data.add(Group.fromJson(item.data()).copyWith(id: item.id));
      }
    } else {
      data = await groupLocalRepository.get();
    }

    return data;
  }

  Future<Group> view(String id) async {
    if (prefs.getBool(Constant.hasInternet) ?? false) {
      try {
        DocumentSnapshot documentSnapshot = await groupCollection.doc(id).get();
        if (documentSnapshot.exists) {
          return Group.fromJson(documentSnapshot.data()).copyWith(
            id: documentSnapshot.id,
          );
        }
      } on FirebaseException catch (_) {
        return const Group();
      }
    } else {
      return groupLocalRepository.view(id);
    }

    return const Group();
  }
}
