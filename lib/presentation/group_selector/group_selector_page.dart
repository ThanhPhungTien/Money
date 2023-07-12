import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money/application/group_selector/group_selector_bloc.dart';
import 'package:money/model/group/group.dart';
import 'package:money/presentation/create_group/create_group_page.dart';
import 'package:money/presentation/failure/failure_view.dart';
import 'package:money/presentation/loading/loading_view.dart';
import 'package:money/presentation/tool/palatte.dart';
import 'package:money/presentation/tool/tool.dart';
import 'package:money/route/route_name.dart';

class GroupSelectorPage extends StatefulWidget {
  const GroupSelectorPage({Key? key}) : super(key: key);

  static Future<dynamic> show({required BuildContext context}) async {
    return context.navigator.pushNamed(RouteName.groupSelector);
  }

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
              await CreateGroupPage.show(context: context);
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                            return Dismissible(
                              key: Key(item.id),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                bloc.add(GroupSelectorEventDelete(item));
                              },
                              confirmDismiss: (DismissDirection direction) =>
                                  showDeleteConfirm(context, item),
                              background: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFFBA1A1A),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.white,
                                ),
                              ),
                              child: ItemGroupView(item: item),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              height: 2,
                              indent: 72,
                              thickness: 0.5,
                            );
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

  Future<bool?> showDeleteConfirm(BuildContext context, Group group) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Xác nhận xóa'),
          content: Text(
            'Bạn có chắc muốn xóa "${group.name}" ?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Đóng'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Xác nhận'),
            ),
          ],
        );
      },
    );
  }
}

class ItemGroupView extends StatelessWidget {
  const ItemGroupView({
    super.key,
    required this.item,
  });

  final Group item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pop(context, item),
      title: Text(item.name),
      leading: CircleAvatar(
        backgroundColor: item.mode == -1 ? Palette.decrease : Palette.increase,
        child: Icon(
          item.mode == -1 ? Icons.remove : Icons.add,
          color: Colors.white,
        ),
      ),
      subtitle: item.description.isNotEmpty ? Text(item.description) : null,
    );
  }
}
