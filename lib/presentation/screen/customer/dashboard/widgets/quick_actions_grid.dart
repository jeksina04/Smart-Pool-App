import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

/// A grid widget that displays a set of quick action buttons for the customer.
class QuickActionsGrid extends StatelessWidget {
  final VoidCallback? onHistoryTap;
  const QuickActionsGrid({super.key, this.onHistoryTap});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      /// Prevents the grid from scrolling independently within the dashboard
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 12.h,
      crossAxisSpacing: 12.w,
      childAspectRatio: 0.7,
      children: [
        GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'request_service'),
            child: _buildActionItem(context, AppAssets.icPlus, 'add_service')),
        GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'water_test'),
            child: _buildActionItem(context, AppAssets.icFlask, 'water_test')),
        GestureDetector(
            onTap: onHistoryTap,
            child: _buildActionItem(context, AppAssets.icDocument, 'history')),
        GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'report_issue'),
            child: _buildActionItem(context, AppAssets.icAlert, 'report_issue')),
      ],
    );
  }

  /// Builds an individual action item consisting of a rounded icon box and a label.
  Widget _buildActionItem(BuildContext context, String icon, String labelKey) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// The rounded white box containing the icon
        Container(
          padding: EdgeInsets.all(24.w),
          height: 76.w,
          width: 76.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: SvgPicture.asset(icon),
        ),
        8.verticalSpace,

        /// The localized label text below the icon
        Text(
          context.getString(labelKey),
          style: AppTypography.infoText
              .copyWith(color: AppColors.quickActionLabel),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
