import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class QuoteHeaderCard extends StatelessWidget {
  const QuoteHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: AppColors.infoBannerBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(AppAssets.icWaterDrop,),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --> Replace with Service and visits and price data
                    Text(
                      "Green pool recovery",
                      style: AppTypography.userNameText
                    ),
                    2.verticalSpace,
                    Text(
                      "1–3 visits · from \$250",
                      style: AppTypography.cardTitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          12.verticalSpace,
          const Divider(color: AppColors.dividerColor, height: 1),
          12.verticalSpace,
          Text(
            context.getString('quote_approval_disclaimer'),
            style: AppTypography.quoteDetail,
          ),
        ],
      ),
    );
  }
}