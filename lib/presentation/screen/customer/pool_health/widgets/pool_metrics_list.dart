import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class PoolMetricsList extends StatelessWidget {
  const PoolMetricsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8)],
      ),
      child: Column(
        children: [
          // --> Replace with actual pool metrics
          _buildRow(context,
              title: context.getString('equipment'), value: "96"),
          _buildRow(context,
              title: context.getString('chemistry'), value: "100"),
          _buildRow(context,
              title: context.getString('cleanliness'),
              value: "88",
              isLast: true),
        ],
      ),
    );
  }

  Widget _buildRow(
    BuildContext context, {
    required String title,
    required String value,
    bool isLast = false,
  }) {
    return Column(children: [
      ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        title: Text(title, style: AppTypography.sectionHeader),
        trailing: Text(
          value,
          style: AppTypography.sectionHeader,
        ),
      ),
      if (!isLast)
        const Divider(
          height: 1,
          color: AppColors.dividerColor,
        ),
    ]);
  }
}
