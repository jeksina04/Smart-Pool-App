import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

/// A single row within the profile settings list
class ProfileListItem extends StatelessWidget {
  final String icon;
  final String title;
  final String? subtitle;
  final String? badgeText; // Text inside a red badge
  final String? statusText; // Plain text status

  const ProfileListItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.badgeText,
    this.statusText,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),

      /// Icon inside a rounded blue background
      leading: Container(
        padding: EdgeInsets.all(10.w),
        height: 40.w,
        width: 40.w,
        decoration: BoxDecoration(
          color: AppColors.infoBannerBg,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: SvgPicture.asset(
          icon,
          width: 20.w,
          height: 20.w,
          colorFilter:
              const ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),
        ),
      ),
      title: Text(title, style: AppTypography.sectionHeader),
      subtitle: subtitle != null
          ? Text(subtitle!, style: AppTypography.infoLabel)
          : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Display a red badge if due items exist
          if (badgeText != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              margin: EdgeInsets.only(right: 8.w),
              decoration: BoxDecoration(
                color: AppColors.notificationRed.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(badgeText!,
                  style: AppTypography.badgeText.copyWith(color: AppColors.notificationAlertText)),
            ),

          /// Display plain status text if provided
          if (statusText != null)
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Text(statusText!, style: AppTypography.infoLabel),
            ),
          SvgPicture.asset(AppAssets.icChevronRight,),
        ],
      ),
      onTap: () {},
    );
  }
}
