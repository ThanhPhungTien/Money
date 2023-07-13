import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tìm kiếm giao dịch'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SearchBar(),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
