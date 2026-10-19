import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import '../../../../service/navigation.dart';

class ReportProblemButton extends StatelessWidget {
  const ReportProblemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.h,
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
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.reportIssue);
        },
        borderRadius: BorderRadius.circular(28.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.icAlert,
              colorFilter: const ColorFilter.mode(
                AppColors.darkNavy,
                BlendMode.srcIn,
              ),
            ),
            12.horizontalSpace,
            Text(
              context.getString('report_a_problem'),
              style: AppTypography.logOut,
            ),
          ],
        ),
      ),
    );
  }
}