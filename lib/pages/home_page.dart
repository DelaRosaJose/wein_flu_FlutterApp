import 'package:flutter/material.dart';
import 'package:wein_flu/design/colors.dart';
import 'package:wein_flu/design/radius.dart';
import 'package:wein_flu/pages/home_app_bar_title.dart';
import 'package:wein_flu/widgets/custom_money_display.dart';
import 'package:wein_flu/widgets/summary_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String userName = 'Store Name';
  var buttonStyleInactive = ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: WeinFluColors.brandLightColor,
      shadowColor: WeinFluColors.brandLightColor);
  var buttonStyleActive = ElevatedButton.styleFrom(
      backgroundColor: WeinFluColors.brandSecondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // <-- Radius
      ));

  late ButtonStyle categorieBtnStyle;
  late ButtonStyle recentTransactionsBtnStyle;

  @override
  void initState() {
    super.initState();

    categorieBtnStyle = buttonStyleActive;
    recentTransactionsBtnStyle = buttonStyleInactive;
  }

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
      body: Column(
        children: [
          const TopHomePageBody(),
          MidHomePageBody(
            categorieBtnStyle: categorieBtnStyle,
            recentTransactionsBtnStyle: recentTransactionsBtnStyle,
            categoriesBtnAction: () {
              setState(() {
                // currentDetailWidget = const CategoriesWidget();
                categorieBtnStyle = buttonStyleActive;
                recentTransactionsBtnStyle = buttonStyleInactive;
              });
            },
            recentBtnAction: () {
              setState(() {
                categorieBtnStyle = buttonStyleInactive;
                recentTransactionsBtnStyle = buttonStyleActive;
                // currentDetailWidget = const RecentTransactions();
              });
            },
          ),
        ],
      ),
    );
  }
}

class MidHomePageBody extends StatelessWidget {
  final ButtonStyle categorieBtnStyle;
  final ButtonStyle recentTransactionsBtnStyle;
  final void Function()? categoriesBtnAction;
  final void Function()? recentBtnAction;

  const MidHomePageBody(
      {super.key,
      required this.categorieBtnStyle,
      required this.recentTransactionsBtnStyle,
      required this.categoriesBtnAction,
      required this.recentBtnAction});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        height: 90,
        transform: Matrix4.translationValues(0, -20, 0),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: WeinFluColors.brandLightColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16))),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                style: categorieBtnStyle,
                onPressed: categoriesBtnAction,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                        color: WeinFluColors.brandDarkColor, fontSize: 14),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                style: recentTransactionsBtnStyle,
                onPressed: recentBtnAction,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Recent transaction',
                    style: TextStyle(
                        color: WeinFluColors.brandLigthDarkColor, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ));
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
