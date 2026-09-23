import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';

/// Info banner widget notifying that technician accounts are created by dispatch.
class HomeownerInfoBanner extends StatelessWidget {
  const HomeownerInfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.infoBannerBg,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: SvgPicture.asset(
              AppAssets.icCustomer,
              width: 14.w,
              height: 14.w,
              colorFilter: const ColorFilter.mode(
                AppColors.infoBannerText,
                BlendMode.srcIn,
              ),
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: context.getString('homeowners_notice_start'),
                    style: AppTypography.bannerNormalText,
                  ),
                  TextSpan(
                    text: context.getString('homeowners_notice_bold'),
                    style: AppTypography.bannerBoldText,
                  ),
                  TextSpan(
                    text: context.getString('homeowners_notice_end'),
                    style: AppTypography.bannerNormalText,
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
