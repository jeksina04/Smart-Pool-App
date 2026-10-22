import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class ReferralCodeCard extends StatelessWidget {
  final String referralCode;

  const ReferralCodeCard({super.key, required this.referralCode});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8.r,
                offset: Offset(0, 2))
          ]),
      child: Column(
        children: [
          Text(context.getString('your_referral_code'),
              style: AppTypography.cardTitle),
          8.verticalSpace,
          Text(
            referralCode,
            style: AppTypography.welcomeBackTitle,
          ),
          8.verticalSpace,
          Text(
            context.getString('referral_instructions'),
            textAlign: TextAlign.center,
            style: AppTypography.infoLabel,
          ),
          16.verticalSpace,
          SizedBox(
            width: double.infinity,
            height: 56.h,
            child: ElevatedButton(
              onPressed: () {}, // Trigger Native Share
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.r)),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppAssets.icSend,
                      colorFilter: const ColorFilter.mode(
                          Colors.white, BlendMode.srcIn)),
                  8.horizontalSpace,
                  Text(context.getString('share_my_link'),
                      style: AppTypography.signInButton),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
