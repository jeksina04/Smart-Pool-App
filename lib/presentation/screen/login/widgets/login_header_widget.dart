import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../util/app_assets.dart';
import '../../../../util/app_typography.dart';

/// Top header for the login screen displaying SP logo, woodmark, Welcome Back title and subtitle.
class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.spLogoOnboarding,
              width: 26.w,
              height: 26.w,
              fit: BoxFit.contain,
            ),
            8.horizontalSpace,
            Image.asset(
              AppAssets.woodmarkOnboarding,
              height: 12.h,
              fit: BoxFit.contain,
            ),
          ],
        ),
        20.verticalSpace,
        Text(
          context.getString('welcome_back'),
          style: AppTypography.welcomeBackTitle,
        ),
        6.verticalSpace,
        Text(
          context.getString('sign_in_subtitle'),
          style: AppTypography.welcomeSubtitle,
        ),
      ],
    );
  }
}
