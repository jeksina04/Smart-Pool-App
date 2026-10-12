import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class ApproveQuoteSummaryCard extends StatelessWidget {
  final Map<String, dynamic> quote;

  const ApproveQuoteSummaryCard({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 8,
              offset: const Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  context.getString('quote_number', {'id': quote['id']}),
                  style: AppTypography.quoteDetail),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                    color: AppColors.statusHighBg,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Text(context.getString('status_awaiting'),
                    style: AppTypography.awaitingText),
              ),
            ],
          ),
          8.verticalSpace,
          Text(quote['title'], style: AppTypography.userNameText),
          8.verticalSpace,
          const Divider(
            height: 1,
            color: AppColors.dividerColor,
            indent: 2,
            endIndent: 2,
          ),
          8.verticalSpace,
          _buildDetailRow(context.getString('quoted_by'), quote['company']),
          8.verticalSpace,
          _buildDetailRow(context.getString('valid_until'), quote['validUntil']),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      children: [
        Text(label, style: AppTypography.quoteDetail),
        const Spacer(),
        Text(value, style: AppTypography.quoteDetailInfo),
      ],
    );
  }
}
