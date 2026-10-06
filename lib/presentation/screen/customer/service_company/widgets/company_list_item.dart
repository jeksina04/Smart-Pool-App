import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

/// A reusable row item for the service company screen sections.
class CompanyListItem extends StatelessWidget {
  final String icon;
  final String title;
  final String? subtitle;
  final String? trailingText;
  final bool showArrow;
  final bool isLast;
  final VoidCallback? onTap;

  const CompanyListItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailingText,
    this.showArrow = true,
    this.isLast = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        // Icon inside a light blue rounded square
        leading: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: AppColors.infoBannerBg,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: SvgPicture.asset(
            icon,
            width: 20.w,
            colorFilter:
                const ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),
          ),
        ),
        title: Text(title,
            style: AppTypography.sectionHeader),
        subtitle: subtitle != null
            ? Text(subtitle!, style: AppTypography.infoLabel)
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailingText != null)
              Text(
                trailingText!,
                style: AppTypography.infoLabel,
              ),
            if (showArrow) ...[
              8.horizontalSpace,
              SvgPicture.asset(AppAssets.icChevronRight, ),
            ],
          ],
        ),
        onTap: onTap,
      ),
      if (!isLast)
        const Divider(
          height: 1,
          color: AppColors.dividerColor,
        ),
    ]);
  }
}
