import 'package:flutter/material.dart';
import 'package:wein_flu/models/user.dart';

class OtherPage extends StatelessWidget {
  final User userData;
  const OtherPage({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('User: ${userData.name}  With: ${userData.age} years old')
              ],
            ),
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('This is the other page.')),
          ],
        ),
      ),
    );
  }
}
