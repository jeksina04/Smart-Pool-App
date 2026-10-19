import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.white,
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
                color: AppColors.infoBannerBg,
                borderRadius: BorderRadius.circular(12.r)),
            child: SvgPicture.asset(AppAssets.icCreditCard),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --> Replace with actual card number
                Text("Visa •••• 6411", style: AppTypography.sectionHeader),
                Text("On file with NSP Pool & Spa Services",
                    style: AppTypography.infoLabel),
              ],
            ),
          ),
          SvgPicture.asset(AppAssets.icChevronRight),
        ],
      ),
    );
  }
}
