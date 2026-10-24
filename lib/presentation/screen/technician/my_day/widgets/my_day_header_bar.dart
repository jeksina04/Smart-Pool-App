import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Top header bar for "My day" screen with circular back button and centered title
class MyDayHeaderBar extends StatelessWidget {
  final VoidCallback? onBack;

  const MyDayHeaderBar({
    super.key,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Circular Back Button
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
                  Icons.arrow_back_ios_new_rounded,
                  size: 18.w,
                  color: AppColors.darkNavy,
                ),
              ),
            ),
          ),

          // Centered Title
          Text(
            'My day',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),

          // Spacer to keep title centered
          SizedBox(width: 40.w),
        ],
      ),
    );
  }
}
