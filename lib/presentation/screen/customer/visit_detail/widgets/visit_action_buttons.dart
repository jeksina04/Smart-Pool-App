import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import '../../../../service/navigation.dart';

class VisitActionButtons extends StatelessWidget {
  const VisitActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.rateTechnician);
          },
          child: Container(
            width: double.infinity,
            height: 56.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(28.r),
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
                SvgPicture.asset(AppAssets.icStar,
                    width: 18.w,
                    colorFilter: const ColorFilter.mode(
                        AppColors.darkNavy, BlendMode.srcIn)),
                16.horizontalSpace,
                Text(context.getString('rate_your_technician'),
                    style: AppTypography.nextButton),
              ],
            ),
          ),
        ),
        16.verticalSpace,
        _textLink(AppAssets.icStar, context.getString('leave_a_review'), () {}),
        // --> Navigate to review page
        _textLink(AppAssets.icSend, context.getString('refer_friend'), () {}),
        // --> Navigate to refer a friend page
      ],
    );
  }

  Widget _textLink(String icon, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon,
                width: 18.w,
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryBlue, BlendMode.srcIn)),
            8.horizontalSpace,
            Text(text, style: AppTypography.requestTestText),
          ],
        ),
      ),
    );
  }
}
