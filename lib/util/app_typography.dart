import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

/// Reusable application typography configuration following design guidelines.
abstract class AppTypography {
  AppTypography._();

  static const String poppinsFont = 'Poppins';

  /// Skip button text style: 14sp, weight 600 (SemiBold), color #0F2A3F
  static TextStyle get skipButton => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.darkNavy,
      );

  /// Onboarding title text style: 27sp, weight 700 (Bold), line height 34, color #0F2A3F
  static TextStyle get onboardingTitle => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 27.sp,
        fontWeight: FontWeight.w700,
        height: 34 / 27,
        color: AppColors.darkNavy,
      );

  /// Onboarding subtitle text style: 15sp, weight 400 (Regular), line height 22, color #0F2A3F
  static TextStyle get onboardingSubtitle => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        height: 22 / 15,
        color: AppColors.darkNavy,
      );

  /// Next button text style: 16sp, weight 700 (Bold), color #0F2A3F
  static TextStyle get nextButton => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.darkNavy,
      );
}
