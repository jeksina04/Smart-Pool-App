import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Top header bar for Items Needed / Shopping List with circular back button, title, and add (+) button
class ShoppingListHeaderBar extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onAdd;
  final String title;

  const ShoppingListHeaderBar({
    super.key,
    this.onBack,
    this.onAdd,
    this.title = 'Items needed',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Text(
            title,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),

          /// Circular Add (+) button
          InkWell(
            onTap: onAdd,
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
                  Icons.add_rounded,
                  size: 24.w,
                  color: AppColors.darkNavy,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
