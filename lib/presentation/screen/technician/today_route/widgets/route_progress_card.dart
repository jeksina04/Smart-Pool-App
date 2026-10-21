import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Progress overview card displaying stops progress, distance, ETA, and progress bar
class RouteProgressCard extends StatelessWidget {
  final int completedStops;
  final int totalStops;
  final String distance;
  final String eta;

  const RouteProgressCard({
    super.key,
    this.completedStops = 1,
    this.totalStops = 6,
    this.distance = '70.9 mi',
    this.eta = '4:10 pm',
  });

  @override
  Widget build(BuildContext context) {
    final progress = totalStops > 0 ? (completedStops / totalStops).clamp(0.0, 1.0) : 0.0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A102A50),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Labels row: "Progress" & "70.9 mi · ETA"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Progress',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGrey,
                ),
              ),
              Text(
                '$distance · ETA',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGrey,
                ),
              ),
            ],
          ),
          4.verticalSpace,

          /// Values row: "1 / 6 stops" & "4:10 pm"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$completedStops ',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.darkNavy,
                      ),
                    ),
                    TextSpan(
                      text: '/ $totalStops stops',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.darkNavy,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                eta,
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.darkNavy,
                ),
              ),
            ],
          ),
          12.verticalSpace,

          /// Progress Bar: Green progress fill with light grey track
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6.h,
              backgroundColor: const Color(0xFFEFF2F6),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF10B981)),
            ),
          ),
        ],
      ),
    );
  }
}
