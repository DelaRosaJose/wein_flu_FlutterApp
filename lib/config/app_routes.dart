import 'package:flutter/material.dart';
import 'package:wein_flu/models/user.dart';
import 'package:wein_flu/pages/home_page.dart';
import 'package:wein_flu/pages/new_page.dart';
import 'package:wein_flu/pages/other_page.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/';
  static const String newPage = 'NewPage';
  static const String otherPage = 'OtherPage';

  // static Map<String, Widget Function(dynamic context)> routes2 = {
  //   AppRoutes.newPage: (context) => const NewPageNav(),
  //   AppRoutes.home: (context) => const HomePage(),
  //   AppRoutes.otherPage: (context) => const OtherPage(),
  // };

  static MaterialPageRoute Function(dynamic settings) routeConfiguration =
      (settings) {
    switch (settings.name) {
      case AppRoutes.newPage:
        return MaterialPageRoute(builder: ((context) => const NewPageNav()));
      case AppRoutes.otherPage:
        return MaterialPageRoute(
            builder: ((context) => OtherPage(
                  userData: settings.arguments as User,
                )));
      default:
        return MaterialPageRoute(builder: ((context) => const HomePage()));
    }
  };
}
