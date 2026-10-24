import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Location policy card with toggle and detailed compliance points
class LocationSettingsCard extends StatelessWidget {
  final bool isLocationSharingEnabled;
  final ValueChanged<bool> onToggle;
  final VoidCallback? onPrivacyPolicyTap;

  const LocationSettingsCard({
    super.key,
    required this.isLocationSharingEnabled,
    required this.onToggle,
    this.onPrivacyPolicyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Toggle Row: "Share location during a job"
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Share location during a job',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkNavy,
                      ),
                    ),
                    3.verticalSpace,
                    Text(
                      'Approximate position, sent while you are clocked on for the day',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              12.horizontalSpace,
              Switch(
                value: isLocationSharingEnabled,
                onChanged: onToggle,
                activeColor: AppColors.white,
                activeTrackColor: AppColors.primaryBlue,
                inactiveThumbColor: AppColors.white,
                inactiveTrackColor: const Color(0xFFD8DFE7),
              ),
            ],
          ),
          16.verticalSpace,

          /// Bullet Points explaining location privacy
          _buildBulletPoint(
            prefix: '• The office can see roughly where you are ',
            boldText: 'while a job is open.',
            suffix: '',
          ),
          8.verticalSpace,
          _buildBulletPoint(
            prefix: '• Recording runs for your ',
            boldText: 'whole working day',
            suffix: ', travel between stops included — the day starts when you leave the office.',
          ),
          8.verticalSpace,
          _buildBulletPoint(
            prefix: '• ',
            boldText: 'Nothing is recorded off shift.',
            suffix: ' Clock out and it stops.',
          ),
          8.verticalSpace,
          _buildBulletPoint(
            prefix: '• ',
            boldText: 'Customers never see your position.',
            suffix: ' They get an estimated arrival time only.',
          ),
          8.verticalSpace,
          _buildBulletPoint(
            prefix: '• Positions are kept for ',
            boldText: '30 days',
            suffix: ', then deleted.',
          ),
          20.verticalSpace,

          /// "Read the privacy policy" outlined rounded pill button
          Center(
            child: InkWell(
              onTap: onPrivacyPolicyTap,
              borderRadius: BorderRadius.circular(22.r),
              child: Container(
                width: double.infinity,
                height: 44.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(22.r),
                  border: Border.all(color: const Color(0xFFE5E9F0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.verified_user_outlined,
                      size: 16.w,
                      color: AppColors.darkNavy,
                    ),
                    8.horizontalSpace,
                    Text(
                      'Read the privacy policy',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkNavy,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint({
    required String prefix,
    required String boldText,
    required String suffix,
  }) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: AppTypography.poppinsFont,
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textGrey,
          height: 1.35,
        ),
        children: [
          TextSpan(text: prefix),
          TextSpan(
            text: boldText,
            style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.darkNavy),
          ),
          TextSpan(text: suffix),
        ],
      ),
    );
  }
}
