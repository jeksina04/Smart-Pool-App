import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

/// Displays app branding, notifications, user greeting, and weather
class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Top Branding and Notifications Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(AppAssets.spLogoOnboarding, width: 32.w),
                8.horizontalSpace,
                Image.asset(
                  AppAssets.woodmarkOnboarding,
                  height: 12.h,
                  fit: BoxFit.contain,
                ),
              ],
            ),

            /// Notification Bell with Badge
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 36.w,
                  height: 36.w,
                  padding: EdgeInsets.all(8.w),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(AppAssets.icBell),
                ),
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: const BoxDecoration(
                      color: AppColors.notificationRed,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                        "3", // --> Replace with actual notification count
                        style: AppTypography.notificationCountText),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
