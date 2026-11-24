import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class InspectionIncludedSection extends StatelessWidget {
  final List<String> includedItems;

  const InspectionIncludedSection({
    super.key,
    required this.includedItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.getString('what_is_included'),
          style: AppTypography.quickActionsHeading,
        ),
        8.verticalSpace,
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: const [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: includedItems.map(
                  (task) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 6.h, right: 8.w),
                        child: Container(
                            width: 4.w,
                            height: 4.w,
                            decoration: const BoxDecoration(
                                color: AppColors.textGrey,
                                shape: BoxShape.circle)),
                      ),
                      Expanded(child: Text(task, style: AppTypography.infoLabel)),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
