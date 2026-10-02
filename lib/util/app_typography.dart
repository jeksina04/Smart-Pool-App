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
        fontSize: 14.sp,
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

  /// Welcome Back! text size 28, weight 700, color #0F2A3F
  static TextStyle get welcomeBackTitle => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.darkNavy,
      );

  /// "Sign in to continue to your account" text size 13, weight 400, color #5F6C7A
  static TextStyle get welcomeSubtitle => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textGrey,
      );

  /// Tab text selected: size 15, weight 600, color #FFFFFF
  static TextStyle get tabTextSelected => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      );

  /// Tab text unselected: size 15, weight 600, color #0F2A3F
  static TextStyle get tabTextUnselected => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.darkNavy,
      );

  /// Input label text size 13, weight 600, color #0F2A3F
  static TextStyle get inputLabel => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.darkNavy,
      );

  /// Input text field text size 15, weight 400, color #0F2A3F
  static TextStyle get inputText => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.darkNavy,
      );

  /// Input text field hint size 15, weight 400, color #5F6C7A
  static TextStyle get inputHint => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textGrey,
      );

  /// Checkbox terms base text size 13, weight 400, color #5F6C7A
  static TextStyle get termsNormal => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textGrey,
      );

  /// Terms highlighted text (Privacy Policy / Terms of Service) size 13, weight 700, color #1668D6
  static TextStyle get termsHighlight => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 13.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryBlue,
      );

  /// Sign In button text size 16, weight 700, color #FFFFFF
  static TextStyle get signInButton => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      );

  /// Divider text "or continue with" size 11, weight 500, color #5F6C7A
  static TextStyle get dividerText => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textGrey,
      );

  /// Google 'G' icon text size 19, weight 800, color #4285F4
  static TextStyle get googleIconText => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 19.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.googleBlue,
      );

  /// Continue with Google text size 16, weight 700, color #0F2A3F
  static TextStyle get googleButtonText => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.darkNavy,
      );

  /// Forgot password? text size 14, weight 600, color #1668D6
  static TextStyle get forgotPassword => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryBlue,
      );

  /// Bottom text normal "Don't have an account?" size 13, weight 400, color #5F6C7A
  static TextStyle get bottomTextNormal => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textGrey,
      );

  /// Bottom text highlight "Create an Account" size 13, weight 700, color #1668D6
  static TextStyle get bottomTextHighlight => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 13.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryBlue,
      );

  /// Technician notice text size 12, weight 400, color #5F6C7A
  static TextStyle get technicianNotice => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textGrey,
      );

  /// Top bar title "Create account" in center size 16, weight 600, color #0F2A3F
  static TextStyle get topBarTitle => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.darkNavy,
      );

  /// Info banner normal text: size 12, weight 600, color #0D5BC4
  static TextStyle get bannerNormalText => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: AppColors.infoBannerText,
      );

  /// Info banner highlighted text: size 12, weight 900, color #0D5BC4
  static TextStyle get bannerBoldText => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 12.sp,
        fontWeight: FontWeight.w900,
        height: 1.4,
        color: AppColors.infoBannerText,
      );

  /// "We'll text a 4-digit code to verify your number." size 12, weight 400, color #5F6C7A
  static TextStyle get verifyNoticeText => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textGrey,
      );

  /// "Verify Your Number" title: size 28, weight 800, color #0F2A3F
  static TextStyle get verifyTitle => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 28.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.darkNavy,
      );

  /// "Enter the 4-digit code sent to" subtitle: size 13, weight 400, color #5F6C7A
  static TextStyle get verifySubtitle => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textGrey,
      );

  /// Phone number display: size 15, weight 600, color #0F2A3F
  static TextStyle get phoneDisplay => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.darkNavy,
      );

  /// "Edit" link next to phone: size 15, weight 600, color #1668D6
  static TextStyle get phoneEdit => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryBlue,
      );

  /// OTP input digit text: size 24, weight 700, color #0F2A3F
  static TextStyle get otpDigitText => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.darkNavy,
      );

  /// "Enter the 4 digits — the code fills in automatically from Messages on most phones." size 11, weight 500, color #5F6C7A
  static TextStyle get autoFillNotice => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textGrey,
      );

  /// "Don't receive the code? " size 11, weight 500, color #5F6C7A
  static TextStyle get resendNormal => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textGrey,
      );

  /// "Resend in 00:30" / "Resend" size 11, weight 700, color #1668D6
  static TextStyle get resendHighlight => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 11.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryBlue,
      );

  /// "Enter the 4-digit code" heading: size 18, weight 800, color #0F2A3F
  static TextStyle get enterFourDigitCodeTitle => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.darkNavy,
      );

  /// Timer disabled button text: size 16, weight 700, color #A9B4BF
  static TextStyle get timerButtonTextStyle => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.timerButtonText,
      );


  /// Notification count text: 10 sp, weight 700, color #FFFFFF
  static TextStyle get notificationCountText => TextStyle(
    fontFamily: poppinsFont,
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  /// Greeting title, Quick Actions text: 28sp, weight 700, color #0F2A3F
  static TextStyle get dashboardHeading => TextStyle(
    fontFamily: poppinsFont,
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.darkNavy,
  );

  /// Temperature, Services header text: 16sp, weight 600, color #0F2A3F
  static TextStyle get sectionHeader => TextStyle(
    fontFamily: poppinsFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.darkNavy,
  );

  /// Large value text for quality card: 28sp, weight 700, color #FFFFFF
  static TextStyle get cardValueLarge => TextStyle(
    fontFamily: poppinsFont,
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  /// Label text for small metric cards: 13sp, weight 600, color #5F6C7A
  static TextStyle get cardLabel => TextStyle(
    fontFamily: poppinsFont,
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textGrey,
  );

  /// Metric values (pH/Chlorine): 22sp, weight 700, color #0F2A3F
  static TextStyle get metricValue => TextStyle(
    fontFamily: poppinsFont,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.darkNavy,
  );

  /// Small badge/status text: 11sp, weight 600, color #4CAF50
  static TextStyle get badgeText => TextStyle(
    fontFamily: poppinsFont,
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.statusGreen,
  );

  /// "Here's your pool overview", Water matrics label text: 13sp, weight 400, color #5F6C7A
  static TextStyle get infoLabel => TextStyle(
    fontFamily: poppinsFont,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textGrey,
  );

  /// Weather, Last checked today text: 11sp, weight 500, color #FFFFFF
  static TextStyle get infoText => TextStyle(
    fontFamily: poppinsFont,
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  /// Services price text: 13sp, weight 700, color #5F6C7A
  static TextStyle get priceText => TextStyle(
    fontFamily: poppinsFont,
    fontSize: 13.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textGrey,
  );

}
