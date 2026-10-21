import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Segmented tab switch for Open vs Done
class WorkOrdersTabSelector extends StatelessWidget {
  final int selectedIndex; // 0 for Open, 1 for Done
  final ValueChanged<int> onTabChanged;

  const WorkOrdersTabSelector({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08102A50),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          /// Open Tab
          Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(0),
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: selectedIndex == 0 ? AppColors.primaryBlue : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Open',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: selectedIndex == 0 ? AppColors.white : AppColors.darkNavy,
                  ),
                ),
              ),
            ),
          ),

          /// Done Tab
          Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(1),
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: selectedIndex == 1 ? AppColors.primaryBlue : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Done',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: selectedIndex == 1 ? AppColors.white : AppColors.darkNavy,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
