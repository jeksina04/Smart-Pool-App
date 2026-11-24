import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

import 'widgets/my_day_header_bar.dart';

/// Screen: "T33_break · My day · on break"
/// Displays technician status while on a break.
class MyDayBreakScreen extends StatelessWidget {
  final VoidCallback? onEndBreak;

  const MyDayBreakScreen({
    super.key,
    this.onEndBreak,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Bar with back button & title "My day"
            MyDayHeaderBar(
              onBack: () => Navigator.of(context).maybePop(),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  children: [
                    // 1. Break Status Card (Light amber/cream background)
                    _buildBreakStatusCard(),
                    16.verticalSpace,

                    // 2. Amber Info Banner: "Paid time is paused..."
                    _buildPauseInfoBanner(),
                    16.verticalSpace,

                    // 3. Stats Row: "Paid today" & "Breaks today"
                    _buildBreakStatsRow(),
                    20.verticalSpace,

                    // 4. Primary "End break" blue button
                    _buildEndBreakButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreakStatusCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9EE),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08102A50),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'On break since 12:10 pm',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 13.5.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF8B6327),
            ),
          ),
          8.verticalSpace,
          Text(
            '14:32',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 34.sp,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF75511A),
              height: 1.15,
            ),
          ),
          10.verticalSpace,
          Text(
            'Break time is unpaid',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF8B6327),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPauseInfoBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6E5),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: SvgPicture.asset(
              AppAssets.icClock,
              width: 15.w,
              height: 15.w,
              colorFilter: const ColorFilter.mode(
                Color(0xFF7A4D05),
                BlendMode.srcIn,
              ),
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 12.sp,
                  color: const Color(0xFF7A4D05),
                  height: 1.4,
                ),
                children: const [
                  TextSpan(
                    text: 'Paid time is paused. ',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: 'It starts again the moment you end your break.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreakStatsRow() {
    return Row(
      children: [
        // Paid today
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x08102A50),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Paid today',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGrey,
                  ),
                ),
                4.verticalSpace,
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '5h 16m',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.darkNavy,
                      height: 1.15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        14.horizontalSpace,

        // Breaks today
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x08102A50),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Breaks today',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGrey,
                  ),
                ),
                4.verticalSpace,
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.darkNavy,
                      height: 1.15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEndBreakButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {
          if (onEndBreak != null) {
            onEndBreak!();
          } else {
            Navigator.of(context).maybePop();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.icClock,
              width: 18.w,
              height: 18.w,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
            10.horizontalSpace,
            Text(
              'End break',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
