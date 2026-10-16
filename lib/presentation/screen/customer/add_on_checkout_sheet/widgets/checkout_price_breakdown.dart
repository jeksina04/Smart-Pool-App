import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../util/app_colors.dart';
import '../../../../../../util/app_typography.dart';

class CheckoutPriceBreakdown extends StatelessWidget {
  const CheckoutPriceBreakdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Service and tax card
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildRow(
                context.getString('filter_deep_clean'),
                '\$120.00',
              ),
              const Divider(
                height: 1,
                color: AppColors.dividerColor,
              ),
              _buildRow(
                context.getString(
                  'sales_tax',
                  {'tax': '8.25%'},
                ),
                '\$9.90',
              ),
            ],
          ),
        ),

        16.verticalSpace,

        _buildSummaryRow(
          context.getString('total_label'),
          '\$129.90',
          isBold: true,
        ),

        16.verticalSpace,

        _buildSummaryRow(
          context.getString('card_fee', {'fee': '2.99%'}),
          '\$3.88',
          isGrey: true,
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: const Divider(
            height: 1,
            color: AppColors.dividerColor,
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.getString('charged_to_your_card'),
              style: AppTypography.tabTextUnselected,
            ),
            Text(
              '\$133.78',
              style: AppTypography.quickActionsHeading,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildRow(String label, String value) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 4.h,
      ),
      title: Text(label, style: AppTypography.sectionHeader),
      trailing: Text(
        value,
        style: AppTypography.infoLabel,
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isBold = false,
    bool isGrey = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            label,
            style:
                isGrey ? AppTypography.infoLabel : AppTypography.sectionHeader,
          ),
        ),
        8.verticalSpace,
        Text(
          value,
          style: isBold
              ? AppTypography.poolCareSupport
              : AppTypography.quoteDetailInfo,
        ),
      ],
    );
  }
}
