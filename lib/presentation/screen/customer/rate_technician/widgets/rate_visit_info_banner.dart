import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class RatingInfoBanner extends StatelessWidget {
  const RatingInfoBanner({super.key});

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
              AppAssets.icLicense,
              height: 12.w,
              colorFilter: const ColorFilter.mode(
                  AppColors.infoBannerText, BlendMode.srcIn),
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppTypography.stripText,
                children: [
                  TextSpan(text: context.getString('this_rating_is')),
                  TextSpan(
                    text: context.getString('private_to_your_pool_company'),
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  TextSpan(
                    text: context.getString('rating_info'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}