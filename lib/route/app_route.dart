import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:money/domain/transaction/transaction_model.dart';
import 'package:money/presentation/create_group/create_group_page.dart';
import 'package:money/presentation/create_transaction/create_transaction_page.dart';
import 'package:money/presentation/group_selector/group_selector_page.dart';
import 'package:money/presentation/home/home_page.dart';
import 'package:money/presentation/search/search_page.dart';
import 'package:money/route/route_name.dart';

import '../enum/constant.dart';

MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  Map<String, dynamic> arg = <String, dynamic>{};
  if (settings.arguments != null) {
    arg = settings.arguments as Map<String, dynamic>;
  }
  log('ARG => $arg');

  switch (settings.name) {
    case RouteName.homePage:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const HomePage(),
        settings: const RouteSettings(name: RouteName.homePage),
      );
    case RouteName.createTransaction:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CreateTransactionPage(
          transaction: arg[Constant.transaction] ?? const TransactionModel(),
        ),
        settings: const RouteSettings(name: RouteName.createTransaction),
      );
    case RouteName.groupSelector:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const GroupSelectorPage(),
        settings: const RouteSettings(name: RouteName.groupSelector),
      );
    case RouteName.createGroup:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const CreateGroupPage(),
        settings: const RouteSettings(name: RouteName.createGroup),
      );
    case RouteName.searchPage:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const SearchPage(),
        settings: const RouteSettings(name: RouteName.searchPage),
      );

    default:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const HomePage(),
        settings: const RouteSettings(name: RouteName.homePage),
      );
  }
}
