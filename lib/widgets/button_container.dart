import 'package:flutter/material.dart';
import 'package:wein_flu/design/colors.dart';

class ButtonContainer extends StatelessWidget {
  final IconButton iconButton;
  final EdgeInsetsGeometry? margin;

  const ButtonContainer({super.key, required this.iconButton, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: WeinFluColors.brandLightColorBorder),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        width: 40,
        height: 40,
        margin: margin,
        child: iconButton);
  }
}
