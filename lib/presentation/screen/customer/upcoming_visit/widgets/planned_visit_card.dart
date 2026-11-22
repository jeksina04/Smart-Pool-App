import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class PlannedVisitCard extends StatelessWidget {
  final String title;
  final String frequencyTag;
  final String description;

  const PlannedVisitCard({
    super.key,
    required this.title,
    required this.frequencyTag,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.getString('planned_for_this_visit'),
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: AppTypography.companyNameText
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AppColors.newUserMetricPlaceholder,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      frequencyTag,
                      style: AppTypography.latestReadings
                    ),
                  ),
                ],
              ),
              Text(
                description,
                style: AppTypography.quoteDetail
              ),
            ],
          ),
        ),
      ],
    );
  }
}