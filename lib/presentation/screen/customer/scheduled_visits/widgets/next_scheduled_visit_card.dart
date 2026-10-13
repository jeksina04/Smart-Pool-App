import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

/// A card widget that displays details about the next scheduled service.
class NextScheduledVisitCard extends StatelessWidget {
  const NextScheduledVisitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.recurringQuoteBg,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: SvgPicture.asset(
                  AppAssets.icCalendar,
                  width: 20.w,
                  height: 20.w,
                  colorFilter: const ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),
                ),
              ),

              16.horizontalSpace,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.getString('next_scheduled_visit'), style: AppTypography.cardTitle),
                    Text(
                      "Fri 7 Aug · 10:00 AM", // --> Replace with actual date and time
                      style: AppTypography.sectionHeader,
                    ),
                    Text("Full clean & balance · Ray", style: AppTypography.cardTitle), // --> Replace with actual technician name and service type
                  ],
                ),
              ),
            ],
          ),
          8.verticalSpace,

          /// Divider between header and schedule details
          const Divider(color: AppColors.dividerColor, indent: 2, endIndent: 2,),

          8.verticalSpace,

          Row(
            children: [
              SvgPicture.asset(AppAssets.icRoute,),

              16.horizontalSpace,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "White Ford Transit 250 · NSP-4471", // --> Replace with actual car detail
                      style: AppTypography.skipButton,
                    ),
                    Text(context.getString('vehicle_search_instruction'), style: AppTypography.cardTitle),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}