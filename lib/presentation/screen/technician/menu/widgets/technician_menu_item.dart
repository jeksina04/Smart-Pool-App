import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Single item within the Technician Drawer/Menu.
class TechnicianMenuItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final String? subtitle;
  final String? badgeText;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final VoidCallback? onTap;

  const TechnicianMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.badgeText,
    this.badgeColor,
    this.badgeTextColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Icon with soft blue container background
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color: const Color(0xFFE9F1FE),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(child: icon),
            ),
            12.horizontalSpace,

            /// Title + optional Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkNavy,
                    ),
                  ),
                  if (subtitle != null) ...[
                    2.verticalSpace,
                    Text(
                      subtitle!,
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey,
                        height: 1.25,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            /// Optional badge pill
            if (badgeText != null) ...[
              Container(
                width: 20.w,
                height: 20.w,
                decoration: BoxDecoration(
                  color: badgeColor ?? const Color(0xFFE2EDFE),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  badgeText!,
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: badgeTextColor ?? AppColors.primaryBlue,
                  ),
                ),
              ),
              8.horizontalSpace,
            ],

            /// Trailing chevron
            Icon(
              Icons.chevron_right_rounded,
              size: 20.w,
              color: const Color(0xFF7B8794),
            ),
          ],
        ),
      ),
    );
  }
}
