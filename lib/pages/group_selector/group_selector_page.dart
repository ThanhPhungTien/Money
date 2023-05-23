import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/pages/group_selector/group_selector_bloc.dart';
import 'package:money/route/route_name.dart';
import 'package:money/widgets/loading/loading_view.dart';

import '../../model/group/group.dart';
import '../../widgets/failure/failure_view.dart';

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
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.pushNamed(context, RouteName.createGroup);
              bloc.add(GroupSelectorEventInit());
            },
            icon: const Icon(Icons.add_rounded),
          ),
        ],
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
                      ? const FailureView(message: 'Không có dữ liệu')
                      : ListView.separated(
                          padding: const EdgeInsets.all(8),
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          itemCount: state.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            Group item = state.data[index];
                            return ListTile(
                              titleAlignment:
                                  ListTileTitleAlignment.titleHeight,
                              onTap: () => Navigator.pop(context, item),
                              minLeadingWidth: 0,
                              onLongPress: () => showMenuBottom(context, item),
                              title: Text(item.name),
                              leading: CircleAvatar(
                                backgroundColor: item.mode == -1
                                    ? Colors.red.shade400
                                    : Colors.green.shade400,
                                child: Icon(
                                  item.mode == -1 ? Icons.remove : Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: item.description.isNotEmpty
                                  ? Text(item.description)
                                  : null,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider();
                          },
                        ),
                ),
              ],
            );
          } else if (state is GroupSelectorStateFetchingError) {
            return FailureView(message: state.message);
          } else if (state is GroupSelectorStateFetching) {
            return const LoadingView();
          }
          return Container();
        },
      ),
    );
  }

  showMenuBottom(BuildContext context, Group item) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text('Menu', style: Theme.of(context).textTheme.titleLarge),
              ),
              const SizedBox(height: 16),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  bloc.add(GroupSelectorEventDelete(item));
                },
                leading: const Icon(Icons.delete),
                title: const Text('Xóa'),
              ),
            ],
          );
        });
  }
}
