import 'package:flutter/material.dart';
import 'package:money/model/group/group.dart';
import 'package:money/pages/group_list/group_list_cubit.dart';

class GroupListView extends StatefulWidget {
  const GroupListView({Key? key}) : super(key: key);

  @override
  State<GroupListView> createState() => _GroupListViewState();
}

class _GroupListViewState extends State<GroupListView> {

  GroupListCubit bloc = GroupListCubit();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: bloc.groupCR.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text('Không có dữ liệu'),
              );
            }
            final data = snapshot.requireData;

            return ListView.builder(
              itemCount: data.size,
              itemBuilder: (BuildContext context, int index) {
                Group item = Group.fromJson(
                  data.docs[index].data(),
                );
                return Material(
                  elevation: 1,
                  color: Colors.white,
                  child: ListTile(
                    title: Text(item.name),
                  ),
                );
              },
            );
          },
        ),
      ),

    );
  }
}
