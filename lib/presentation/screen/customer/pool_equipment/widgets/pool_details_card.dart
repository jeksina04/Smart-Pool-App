import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class PoolDetailsCard extends StatelessWidget {
  const PoolDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // --> Replace with actual pool details
          _buildDetailRow(context, 'volume', '10,000 gal'),
          16.verticalSpace,
          _buildDetailRow(context, 'sanitiser', 'Salt / chlorine'),
          16.verticalSpace,
          _buildDetailRow(context, 'surface', 'Plaster'),
          16.verticalSpace,
          _buildDetailRow(context, 'type', 'In-ground'),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String labelKey, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.getString(labelKey),
          style: AppTypography.quoteDetail,
        ),
        Text(
          value,
          style: AppTypography.quoteDetailInfo,
        ),
      ],
    );
  }
}