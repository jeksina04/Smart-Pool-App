import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class HowToPayActions extends StatelessWidget {
  const HowToPayActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildButton(
          context,
          'download_invoice',
          AppAssets.icDocument,
          onTap: () {}, // --> download invoice
        ),
        16.verticalSpace,
        _buildButton(
          context,
          'bill_question',
          null,
          onTap: () {}, // --> bill question
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String textKey, String? asset,
      {required VoidCallback onTap}) {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: const Offset(0, 2))
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(28.r),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (asset != null) ...[
                SvgPicture.asset(asset,
                    width: 18.w,
                    height: 18.w,
                    colorFilter: const ColorFilter.mode(
                        AppColors.darkNavy, BlendMode.srcIn)),
                8.horizontalSpace,
              ],
              Text(
                context.getString(textKey),
                style: AppTypography.nextButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
