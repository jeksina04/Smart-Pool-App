import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Top header bar for Today's Route with 3-line hamburger menu, title, and notification bell
class RouteHeaderBar extends StatelessWidget {
  final VoidCallback onMenuTap;
  final VoidCallback? onNotificationTap;
  final String title;
  final bool hasNotification;

  const RouteHeaderBar({
    super.key,
    required this.onMenuTap,
    this.onNotificationTap,
    this.title = 'Today · Mon 4 Aug',
    this.hasNotification = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// 3-line hamburger menu button
          InkWell(
            onTap: onMenuTap,
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0C102A50),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.menu_rounded,
                  size: 22.w,
                  color: AppColors.darkNavy,
                ),
              ),
            ),
          ),

          /// Title
          Text(
            title,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),

          /// Notification bell with badge dot
          InkWell(
            onTap: onNotificationTap,
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0C102A50),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.notifications_none_rounded,
                    size: 22.w,
                    color: AppColors.darkNavy,
                  ),
                  if (hasNotification)
                    Positioned(
                      top: 8.h,
                      right: 9.w,
                      child: Container(
                        width: 7.w,
                        height: 7.w,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE53935),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
