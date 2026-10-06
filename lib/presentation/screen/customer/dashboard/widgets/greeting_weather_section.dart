import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

/// Displays app branding, notifications, user greeting, and weather
class GreetingAndWeatherSection extends StatelessWidget {
  const GreetingAndWeatherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Greeting and Weather Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.getString('dashboard_hello', {'name': 'Renee'}), // --> Replace with user name
                  style: AppTypography.dashboardHeading,
                ),
                4.verticalSpace,
                Text(
                  context.getString('dashboard_overview'),
                  style: AppTypography.infoLabel,
                ),
              ],
            ),

            /// Weather Forecast Card
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.cardShadow,
                      blurRadius: 8,
                      offset: const Offset(0, 4))
                ],
              ),
              child: Column(
                children: [
                  SvgPicture.asset(AppAssets.icSunny, width: 24.w),
                  4.verticalSpace,
                  Text("90°F", style: AppTypography.sectionHeader), // --> Replace with actual temperature
                  Text("Sunny", style: AppTypography.infoText.copyWith(color: AppColors.textGrey)), // --> Replace with actual weather condition
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
