import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ez_localization/ez_localization.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

/// A card widget that displays details about the next scheduled pool service.
class UpcomingServiceCard extends StatelessWidget {
  const UpcomingServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          /// Top Row: Service Icon and Title
          Row(
            children: [
              /// Upcoming Service icon in a light blue box
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.infoBannerBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: SvgPicture.asset(
                  AppAssets.icCalendar,
                  width: 20.w,
                  colorFilter: const ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),
                ),
              ),

              16.horizontalSpace,

              /// Service name and header
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.getString('upcoming_service'), style: AppTypography.cardLabel.copyWith(fontWeight: FontWeight.w400)),
                    Text(
                      "Pool Cleaning", // --> Replace with actual service name
                      style: AppTypography.cardLabel.copyWith(fontSize: 16.sp, color: AppColors.darkNavy),
                    ),
                  ],
                ),
              ),

              /// Directional arrow icon
              SvgPicture.asset(AppAssets.icChevronRight),
            ],
          ),
          8.verticalSpace,

          /// Divider between header and schedule details
          const Divider(color: AppColors.dividerColor),

          8.verticalSpace,

          /// Bottom Row: Date and Time information
          Row(
            children: [
              /// Date section
              SvgPicture.asset(
                AppAssets.icCalendar,
                width: 16.w,
                colorFilter: const ColorFilter.mode(AppColors.textGrey, BlendMode.srcIn),
              ),
              8.horizontalSpace,
              Text("24 May 2026", style: AppTypography.infoLabel), // --> Replace with actual date
              16.horizontalSpace,
              /// Time section
              const Icon(Icons.access_time, size: 16, color: AppColors.textGrey),
              8.horizontalSpace,
              Text("10:00 AM", style: AppTypography.infoLabel), // --> Replace with actual time
            ],
          ),
        ],
      ),
    );
  }
}