import 'package:flutter/material.dart';
import 'package:wein_flu/design/theme.dart';

import 'pages/home_page.dart';

class WeinFluAPP extends StatelessWidget {
  const WeinFluAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: WeinfluThemes.defaultTheme,
      home: const HomePage(),
    );
  }
}
