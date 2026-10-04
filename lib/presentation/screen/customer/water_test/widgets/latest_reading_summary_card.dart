import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class LatestReadingSummaryCard extends StatelessWidget {
  const LatestReadingSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16, 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            (Text(context.getString('latest_readings'),
                style: AppTypography.infoLabel)),

            /// "Normal" status badge
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                  color: AppColors.statusGreenBg,
                  borderRadius: BorderRadius.circular(8.r)),
              child: Text(
                "All Normal", // --> Replace with actual status
                style: AppTypography.badgeText
                    .copyWith(color: AppColors.inRangeGreen),
              ),
            )
          ]),
          12.verticalSpace,
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              // --> Replace with actual latest readings
              _buildReadingChip("FC 3.0"),
              _buildReadingChip("pH 7.2"),
              _buildReadingChip("TA 90"),
              _buildReadingChip("CYA 45"),
              _buildReadingChip("Salt 3200"),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildReadingChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      height: 24.h,
      decoration: BoxDecoration(
        color: AppColors.textGrey.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(label,
          style: AppTypography.badgeText.copyWith(color: AppColors.textGrey)),
    );
  }
}
