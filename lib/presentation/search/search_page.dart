import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:money/application/search/search_bloc.dart';
import 'package:money/model/group/group.dart';
import 'package:money/presentation/group_selector/group_selector_page.dart';
import 'package:money/presentation/tool/tool.dart';
import 'package:money/route/route_name.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  static Future<dynamic> show({required BuildContext context}) async {
    return context.navigator.pushNamed(RouteName.searchPage);
  }

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bloc = SearchBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tìm kiếm giao dịch'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.calendar_month_outlined),
              onTap: () => openSelectDate(DateTime.now()),
              title: const Text('Tháng giao dịch'),
            ),
            ListTile(
              leading: const Icon(Icons.bookmark_add_outlined),
              onTap: openGroupSelector,
              title: const Text('Loại giao dịch'),
            ),
            ListTile(
              leading: const Icon(Icons.person_2_outlined),
              onTap: showSelectGoal,
              title: const Text('Người tạo'),
            ),
          ],
        ),
      ),
    );
  }

  openGroupSelector() async {
    dynamic result = await GroupSelectorPage.show(context: context);

    if (result != null && result is Group) {
      log('openGroupSelector');
    }
  }

  openSelectDate(DateTime time) async {
    dynamic result = await showMonthDialog(context: context, initTime: time);
    if (result != null && result is DateTime) {}
  }

  showSelectGoal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              title: Text('Giao dịch này dùng cho ai?'),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: Text(textByGoal(index)),
                  trailing: iconByGoal(index),
                );
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: const Text('Bỏ lọc'),
              trailing: const Icon(Icons.filter_alt_off_outlined),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
