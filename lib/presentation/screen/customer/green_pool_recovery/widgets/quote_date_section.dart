import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class QuoteDateSection extends StatelessWidget {
  const QuoteDateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.getString('preferred_start_date'), style: AppTypography.inputLabel),
        8.verticalSpace,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: const [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AppAssets.icCalendar,
                colorFilter: ColorFilter.mode(
                    AppColors.rateTechnicianStar, BlendMode.srcIn),
              ),
              12.horizontalSpace,
              Text(
                context.getString('select_date_hint'),
                style: AppTypography.inputHint
              ),
            ],
          ),
        ),
      ],
    );
  }
}
