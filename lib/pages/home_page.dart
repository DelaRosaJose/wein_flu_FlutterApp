import 'package:flutter/material.dart';
import 'package:wein_flu/design/colors.dart';
import 'package:wein_flu/design/radius.dart';
import 'package:wein_flu/pages/home_app_bar_title.dart';
import 'package:wein_flu/widgets/custom_money_display.dart';
import 'package:wein_flu/widgets/product_detail_card.dart';
import 'package:wein_flu/widgets/summary_card.dart';
import 'package:wein_flu/widgets/transation_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Widget currentDetailWidget = const CategoriesWidget();

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
      backgroundColor: WeinFluColors.brandSecondaryColor,
      appBar: AppBar(
        toolbarHeight: 60,
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
                currentDetailWidget = const CategoriesWidget();
                categorieBtnStyle = buttonStyleActive;
                recentTransactionsBtnStyle = buttonStyleInactive;
              });
            },
            recentBtnAction: () {
              setState(() {
                categorieBtnStyle = buttonStyleInactive;
                recentTransactionsBtnStyle = buttonStyleActive;
                currentDetailWidget = const RecentTransactions();
              });
            },
          ),
          Expanded(child: currentDetailWidget)
        ],
      ),
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
        transform: Matrix4.translationValues(0, -6, 0),
        height: 90,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color.fromARGB(255, 255, 255, 255),
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

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          onPressed: () {},
          style: const ButtonStyle(alignment: Alignment.topRight),
          child: Text(
            'View All',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: WeinFluColors.brandPrimaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        const ProductDetailCard(
          imageAsset: 'assets/images/pizza.png',
          amount: 391254.01,
          productName: 'Food & Drink',
          currentSells: '2250',
          percentage: '1.8',
          typeProductDetailCard: TypeProductDetailCard.incomes,
        ),
        const ProductDetailCard(
          typeProductDetailCard: TypeProductDetailCard.incomes,
          imageAsset: 'assets/images/tv.png',
          amount: 3176254.01,
          productName: 'Electronics',
          currentSells: '2250',
          percentage: '43.6',
        ),
        const ProductDetailCard(
          typeProductDetailCard: TypeProductDetailCard.outcomes,
          imageAsset: 'assets/images/health.png',
          amount: 38.01,
          productName: 'Health',
          currentSells: '110',
          percentage: '25.8',
        ),
        const SizedBox(
          height: 14,
        ),
      ],
    );
  }
}

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          onPressed: () {},
          style: const ButtonStyle(alignment: Alignment.topRight),
          child: Text(
            'View All',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: WeinFluColors.brandPrimaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        TransactionDetailByDay(
          day: 'TUE',
          isToday: true,
          dayNumber: 4,
          listofTransactions: [
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Monday 3th,  September 2023',
                typeTransaction: TypeTransaction.negative,
                amount: 420.16),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Monday 3th,  September 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 433.35)
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        TransactionDetailByDay(
          day: 'MON',
          isToday: false,
          dayNumber: 3,
          listofTransactions: [
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Monday 3th,  September 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 720.92),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Monday 3th,  September 2023',
                typeTransaction: TypeTransaction.negative,
                amount: 84.45),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Monday 3th,  September 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 137.26)
          ],
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
