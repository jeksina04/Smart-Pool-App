import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class TechnicianRatingCard extends StatelessWidget {
  final String initials;
  final String name;
  final String dateText;
  final Widget ratingWidget;

  const TechnicianRatingCard({
    super.key,
    required this.initials,
    required this.name,
    required this.dateText,
    required this.ratingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: const Offset(0, 2))
          ]),
      child: Column(
        children: [
          Container(
            width: 72.w,
            height: 72.w,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColors.chlorineChartColor,
                AppColors.infoBannerText
              ]),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              initials,
              style: AppTypography.cardValueLarge.copyWith(fontSize: 26.sp),
            ),
          ),
          16.verticalSpace,
          Text(name, style: AppTypography.userNameText),
          4.verticalSpace,
          Text(dateText, style: AppTypography.cardTitle),
          32.verticalSpace,
          ratingWidget,
          16.verticalSpace,
          Text(
            context.getString('tap_a_star'),
            style: AppTypography.dayTitle,
          ),
        ],
      ),
    );
  }
}
