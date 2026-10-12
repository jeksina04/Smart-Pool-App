import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class ApproveQuoteTasksCard extends StatelessWidget {
  final List<String> tasks;
  const ApproveQuoteTasksCard({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: tasks.map((task) =>  Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 6.h, right: 8.w),
                child: Container(
                    width: 4.w,
                    height: 4.w,
                    decoration: const BoxDecoration(color: AppColors.textGrey, shape: BoxShape.circle)
                ),
              ),
              Expanded(child: Text(task, style: AppTypography.infoLabel)),
            ],
          ),
        ).toList(),
      ),
    );
  }
}