import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class ApproveQuoteTabSelector extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  const ApproveQuoteTabSelector({super.key, required this.selectedIndex, required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(26.r),
            boxShadow: [
              BoxShadow(
                  color: AppColors.cardShadow,
                  blurRadius: 8,
                  offset: const Offset(0, 2))
            ]),
        child: Row(
          children: [
            _buildTab(0, "Weekly service"),
            _buildTab(1, "Green pool recovery"),
          ],
        ),
    );
  }

  Widget _buildTab(int index, String title) {
    bool isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabChanged(index),
        child: Container(
          height: 44.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: isSelected
                  ? AppTypography.approveQuoteSelectedTab
                  : AppTypography.approveQuoteUnselectedTab,
            ),
          ),
        ),
      ),
    );
  }
}