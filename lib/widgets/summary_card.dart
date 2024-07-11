import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wein_flu/design/colors.dart';
import 'package:wein_flu/design/radius.dart';
import 'package:wein_flu/widgets/button_container.dart';
import 'package:wein_flu/widgets/custom_money_display.dart';

enum TypeofCard { incomes, speding }

class SummaryCard extends StatelessWidget {
  final TypeofCard typeofCard;
  final double amount;
  final String period;
  final void Function()? action;

  const SummaryCard(
      {super.key,
      required this.typeofCard,
      required this.amount,
      required this.period,
      this.action});

  @override
  Widget build(BuildContext context) {
    final Icon icon = typeofCard == TypeofCard.incomes
        ? const Icon(
            Icons.arrow_upward,
            color: WeinFluColors.brandOnSuccessColor,
          )
        : const Icon(
            Icons.arrow_downward,
            color: WeinFluColors.brandOnErrorColor,
          );

    return Container(
      height: 92,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      decoration: const BoxDecoration(
        color: WeinFluColors.brandLightColorOpacity,
        borderRadius: BorderRadius.all(WeinFluRadius.small),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: WeinFluColors.brandLightColor),
            margin: const EdgeInsets.only(right: 8),
            child: icon,
          ),
          Expanded(
            child: Text(
              toBeginningOfSentenceCase(typeofCard.name),
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                  color: WeinFluColors.brandLightColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomMoneyDisplay(
                padding: const EdgeInsets.only(top: 2, right: 5),
                amount: amount,
                amountStyle: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: WeinFluColors.brandLightColor),
                amountStyleSmall: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: WeinFluColors.brandLightColor),
              ),
              Text(
                period,
                style: const TextStyle(
                  fontSize: 10,
                  color: WeinFluColors.brandLightColor,
                  fontFamily: 'RobotoMono',
                ),
              ),
            ],
          ),
          ButtonContainer(
            iconButton: IconButton(
                onPressed: action,
                icon: const Icon(
                  Icons.chevron_right,
                  color: WeinFluColors.brandLightColor,
                )),
            margin: const EdgeInsets.only(left: 15),
          )
        ],
      ),
    );
  }
}
