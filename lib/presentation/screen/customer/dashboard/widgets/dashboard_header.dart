import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

/// Displays app branding, notifications, user greeting, and weather
class DashboardHeader extends StatelessWidget {
  final VoidCallback? onNotificationsTap;

  const DashboardHeader({super.key, this.onNotificationsTap});

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
                Image.asset(AppAssets.spLogoOnboarding,
                    width: 26.w, height: 26.w),
                8.horizontalSpace,
                Image.asset(
                  AppAssets.woodmarkOnboarding,
                  width: 98.w,
                  height: 11.77.w,
                  fit: BoxFit.contain,
                ),
              ],
            ),

            /// Notification Bell with Badge
            GestureDetector(
              onTap: onNotificationsTap,
              child: Stack(
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
                      alignment: Alignment.center,
                      height: 16.w,
                      width: 16.w,
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
            ),
          ],
        ),
      ],
    );
  }
}
