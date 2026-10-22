import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class ReferralItemTile extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final String? status;

  const ReferralItemTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(color: AppColors.recurringQuoteBg,
                borderRadius: BorderRadius.circular(12.r)),
            child: SvgPicture.asset(icon, width: 20.w,
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryBlue, BlendMode.srcIn)),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.sectionHeader),
                4.verticalSpace,
                Text(subtitle, style: AppTypography.infoLabel),
              ],
            ),
          ),
          if (status != null) ...[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: status == "Credited"
                    ? AppColors.phStatusBg
                    : AppColors.newUserMetricPlaceholder,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                status!,
                style: AppTypography.badgeText.copyWith(
                  color: status == "Credited"
                      ? AppColors.inRangeGreen
                      : AppColors.textGrey,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}