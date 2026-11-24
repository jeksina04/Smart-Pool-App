import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Screen: "T · Stop detail — AI photo check (Green pool detected)"
/// Displays:
/// - Header Bar: Circular back button and "AI photo check" title
/// - Green pool image container with "pool photo" placeholder
/// - Warning banner: "Green pool detected · Severity: moderate · confidence 87%"
/// - Suggested action card: "Shock treatment (double dose), brush walls, run filter 24h. Flag to the office so a follow-up visit is booked."
/// - Bottom buttons: Dismiss (white pill) & Flag + Note (blue pill)
class TechAiPhotoCheckScreen extends StatelessWidget {
  const TechAiPhotoCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Bar
            _buildHeaderBar(context),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Pool Photo Preview Card (Greenish gradient preview)
                    _buildPoolPhotoPreview(),
                    16.verticalSpace,

                    // Warning Banner: Green pool detected
                    _buildGreenPoolWarningBanner(),
                    16.verticalSpace,

                    // Suggested Action Card
                    _buildSuggestedActionCard(),
                    32.verticalSpace,

                    // Action Buttons Row: Dismiss & Flag + Note
                    _buildActionButtonsRow(context),
                    24.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => Navigator.of(context).maybePop(),
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0C102A50),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 18.w,
                    color: AppColors.darkNavy,
                  ),
                ),
              ),
            ),
          ),
          Text(
            'AI photo check',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 17.5.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPoolPhotoPreview() {
    return Container(
      width: double.infinity,
      height: 220.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF5B9156), Color(0xFF3B6F3E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14102A50),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          'pool photo',
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildGreenPoolWarningBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFDE8E8),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFFFD5D5), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: SvgPicture.asset(
              AppAssets.icAlert,
              width: 15.w,
              height: 15.w,
              colorFilter: const ColorFilter.mode(
                Color(0xFFD32F2F),
                BlendMode.srcIn,
              ),
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Green pool detected',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 13.5.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFC62828),
                  ),
                ),
                2.verticalSpace,
                Text(
                  'Severity: moderate · confidence 87%',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFD32F2F),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestedActionCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08102A50),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Suggested action',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 15.5.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),
          10.verticalSpace,
          Text(
            'Shock treatment (double dose), brush walls, run filter 24h. Flag to the office so a follow-up visit is booked.',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 13.5.sp,
              color: const Color(0xFF5D6B7C),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtonsRow(BuildContext context) {
    return Row(
      children: [
        // Dismiss button (white pill)
        Expanded(
          child: Container(
            height: 52.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(26.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x08102A50),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.of(context).maybePop(),
                borderRadius: BorderRadius.circular(26.r),
                child: Center(
                  child: Text(
                    'Dismiss',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkNavy,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        14.horizontalSpace,

        // Flag + Note button (primary blue pill)
        Expanded(
          child: SizedBox(
            height: 52.h,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.techCustomerSignOff);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                foregroundColor: AppColors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26.r),
                ),
              ),
              child: Text(
                'Flag + Note',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 15.5.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
