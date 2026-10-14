import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_typography.dart';

/// Displays app branding, notifications, user greeting, and weather
class GreetingAndWeatherSection extends StatelessWidget {
  final bool isNewUser;
  const GreetingAndWeatherSection({super.key, required this.isNewUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Greeting Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.getString('dashboard_hello', {'name': 'Renee'}), // --> Replace with user name
                    style: AppTypography.dashboardHeading,
                  ),
                  4.verticalSpace,
                  Text(
                    context.getString(
                      isNewUser
                          ? 'dashboard_first_visit_overview'
                          : 'dashboard_overview',
                    ),
                    style: AppTypography.infoLabel,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
