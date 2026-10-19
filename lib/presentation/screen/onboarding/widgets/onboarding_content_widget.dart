import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../util/app_typography.dart';

/// Reusable onboarding content item widget displaying either logo+woodmark or title, along with subtitle text.
class OnboardingContentWidget extends StatelessWidget {
  final String? title;
  final String? logoAsset;
  final String? woodmarkAsset;
  final String subtitleText;

  const OnboardingContentWidget({
    super.key,
    this.title,
    this.logoAsset,
    this.woodmarkAsset,
    required this.subtitleText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (logoAsset != null) ...[
            Image.asset(
              logoAsset!,
              width: 120.w,
              height: 120.w,
              fit: BoxFit.contain,
            ),
            24.verticalSpace,
          ],
          if (woodmarkAsset != null) ...[
            Image.asset(
              woodmarkAsset!,
              width: 200.w,
              height: 28.h,
              fit: BoxFit.contain,
            ),
            16.verticalSpace,
          ],
          if (title != null) ...[
            Text(
              title!,
              textAlign: TextAlign.center,
              style: AppTypography.onboardingTitle,
            ),
            16.verticalSpace,
          ],
          Text(
            subtitleText,
            textAlign: TextAlign.center,
            style: AppTypography.onboardingSubtitle,
          ),
        ],
      ),
    );
  }
}
