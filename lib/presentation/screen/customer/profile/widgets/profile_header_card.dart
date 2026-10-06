import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

/// The top card containing user identity and basic details
class ProfileHeaderCard extends StatelessWidget {
  final String name;
  final String address;
  final String plan;

  const ProfileHeaderCard(
      {super.key,
      required this.name,
      required this.address,
      required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 8,
              offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          /// User Avatar Placeholder
          Container(
            width: 60.w,
            height: 60.w,
            decoration: const BoxDecoration(
              color: AppColors.infoBannerBg,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.person_outline,
                color: AppColors.primaryBlue, size: 30.sp),
          ),
          16.horizontalSpace,

          /// Identity Text Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTypography.dashboardHeading.copyWith(fontSize: 18.sp)),
                4.verticalSpace,
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6.w,
                  children: [
                    Text(
                      address,
                      style: AppTypography.infoLabel,
                    ),
                    Text(
                      '·',
                      style: AppTypography.infoLabel,
                    ),
                    Text(
                      plan,
                      style: AppTypography.infoLabel,
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Edit Profile Button
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.cardShadow,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: SvgPicture.asset(
              AppAssets.icEdit,
            ),
          ),
        ],
      ),
    );
  }
}
