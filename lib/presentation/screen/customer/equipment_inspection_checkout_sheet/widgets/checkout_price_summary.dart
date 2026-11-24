import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class CheckoutPriceSummary extends StatelessWidget {
  final double subtotalWithTax;
  final double cardFeeRate;
  final double cardFeeAmount;
  final double totalCharged;

  const CheckoutPriceSummary({
    super.key,
    required this.subtotalWithTax,
    required this.cardFeeRate,
    required this.cardFeeAmount,
    required this.totalCharged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Total Subtotal Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.getString('total_label'),
              style: AppTypography.sectionHeader,
            ),
            Text(
              "\$${subtotalWithTax.toStringAsFixed(2)}",
              style: AppTypography.poolCareSupport,
            ),
          ],
        ),
        16.verticalSpace,

        /// Card Fee Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.getString('card_fee', {'fee': "${cardFeeRate.toStringAsFixed(2)}%"}),
              style: AppTypography.infoLabel,
            ),
            Text(
              "\$${cardFeeAmount.toStringAsFixed(2)}",
              style: AppTypography.quoteDetailInfo,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: const Divider(
            height: 1,
            color: AppColors.dividerColor,
          ),
        ),

        /// Final Charged Total Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.getString('charged_to_your_card'),
              style: AppTypography.tabTextUnselected,
            ),
            Text(
              "\$${totalCharged.toStringAsFixed(2)}",
              style: AppTypography.quickActionsHeading,
            ),
          ],
        ),
      ],
    );
  }
}