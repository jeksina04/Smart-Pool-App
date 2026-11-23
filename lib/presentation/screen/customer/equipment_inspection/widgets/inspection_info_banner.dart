import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class InspectionInfoBanner extends StatelessWidget {
  final String noticeText;

  const InspectionInfoBanner({
    super.key,
    required this.noticeText,
  });

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
            padding: EdgeInsets.only(top:3.w),
            child: SvgPicture.asset(
              AppAssets.icBell,
              height: 16.w,
              colorFilter: const ColorFilter.mode(
                AppColors.infoBannerText,
                BlendMode.srcIn,
              ),
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: Text(
              noticeText,
              style: AppTypography.stripText,
            ),
          ),
        ],
      ),
    );
  }
}