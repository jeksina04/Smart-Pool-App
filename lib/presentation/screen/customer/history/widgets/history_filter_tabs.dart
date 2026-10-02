import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class HistoryFilterTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onChanged;

  const HistoryFilterTabs({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final filters = ['filter_all', 'filter_cleans', 'filter_repairs'];

    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(26.r),
        border: Border.all(color: AppColors.dividerColor.withOpacity(0.5)),
      ),
      child: Row(
        children: List.generate(filters.length, (index) {
          final isSelected = selectedIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(index),
              child: Container(
                height: 40.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryBlue : null,
                  borderRadius: BorderRadius.circular(22.r),
                ),
                child: Text(
                  context.getString(filters[index]),
                  style: isSelected
                      ? AppTypography.tabTextSelected.copyWith(fontSize: 13.5.sp)
                      : AppTypography.tabTextUnselected.copyWith(fontSize: 13.5.sp),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}