import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class EquipmentListCard extends StatelessWidget {
  const EquipmentListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // --> Replace this with the actual equipment items
          _EquipmentItem(
            name: 'Pump',
            description: 'Hayward TriStar · fitted 2026',
            status: 'OK',
            statusColor: AppColors.inRangeGreen,
            statusBg: AppColors.phStatusBg,
          ),
          const Divider(height: 1, color: AppColors.cardBorder),
          _EquipmentItem(
            name: 'Filter',
            description: 'Pentair Clean & Clear',
            status: 'OK',
            statusColor: AppColors.inRangeGreen,
            statusBg: AppColors.phStatusBg,
          ),
          const Divider(height: 1, color: AppColors.cardBorder),
          _EquipmentItem(
            name: 'Salt cell',
            description: '2025 · warranty to 2028',
            status: 'Watch',
            statusColor: AppColors.statusHighText,
            statusBg: AppColors.statusHighBg,
          ),
        ],
      ),
    );
  }
}

class _EquipmentItem extends StatelessWidget {
  final String name;
  final String description;
  final String status;
  final Color statusColor;
  final Color statusBg;

  const _EquipmentItem({
    required this.name,
    required this.description,
    required this.status,
    required this.statusColor,
    required this.statusBg,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, // --> Handle equipment item tap
      borderRadius: BorderRadius.circular(16.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.recurringQuoteBg,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SvgPicture.asset(
                AppAssets.icWrench,
                colorFilter: const ColorFilter.mode(
                  AppColors.primaryBlue,
                  BlendMode.srcIn,
                ),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppTypography.sectionHeader),
                  2.verticalSpace,
                  Text(description, style: AppTypography.cardTitle),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: statusBg,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                status,
                style: AppTypography.badgeText.copyWith(color: statusColor),
              ),
            ),
            8.horizontalSpace,
            SvgPicture.asset(AppAssets.icChevronRight,),
          ],
        ),
      ),
    );
  }
}