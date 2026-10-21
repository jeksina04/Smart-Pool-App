import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Top header banner showing the Smart Pool logo, brand title, close button,
/// and the technician's profile summary.
class TechnicianMenuHeader extends StatelessWidget {
  final String name;
  final String roleWithId;
  final VoidCallback? onClose;

  const TechnicianMenuHeader({
    super.key,
    this.name = 'Ray Delgado',
    this.roleWithId = 'Lead technician · ID 24',
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;

    return Container(
      width: double.infinity,
      color: AppColors.primaryBlue,
      padding: EdgeInsets.fromLTRB(16.w, topPadding + 10.h, 16.w, 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row: SP Logo + SMART POOL Title + Close button
          Row(
            children: [
              Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Center(
                  child: Text(
                    'SP',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ),
              ),
              8.horizontalSpace,
              Text(
                'SMART POOL',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                  color: AppColors.white,
                ),
              ),
              const Spacer(),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (onClose != null) {
                    onClose!();
                  } else {
                    final scaffold = Scaffold.maybeOf(context);
                    if (scaffold?.isDrawerOpen ?? false) {
                      scaffold?.closeDrawer();
                    } else {
                      Navigator.of(context).maybePop();
                    }
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      size: 18.w,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          16.verticalSpace,

          /// User Profile Row: Avatar + Name + Role/ID
          Row(
            children: [
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.person_outline_rounded,
                    size: 28.w,
                    color: AppColors.white,
                  ),
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    2.verticalSpace,
                    Text(
                      roleWithId,
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
