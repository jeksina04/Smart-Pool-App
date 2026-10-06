import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class CompanyInfoCard extends StatelessWidget {
  const CompanyInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8)],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // --> Replace with actual company icon
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF0E5FC4),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Text(
                  'CP',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --> Replace with actual company name
                    Text("NSP Pool & Spa Services",
                        style: AppTypography.sectionHeader
                            .copyWith(fontSize: 17.sp)),
                    // --> Replace with actual date and count
                    Text(
                      context.getString('provider_since',
                          {'date': '12 Feb 2026', 'count': '24'}),
                      style: AppTypography.infoLabel,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                    color: AppColors.statusGreenBg,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Text(context.getString('active'),
                    style: AppTypography.badgeText.copyWith(color: AppColors.inRangeGreen)),
              ),
            ],
          ),

          8.verticalSpace,
          const Divider(height: 1, color: AppColors.dividerColor, indent: 2, endIndent: 2,),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                  child: _buildActionButton(
                      context, AppAssets.icDocument, 'message',
                      isPrimary: true)),
              12.horizontalSpace,
              Expanded(
                  child: _buildActionButton(
                      context, AppAssets.icPhone, 'call',
                      isPrimary: false)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
      BuildContext context, String iconAsset, String labelKey,
      {required bool isPrimary}) {
    return ElevatedButton.icon(
      onPressed: () {}, // --> Handle actual action
      icon: SvgPicture.asset(
        iconAsset,
        width: 16.w,
        height: 16.h,
        colorFilter: ColorFilter.mode(
          isPrimary ? Colors.white : AppColors.darkNavy,
          BlendMode.srcIn,
        ),
      ),
      label: Text(context.getString(labelKey),
          style: isPrimary
              ? AppTypography.buttonText
              : AppTypography.buttonText.copyWith(color: AppColors.darkNavy)
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? AppColors.primaryBlue : AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        elevation: isPrimary ? 0 : 3,
        shadowColor: isPrimary
            ? Colors.transparent
            : AppColors.cardShadow.withOpacity(0.35),
      ),
    );
  }
}
