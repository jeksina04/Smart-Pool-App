import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class AddOnInfoBanner extends StatelessWidget {
  const AddOnInfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
          color: AppColors.infoBannerBg,
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 4.w),
            child: SvgPicture.asset(
              AppAssets.icBell,
              height: 16.w,
              colorFilter:
                  ColorFilter.mode(AppColors.infoBannerText, BlendMode.srcIn),
            ),
          ),
          8.horizontalSpace,
          Expanded(
              child: Text(context.getString('filter_clean_notice'),
                  style: AppTypography.stripText)),
        ],
      ),
    );
  }
}
