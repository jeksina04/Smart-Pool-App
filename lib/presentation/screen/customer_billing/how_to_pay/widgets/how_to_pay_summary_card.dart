import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class HowToPaySummaryCard extends StatelessWidget {
  final Map<String, dynamic> invoice;

  const HowToPaySummaryCard({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.cardBorder),
          boxShadow: [
            BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: Offset(0, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                invoice['amount'],
                style: AppTypography.poolCareSupport,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.statusHighBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  context.getString('unpaid'),
                  style: AppTypography.awaitingText,
                ),
              ),
            ],
          ),
          8.verticalSpace,
          Text(
            context.getString('invoice_detail_line', {
              'id': invoice['id'],
              'month': invoice['month'],
              'date': '3 Sep'
            }),
            style: AppTypography.cardTitle,
          ),
        ],
      ),
    );
  }
}