import 'package:money/model/group/group.dart';

abstract class IGroupRepository {
  Future<Group> create({required Group group});
  Future<Group> update({required Group group});
  Future<void> delete({required String id});
  Future<Group> view({required String id});
  Future<List<Group>> get();
}
