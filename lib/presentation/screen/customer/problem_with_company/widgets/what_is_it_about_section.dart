import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class WhatIsItAboutSection extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTopicSelected;

  const WhatIsItAboutSection({
    super.key,
    required this.selectedIndex,
    required this.onTopicSelected,
  });

  static const List<String> _topics = [
    'category_visit',
    'category_billing',
    'category_technician',
    'category_something_else',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_topics.length, (index) {
          final isSelected = selectedIndex == index;
          return Padding(
            padding: EdgeInsets.only(
              right: index == _topics.length - 1 ? 0 : 8.w,
            ),
            child: GestureDetector(
              onTap: () => onTopicSelected(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.phStatusBg : AppColors.newUserMetricPlaceholder,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  context.getString(_topics[index]),
                  maxLines: 1,
                  softWrap: false,
                  style: AppTypography.badgeText.copyWith(
                    color: isSelected ? null : AppColors.textGrey,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}