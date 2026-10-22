import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class PlanListItem extends StatelessWidget {
  final String name;
  final String description;
  final String? price;
  final bool isCurrent;
  final VoidCallback onTap;

  const PlanListItem({
    super.key,
    required this.name,
    required this.description,
    this.price,
    this.isCurrent = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppTypography.sectionHeader),
                  8.verticalSpace,
                  Text(description, style: AppTypography.infoLabel),
                ],
              ),
            ),
            if (isCurrent)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.recurringQuoteBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  context.getString('current'),
                  style: AppTypography.defaultText,
                ),
              )
            else ...[
              Text(price ?? '', style: AppTypography.infoLabel),
              8.horizontalSpace,
              SvgPicture.asset(AppAssets.icChevronRight,),
            ],
          ],
        ),
      ),
    );
  }
}