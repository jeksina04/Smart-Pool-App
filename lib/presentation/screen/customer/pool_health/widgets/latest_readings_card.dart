import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ez_localization/ez_localization.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class LatestReadingsCard extends StatelessWidget {
  const LatestReadingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 0, 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.getString('latest_readings'), style: AppTypography.infoLabel),
          12.verticalSpace,
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              // --> Replace with actual latest readings
              _buildReadingChip("FC 3.0"),
              _buildReadingChip("pH 7.2"),
              _buildReadingChip("TA 90"),
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
      child: Text(label, style: AppTypography.badgeText.copyWith(color: AppColors.textGrey)),
    );
  }
}