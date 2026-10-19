import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

/// A custom Bottom Navigation Bar tailored for the Customer Dashboard.
class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryBlue,
      unselectedItemColor: AppColors.textGrey,
      selectedLabelStyle: AppTypography.badgeText,
      unselectedLabelStyle: AppTypography.badgeText.copyWith(fontWeight: FontWeight.w500),
      items: [
        _buildNavItem(context, AppAssets.icNavHome, 'nav_home'),
        _buildNavItem(context, AppAssets.icNavServices, 'nav_services'),
        _buildNavItem(context, AppAssets.icNavHistory, 'nav_history'),
        _buildNavItem(context, AppAssets.icNavProfile, 'nav_profile'),
      ],
    );
  }

  /// Helper to build a navigation item with SVG icons and localized labels.
  BottomNavigationBarItem _buildNavItem(
      BuildContext context, String icon, String labelKey) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 4.h),
        child: SvgPicture.asset(
          icon,
          colorFilter:
              const ColorFilter.mode(AppColors.textGrey, BlendMode.srcIn),
        ),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.only(bottom: 4.h),
        child: SvgPicture.asset(
          icon,
          colorFilter:
              const ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),
        ),
      ),
      label: context.getString(labelKey),
    );
  }
}