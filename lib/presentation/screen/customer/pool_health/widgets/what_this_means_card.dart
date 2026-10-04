import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ez_localization/ez_localization.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class WhatThisMeansCard extends StatelessWidget {
  const WhatThisMeansCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.getString('what_this_means'), style: AppTypography.sectionHeader.copyWith(fontSize: 15.sp)),
          8.verticalSpace,
          Text(
            context.getString('pool_health_desc'),
            style: AppTypography.infoLabel,
          ),
        ],
      ),
    );
  }
}