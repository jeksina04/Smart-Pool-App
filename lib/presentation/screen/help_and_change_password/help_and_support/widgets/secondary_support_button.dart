import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_colors.dart';

class SecondarySupportButtons extends StatelessWidget {
  const SecondarySupportButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: _buildButton(AppAssets.icPhone, context.getString('call_office'))),
        12.horizontalSpace,
        Expanded(
            child: _buildButton(AppAssets.icDocument, context.getString('email_us'))),
      ],
    );
  }

  Widget _buildButton(String icon, String label) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 18.w,
            height: 18.h,
            colorFilter: ColorFilter.mode(
              AppColors.darkNavy,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 8),
          Text(label, style: AppTypography.quoteDetailInfo)
        ],
      ),
    );
  }
}
