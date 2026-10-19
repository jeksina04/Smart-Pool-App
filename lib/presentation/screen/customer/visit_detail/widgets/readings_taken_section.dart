import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class ReadingsTakenSection extends StatelessWidget {
  const ReadingsTakenSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8, offset: Offset(0,2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.getString('readings_taken'), style: AppTypography.infoLabel),
          12.verticalSpace,
          Wrap(spacing: 8.w, runSpacing: 8.h, children: [
            _buildReadingChip("FC 3.0"),
            _buildReadingChip("pH 7.4"),
            _buildReadingChip("TA 90"),
          ]),
        ],
      ),
    );
  }

  Widget _buildReadingChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      height: 24.h,
      decoration: BoxDecoration(
        color: AppColors.newUserMetricPlaceholder,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(label, style: AppTypography.latestReadings),
    );
  }
}
