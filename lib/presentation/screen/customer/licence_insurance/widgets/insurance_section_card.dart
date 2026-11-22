import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import 'general_liability_row.dart';
import 'workers_comp_row.dart';

class InsuranceSectionCard extends StatelessWidget {
  final String generalLiabilityInfo;
  final String workersCompInfo;

  const InsuranceSectionCard({
    super.key,
    required this.generalLiabilityInfo,
    required this.workersCompInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.getString('insurance'),
          style: AppTypography.quickActionsHeading,
        ),
        8.verticalSpace,
        Container(
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
            children: [
              GeneralLiabilityRow(generalLiabilityInfo: generalLiabilityInfo),
              const Divider(height: 1, color: AppColors.dividerColor),
              WorkersCompRow(workersCompInfo: workersCompInfo),
            ],
          ),
        ),
      ],
    );
  }
}