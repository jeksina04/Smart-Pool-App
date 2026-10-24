import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// User profile summary card at the top of the settings screen
class TechnicianProfileCard extends StatelessWidget {
  final String initials;
  final String name;
  final String subtitle;
  final VoidCallback? onTap;

  const TechnicianProfileCard({
    super.key,
    this.initials = 'RD',
    this.name = 'Ray Delgado',
    this.subtitle = 'Technician · ID 24 · ★ 4.8',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
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
        child: Row(
          children: [
            /// Avatar with circular blue background and initials
            Container(
              width: 48.w,
              height: 48.w,
              decoration: const BoxDecoration(
                color: AppColors.primaryBlue,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                initials,
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
            14.horizontalSpace,

            /// Name & Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkNavy,
                    ),
                  ),
                  3.verticalSpace,
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ),

            /// Chevron right
            Icon(
              Icons.chevron_right_rounded,
              size: 22.w,
              color: const Color(0xFF9AA5B5),
            ),
          ],
        ),
      ),
    );
  }
}
