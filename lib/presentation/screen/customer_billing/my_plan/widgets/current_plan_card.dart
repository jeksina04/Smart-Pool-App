import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class CurrentPlanCard extends StatelessWidget {
  const CurrentPlanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        gradient: const LinearGradient(
          colors: AppColors.waterQualityGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --> Replace with actual plan detail
          Text(
            context.getString('current_plan'),
            style: AppTypography.waterQualityLabel
          ),
          Text(
            "Standard",
            style: AppTypography.cardValueLarge
          ),
          Text(
            "\$85 / month · weekly visits · next charge 1 Sep",
            style: AppTypography.infoText,
          ),
        ],
      ),
    );
  }
}