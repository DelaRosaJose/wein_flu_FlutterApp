import 'package:flutter/material.dart';
import 'package:wein_flu/config/app_routes.dart';
import 'package:wein_flu/models/user.dart';

class NewPageNav extends StatelessWidget {
  const NewPageNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed(
                AppRoutes.otherPage,
                arguments: User(name: 'Jose', age: 24)),
            child: const Text('Hola esta es una gran pantalla')),
      ),
    );
  }
}
