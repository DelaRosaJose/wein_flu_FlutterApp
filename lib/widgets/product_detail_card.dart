import 'package:flutter/material.dart';
import 'package:wein_flu/design/colors.dart';
import 'package:wein_flu/widgets/custom_money_display.dart';

enum TypeProductDetailCard { incomes, outcomes }

class ProductDetailCard extends StatelessWidget {
  final String percentage;
  final String imageAsset;
  final double amount;
  final String productName;
  final String currentSells;
  final TypeProductDetailCard typeProductDetailCard;

  const ProductDetailCard(
      {super.key,
      required this.percentage,
      required this.imageAsset,
      required this.typeProductDetailCard,
      required this.amount,
      required this.productName,
      required this.currentSells});

  @override
  Widget build(BuildContext context) {
    var iconIncomes = const Icon(
      Icons.expand_less,
      size: 20,
      color: WeinFluColors.brandOnSuccessColor,
    );
    var iconSpending = const Icon(
      Icons.expand_more,
      size: 20,
      color: WeinFluColors.brandOnErrorColor,
    );
    var currentBgPercentageColor = WeinFluColors.brandSuccessColor;
    var currentTextPercentageColor = WeinFluColors.brandOnSuccessColor;
    var currentIcon = iconIncomes;
    if (typeProductDetailCard == TypeProductDetailCard.outcomes) {
      currentBgPercentageColor = WeinFluColors.brandErrorColor;
      currentTextPercentageColor = WeinFluColors.brandOnErrorColor;
      currentIcon = iconSpending;
    }

    return Container(
      // width: 50,
      height: 90,
      margin: const EdgeInsets.only(
          // top: 14,
          right: 8,
          left: 8,
          bottom: 8),
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: WeinFluColors.brandLightColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          Image.asset(imageAsset),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(top: 13, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: WeinFluColors.brandDarkColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'RobotoMono',
                      fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    '+ \$ $currentSells Today',
                    style: const TextStyle(
                        color: WeinFluColors.brandLigthDarkColor,
                        fontFamily: 'RobotoMono',
                        fontSize: 10),
                  ),
                ),
                CustomMoneyDisplay(
                  padding: const EdgeInsets.only(top: 4, right: 2),
                  amount: amount,
                  amountStyle: const TextStyle(
                      color: WeinFluColors.brandPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  amountStyleSmall: const TextStyle(
                      color: WeinFluColors.brandPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                )
              ],
            ),
          )),
          Container(
            margin: const EdgeInsets.only(
              bottom: 40,
              // right: 16,
            ),
            height: 19,
            width: 55,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(19)),
                color: currentBgPercentageColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                currentIcon,
                Text(
                  '$percentage %',
                  style: TextStyle(
                      fontSize: 10, color: currentTextPercentageColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
