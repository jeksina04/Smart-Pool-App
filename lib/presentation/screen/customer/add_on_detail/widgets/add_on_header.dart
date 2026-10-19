import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class AddOnHeaderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;

  const AddOnHeaderCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 8,
              offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
                color: AppColors.recurringQuoteBg,
                borderRadius: BorderRadius.circular(12.r)),
            child: SvgPicture.asset(AppAssets.icWrench,
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryBlue, BlendMode.srcIn)),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.userNameText),
                Text(subtitle, style: AppTypography.infoLabel),
              ],
            ),
          ),
          Text(price, style: AppTypography.poolCareSupport),
        ],
      ),
    );
  }
}
