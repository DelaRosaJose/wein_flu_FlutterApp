import 'package:flutter/material.dart';
import '../design/colors.dart';
import '../widgets/button_container.dart';

class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({
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
              image:
                  DecorationImage(image: AssetImage('assets/images/user.png')),
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
        Text(
          userName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonContainer(
                iconButton: IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Notification button pressed! 😊')));
                  },
                  icon: const Icon(Icons.notifications,
                      color: WeinFluColors.brandPrimaryColor),
                ),
                margin: const EdgeInsets.all(8),
              ),
              ButtonContainer(
                iconButton: IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: WeinFluColors.brandPrimaryColor,
                  ),
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('More options button pressed! 😊'))),
                ),
                margin: const EdgeInsets.all(8),
              )
            ],
          ),
        ),
      ],
    );
  }
}
