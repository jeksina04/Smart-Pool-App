import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class InvoicePaidCard extends StatelessWidget {
  final String invoiceNumber;
  final String month;
  final String paidDate;
  final String paymentMethod;
  final String lineItemSummary;
  final String amountPaid;
  final VoidCallback? onReceiptTap;

  const InvoicePaidCard({
    super.key,
    required this.invoiceNumber,
    required this.month,
    required this.paidDate,
    required this.paymentMethod,
    required this.lineItemSummary,
    required this.amountPaid,
    this.onReceiptTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Left Document Icon
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: AppColors.recurringQuoteBg,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: SvgPicture.asset(
                    AppAssets.icDocument,
                    width: 20.w,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryBlue,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                12.horizontalSpace,

                /// Invoice Number & Payment Method
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$invoiceNumber · $month",
                        style: AppTypography.inputText
                      ),
                      Text(
                        "Paid $paidDate · $paymentMethod",
                        style: AppTypography.inputText
                      ),
                    ],
                  ),
                ),

                /// Paid Badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.phStatusBg,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    context.getString('paid_status_badge', {'price': amountPaid}),
                    style: AppTypography.badgeText
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.dividerColor),

          /// Line Item Summary & Receipt Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    lineItemSummary,
                    style: AppTypography.infoLabel
                  ),
                ),
                12.horizontalSpace,
                GestureDetector(
                  onTap: onReceiptTap,
                  child: Text(
                    context.getString('receipt'),
                    style: AppTypography.forgotPassword
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}