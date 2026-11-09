import 'package:ez_localization/ez_localization.dart';import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import 'how_it_works_item.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final company = "NSP Pool & Spa Services";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.getString('how_it_works'), style: AppTypography.quickActionsHeading),
        8.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                    color: AppColors.cardShadow,
                    blurRadius: 8.r,
                    offset: Offset(0, 2))
              ]),
          child: Column(
            children: [
              HowItWorksItem(
                icon: AppAssets.icCustomer,
                title: context.getString('step_1_title', {'company': company}),
                subtitle: context.getString('step_1_subtitle'),
              ),
              const Divider(height: 1, color: AppColors.cardBorder),
              HowItWorksItem(
                icon: AppAssets.icCheck,
                title: context.getString('step_2_title'),
                subtitle: context.getString('step_2_subtitle'),
              ),
              const Divider(height: 1, color: AppColors.cardBorder),
              HowItWorksItem(
                icon: AppAssets.icStar,
                title: context.getString('step_3_title'),
                subtitle: context.getString('step_3_subtitle', {'company': company}),
              ),
            ],
          ),
        ),
      ],
    );
  }
}