import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class CheckoutFeeDisclaimer extends StatelessWidget {
  final double cardFeeRate;
  final double bankFeeRate;

  const CheckoutFeeDisclaimer({
    super.key,
    this.cardFeeRate = 2.99,
    this.bankFeeRate = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final rawText = context.getString('inspection_payment_fee_notice');
    final partsCard = rawText.split('{cardFee}');
    final part1 = partsCard[0];
    final partsBank = partsCard.length > 1 ? partsCard[1].split('{bankFee}') : ['', ''];
    final part2 = partsBank[0];
    final part3 = partsBank.length > 1 ? partsBank[1] : '';

    return RichText(
      text: TextSpan(
        style: AppTypography.dividerText,
        children: [
          TextSpan(text: part1),
          TextSpan(
            text: "${cardFeeRate.toStringAsFixed(2)}%",
            style: const TextStyle(fontWeight: FontWeight.w700,),
          ),
          TextSpan(text: part2),
          TextSpan(
            text: "${bankFeeRate.toStringAsFixed(0)}%",
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          TextSpan(text: part3),
        ],
      ),
    );
  }
}