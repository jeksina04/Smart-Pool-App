import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class QuoteNoticeBanner extends StatelessWidget {
  const QuoteNoticeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.w, 8.h),
      decoration: BoxDecoration(
        color: AppColors.infoBannerBg,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: SvgPicture.asset(
              AppAssets.icBell,
              height: 10.w,
              colorFilter: ColorFilter.mode(
                  AppColors.infoBannerText, BlendMode.srcIn),
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: Text(
                context.getString('quote_approval_notice'),
                style: AppTypography.stripText),
          ),
        ],
      ),
    );
  }
}