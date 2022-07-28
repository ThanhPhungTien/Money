import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:money/pages/create_transaction/create_transaction_page.dart';
import 'package:money/pages/group_selector/group_selector_page.dart';
import 'package:money/pages/home/home_page.dart';
import 'package:money/route/route_name.dart';

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
        builder: (BuildContext context) => const CreateTransactionPage(),
        settings: const RouteSettings(name: RouteName.createTransaction),
      ); case RouteName.groupSelector:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const GroupSelectorPage(),
        settings: const RouteSettings(name: RouteName.groupSelector),
      );
    default:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const HomePage(),
        settings: const RouteSettings(name: RouteName.homePage),
      );
  }
}
