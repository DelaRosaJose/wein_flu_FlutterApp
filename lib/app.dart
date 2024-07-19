import 'package:flutter/material.dart';
import 'package:wein_flu/config/app_routes.dart';
import 'package:wein_flu/design/theme.dart';
import 'package:wein_flu/models/user.dart';
import 'package:wein_flu/pages/new_page.dart';
import 'package:wein_flu/pages/other_page.dart';

import 'pages/home_page.dart';

class WeinFluAPP extends StatelessWidget {
  const WeinFluAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: WeinfluThemes.defaultTheme,
        // routes: AppRoutes.routes2,
        onGenerateRoute: AppRoutes.routeConfiguration);
  }
}
