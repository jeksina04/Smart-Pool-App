import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({super.key});

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
              height: 8.w,
              colorFilter: const ColorFilter.mode(
                  AppColors.infoBannerText, BlendMode.srcIn),
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: Text(
              context.getString('visibility_notice'),
              style: AppTypography.stripText,
            ),
          ),
        ],
      ),
    );
  }
}
