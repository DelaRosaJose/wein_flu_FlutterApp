import 'package:flutter/material.dart';
import 'package:wein_flu/design/colors.dart';
import 'package:wein_flu/design/radius.dart';
import 'package:wein_flu/pages/home_app_bar_title.dart';
import 'package:wein_flu/widgets/custom_money_display.dart';
import 'package:wein_flu/widgets/summary_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  final String userName = 'Store Name';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 97,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: WeinFluRadius.small,
            bottomRight: WeinFluRadius.small,
          ),
        ),
        backgroundColor: WeinFluColors.brandLightColor,
        title: HomeAppBarTitle(userName: userName),
      ),
      body: const TopHomePageBody(),
    );
  }
}

class TopHomePageBody extends StatelessWidget {
  const TopHomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      transform: Matrix4.translationValues(0, -12, 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: WeinFluRadius.xs,
          bottomRight: WeinFluRadius.xs,
        ),
        color: WeinFluColors.brandPrimaryColor,
      ),
      height: 389,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 56),
                    child: Text(
                      'Your Budget',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: WeinFluColors.brandLightColor),
                    )),
                CustomMoneyDisplay(
                  amount: 2868000.12,
                  padding: const EdgeInsets.only(top: 8, right: 4),
                  amountStyle: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: WeinFluColors.brandLightColor),
                  amountStyleSmall: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: WeinFluColors.brandLightColor),
                ),
              ],
            ),
          ),
          SummaryCard(
              typeofCard: TypeofCard.incomes,
              amount: 700000,
              period: 'From January 1 to January 31',
              action: () => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: WeinFluColors.brandOnSuccessColor,
                      content: Text(
                        '${TypeofCard.incomes.name} Action Pushed 😃',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: WeinFluColors.brandLightColor,
                            ),
                      ),
                    ),
                  )),
          SummaryCard(
            typeofCard: TypeofCard.speding,
            amount: 90000,
            period: 'From January 1 to January 31',
            action: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: WeinFluColors.brandOnErrorColor,
                content: Text(
                  '${TypeofCard.speding.name} Action Pushed 🙃',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: WeinFluColors.brandLightColor,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
