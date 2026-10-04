import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ez_localization/ez_localization.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class PoolScoreChart extends StatelessWidget {
  final int score;
  const PoolScoreChart({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.w,
      width: 180.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// Background Light Green Track
          SizedBox(
            height: 150.w,
            width: 150.w,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: 14.w,
              color: AppColors.statusGreen.withOpacity(0.2),
            ),
          ),

          /// Active Score Green Track
          SizedBox(
            height: 150.w,
            width: 150.w,
            child: CircularProgressIndicator(
              value: score / 100,
              strokeWidth: 14.w,
              strokeCap: StrokeCap.round,
              color: AppColors.statusGreen,
            ),
          ),

          /// Score Text Content
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "$score",
                style: AppTypography.dashboardHeading.copyWith(fontSize: 34.sp),
              ),
              Text(
                context.getString('out_of_100'),
                style: AppTypography.infoLabel.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}