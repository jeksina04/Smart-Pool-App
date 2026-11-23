import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class CoverTechnicianCard extends StatelessWidget {
  final String coverName;
  final String coverSubtitle;
  final VoidCallback? onTap;

  const CoverTechnicianCard({
    super.key,
    required this.coverName,
    required this.coverSubtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.getString('also_covers_your_pool'),
          style: AppTypography.quickActionsHeading,
        ),
        8.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: const [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            leading: Container(
              width: 40.w,
              height: 40.w,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.infoBannerBg,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SvgPicture.asset(
                AppAssets.icCustomer,
                colorFilter: const ColorFilter.mode(
                  AppColors.primaryBlue,
                  BlendMode.srcIn,
                ),
              ),
            ),
            title: Text(
              coverName,
              style: AppTypography.sectionHeader,
            ),
            subtitle: Text(
              coverSubtitle,
              style: AppTypography.infoLabel,
            ),
          ),
        ),
      ],
    );
  }
}