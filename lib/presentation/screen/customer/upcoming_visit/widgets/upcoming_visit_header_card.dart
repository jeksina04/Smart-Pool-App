import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class UpcomingVisitHeaderCard extends StatelessWidget {
  final String fullDateTime;
  final String technicianName;

  const UpcomingVisitHeaderCard({
    super.key,
    required this.fullDateTime,
    required this.technicianName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          color: AppColors.infoBannerBg,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(color: AppColors.cardShadow,
                blurRadius: 8,
                offset: Offset(0, 2))
          ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: SvgPicture.asset(AppAssets.icCalendar,),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    context.getString('scheduled_visit_label'),
                    style: AppTypography.cardTitle
                ),
                Text(
                    fullDateTime,
                    style: AppTypography.sectionHeader
                ),
                Text(
                    context.getString(
                      'arrival_window_notice',
                      {'technician': technicianName},
                    ),
                    style: AppTypography.infoLabel
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}