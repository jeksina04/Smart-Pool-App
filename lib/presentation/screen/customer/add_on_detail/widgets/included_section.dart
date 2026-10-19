import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class IncludedSection extends StatelessWidget {
  const IncludedSection({super.key});

  @override
  Widget build(BuildContext context) {
    // --> Replace with real data
    final items = [
      "Filter removed, disassembled and deep cleaned",
      "Grids or cartridges inspected for tears",
      "O-rings greased, pressure re-checked",
      "Before and after photos on your record"
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.getString('what_is_included'),
            style: AppTypography.quickActionsHeading),
        16.verticalSpace,

        // Card contains only the items
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8, offset: Offset(0, 2))]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...items.map(
                    (item) => Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 6.h),
                        child: Container(
                          width: 4.w,
                          height: 4.w,
                          decoration: const BoxDecoration(
                            color: AppColors.textGrey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      8.horizontalSpace,
                      Expanded(
                        child: Text(
                          item,
                          style: AppTypography.quoteDetail,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
