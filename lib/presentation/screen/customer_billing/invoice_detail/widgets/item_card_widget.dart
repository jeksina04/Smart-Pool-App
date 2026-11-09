import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class InvoiceDetailItemsCard extends StatelessWidget {
  const InvoiceDetailItemsCard({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8.r,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        children: [
          // --> Replace with Actual data
          _buildItem("Weekly Pool Cleaning", "Visit of 18 Aug · Ray Delgado", "\$135.00"),
          const Divider(height: 1, color: AppColors.dividerColor,),
          _buildItem("Bag of salt 40lb", "Added on the 18 Aug visit", "\$18.00"),
          const Divider(height: 1, color: AppColors.dividerColor,),
          _buildItem("Sales tax · 8.25% on parts — Fort Bend County", null, "\$1.49"),
          const Divider(height: 1, color: AppColors.dividerColor,),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.invoiceDetailTotalBg,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.getString('total_label'), style: AppTypography.nextButton),
                Text("\$154.49", style: AppTypography.quickActionsHeading),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String title, String? subtitle, String price) {
    final isSalesTax = title.startsWith("Sales tax");
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: isSalesTax
                      ? AppTypography.inputHint
                      : AppTypography.sectionHeader,
                ),
                if (subtitle != null) ...[
                  4.verticalSpace,
                  Text(
                    subtitle,
                    style: AppTypography.infoLabel,
                  ),
                ],
              ],
            ),
          ),
          16.horizontalSpace,
          Text(
            price,
            style: isSalesTax
                ? AppTypography.inputText
                : AppTypography.poolHealthScore,
          ),
        ],
      ),
    );
  }
}