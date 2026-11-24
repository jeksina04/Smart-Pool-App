import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../util/app_colors.dart';
import '../../../../../../util/app_typography.dart';

class PayInvoiceSummary extends StatelessWidget {
  final String invoiceId;
  final String amount;
  final String fee_added;
  final String total;

  const PayInvoiceSummary({
    super.key,
    required this.invoiceId,
    required this.amount,
    required this.fee_added,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.white,
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
          _buildSummaryRow(
            context.getString('invoice', {'id': invoiceId}),
            amount,
          ),
          8.verticalSpace,
          _buildSummaryRow(context.getString('card_fee', {'fee': '2.99%'}), fee_added),

          8.verticalSpace,
          const Divider(height: 1, color: AppColors.dividerColor, indent: 1, endIndent: 1),
          8.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.getString('total_label'),
                style: AppTypography.inputText,
              ),
              Text(
                total,
                style: AppTypography.inputText,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTypography.cardTitle),
        Text(value, style: AppTypography.quoteDetailInfo),
      ],
    );
  }
}