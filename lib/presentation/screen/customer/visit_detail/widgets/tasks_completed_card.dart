import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class TasksCompletedCard extends StatelessWidget {
  const TasksCompletedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.getString('tasks_completed'), style: AppTypography.companyNameText),
              // --> Replace with actual task count
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.phStatusBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text("7 / 7", style: AppTypography.badgeText),
              ),
            ],
          ),
          8.verticalSpace,
          // --> Replace with actual task description
          Text(
            "Skimmed surface · emptied baskets · brushed walls · vacuumed · cleaned filter · tested water · gate closed",
            style: AppTypography.infoLabel,
          ),
        ],
      ),
    );
  }
}