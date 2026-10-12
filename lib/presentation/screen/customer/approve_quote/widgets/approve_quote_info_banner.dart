import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';


class ApproveQuoteInfoBanner extends StatelessWidget {
  final String text;
  const ApproveQuoteInfoBanner({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.w, 8.h),
      decoration: BoxDecoration(
          color: AppColors.infoBannerBg,
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppAssets.icCreditCard, colorFilter: ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn) ,),
          8.horizontalSpace,
          Expanded(
              child: Text(text, style: AppTypography.stripText),),
        ],
      ),
    );
  }
}
