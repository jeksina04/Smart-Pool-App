import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class InvoiceDetailSummaryCard extends StatelessWidget {
  const InvoiceDetailSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.w, 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8.r,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppAssets.spLogoOnboarding, width: 20.w, height: 20.w),
                  8.horizontalSpace,
                  Image.asset(AppAssets.woodmarkOnboarding, width: 76.w, height: 9.13.w)
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.dueBadgeBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  context.getString('due'),
                  style: AppTypography.notificationAlert,
                ),
              ),
            ],
          ),
          8.verticalSpace,
          Divider(color: AppColors.dividerColor, height: 1, indent: 1, endIndent: 1,),
          8.verticalSpace,

          // --> Replace with Actual data
          _buildRow(context.getString('billed_to'), "Renee Alvarez"),
          8.verticalSpace,
          _buildRow(context.getString('issued'), "19 Aug 2026"),
          8.verticalSpace,
          _buildRow(context.getString('due'), "3 Sep 2026 · Net 15"),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTypography.cardTitle),
        Text(value, style: AppTypography.skipButton),
      ],
    );
  }
}