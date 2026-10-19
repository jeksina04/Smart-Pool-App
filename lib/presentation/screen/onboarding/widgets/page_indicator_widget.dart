import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../util/app_colors.dart';

/// Clean, reusable page indicator component supporting selected pill (26x10) and unselected circle (10x10).
class PageIndicatorWidget extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const PageIndicatorWidget({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) {
          final isSelected = index == currentIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            width: isSelected ? 26.w : 10.w,
            height: 10.h,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.indicatorSelected
                  : AppColors.indicatorUnselected,
              borderRadius: BorderRadius.circular(5.r),
            ),
          );
        },
      ),
    );
  }
}
