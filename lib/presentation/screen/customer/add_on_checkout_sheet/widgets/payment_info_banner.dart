import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class PaymentInfoBanner extends StatelessWidget {
  const PaymentInfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
          color: AppColors.infoBannerBg,
          borderRadius: BorderRadius.circular(8.r)),
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
            child: RichText(
              text: TextSpan(
                style: AppTypography.stripText,
                children: [
                  TextSpan(text: context.getString('paid_to')),
                  // --> Replace with actual company name
                  const TextSpan(
                      text: "NSP Pool & Spa Services. ",
                      style: TextStyle(fontWeight: FontWeight.w900)),
                  TextSpan(
                      text: context.getString(
                          'smart_pool_never_holds_your_money_notice')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
