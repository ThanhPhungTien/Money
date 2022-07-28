import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/pages/group_selector/group_selector_bloc.dart';

import '../../model/group/group.dart';

class GroupSelectorPage extends StatefulWidget {
  const GroupSelectorPage({Key? key}) : super(key: key);

  @override
  State<GroupSelectorPage> createState() => _GroupSelectorPageState();
}

class _GroupSelectorPageState extends State<GroupSelectorPage> {
  GroupSelectorBloc bloc = GroupSelectorBloc()..add(GroupSelectorEventInit());

  TextEditingController searchTEC = TextEditingController();

  @override
  void initState() {
    searchTEC.addListener(() {
      bloc.add(GroupSelectorEventSearching(searchTEC.text.trim()));
    });

    super.initState();
  }

  @override
  void dispose() {
    searchTEC.dispose();
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn nhóm'),
      ),
      body: BlocBuilder<GroupSelectorBloc, GroupSelectorState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is GroupSelectorStateGotData) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Nhập tên nhóm',
                      suffixIcon: const Icon(Icons.search),
                      suffix: GestureDetector(
                        onTap: () => searchTEC.clear(),
                        child: const Icon(Icons.clear),
                      ),
                    ),
                    controller: searchTEC,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: state.data.isEmpty
                      ? const Center(child: Text('Không thấy'))
                      : ListView.separated(
                    padding: const EdgeInsets.all(8),
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          itemCount: state.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            Group item = state.data[index];
                            return Material(
                              elevation: 2,
                              color: Colors.white,
                              child: ListTile(
                                onTap: () => Navigator.pop(context, item),
                                leading: const SizedBox(
                                  height: double.infinity,
                                  child: Icon(Icons.ad_units),
                                ),
                                title: Text(item.name),
                                trailing: Text(item.mode == -1 ? 'Giảm' : 'Tăng'),
                                subtitle: Text(item.description),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 8);
                          },
                        ),
                ),
              ],
            );
          } else if (state is GroupSelectorStateFetchingError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is GroupSelectorStateFetching) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
