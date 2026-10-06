import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class TestHistoryList extends StatelessWidget {
  const TestHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w, bottom: 12.h),
          child: Text(context.getString('test_history'),
              style: AppTypography.dashboardHeading.copyWith(fontSize: 22.sp)),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8)],
          ),
          child: Column(
            children: [
              // --> Replace with actual test history
              _buildItem(context, "28 Jul 2026", "Normal"),
              _buildItem(context, "21 Jul 2026", "Normal"),
              _buildItem(context, "14 Jul 2026", "pH high", isLast: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, String date, String statusKey,
      {bool isLast = false}) {

    final bool isNormal = statusKey.toLowerCase() == 'normal';

    final Color bgColor = isNormal ? AppColors.statusGreenBg : AppColors.statusHighBg;

    final Color textColor = isNormal ? AppColors.inRangeGreen : AppColors.statusHighText;

    return Column(children: [
      ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        title: Text(date, style: AppTypography.sectionHeader),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(statusKey,
                  style: AppTypography.badgeText.copyWith(color: textColor)),
            ),
            12.horizontalSpace,
            SvgPicture.asset(AppAssets.icChevronRight),
          ],
        ),
        onTap: () {}, // --> Trigger test details
      ),
      if (!isLast)
        const Divider(
          height: 1,
          color: AppColors.dividerColor,
        ),
    ]);
  }
}
