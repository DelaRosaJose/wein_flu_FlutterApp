import 'package:flutter/material.dart';
import 'package:wein_flu/design/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  final String userName = 'Store Name';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WeinFluColors.brandPrimaryColor,
      appBar: AppBar(
        toolbarHeight: 97,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        backgroundColor: WeinFluColors.brandLightColor,
        title: AppBarTitle(userName: userName),
      ),
      body: const Center(
        child: Text(
          'Hola Weincoders 🚀!!!',
        ),
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.userName,
  });

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(right: 12),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/user.png')),
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
        Text(
          userName,
          style: const TextStyle(color: WeinFluColors.brandPrimaryColor),
        ),
        const Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonContainer(
                icon: Icons.notifications,
                margin: EdgeInsets.all(8),
              ),
              ButtonContainer(icon: Icons.more_vert)
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonContainer extends StatelessWidget {
  final IconData icon;
  final EdgeInsetsGeometry? margin;

  const ButtonContainer({super.key, required this.icon, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: WeinFluColors.brandLightColorBorder),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      width: 40,
      height: 40,
      margin: margin,
      child: Icon(
        icon,
        color: WeinFluColors.brandPrimaryColor,
      ),
    );
  }
}
