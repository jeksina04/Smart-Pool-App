import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Top header bar for Change Password screen with circular back button and centered title
class ChangePasswordHeaderBar extends StatelessWidget {
  final VoidCallback? onBack;
  final String title;

  const ChangePasswordHeaderBar({
    super.key,
    this.onBack,
    this.title = 'Change password',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          /// Circular back button
          InkWell(
            onTap: onBack ?? () => Navigator.of(context).maybePop(),
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
                  Icons.chevron_left_rounded,
                  size: 26.w,
                  color: AppColors.darkNavy,
                ),
              ),
            ),
          ),

          /// Centered Title
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.darkNavy,
              ),
            ),
          ),

          /// Balance spacer opposite to back button
          SizedBox(width: 40.w),
        ],
      ),
    );
  }
}
