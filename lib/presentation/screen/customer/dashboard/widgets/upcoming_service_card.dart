import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ez_localization/ez_localization.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

/// Card displaying upcoming pool service information for customers.
class UpcomingServiceCard extends StatelessWidget {
  final bool isNewUser;

  const UpcomingServiceCard({
    super.key,
    required this.isNewUser,
  });

  /// Builds a reusable SVG icon with the specified size and color.
  Widget _icon(String asset, double? size, Color color) =>
      SvgPicture.asset(
        asset,
        width: size?.w,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      // Use different padding for new and existing users.
      padding: EdgeInsets.all(isNewUser ? 16.w : 20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          /// Header: service icon, title, description, and navigation arrow.
          Row(
            children: [
              // Calendar icon with a user-specific background and color.
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: isNewUser
                      ? AppColors.newUserMetricChartPlaceholder
                      : AppColors.infoBannerBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: _icon(
                  AppAssets.icCalendar, 20,
                  isNewUser ? AppColors.newUserIcon : AppColors.primaryBlue,
                ),
              ),
              12.horizontalSpace,

              // Service details change according to the user type.
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.getString('upcoming_service'),
                      style: AppTypography.cardTitle,
                    ),
                    4.verticalSpace,
                    Text(
                      isNewUser
                          ? context.getString('no_visit_scheduled_yet')
                          : "Pool Cleaning", // --> Replace with actual service name
                      style: AppTypography.sectionHeader,
                    ),

                    // Show company information only for new users.
                    if (isNewUser) ...[
                      4.verticalSpace,
                      Text(
                        context.getString(
                          'first_visit_info',
                          {'company': 'NSP Pool & Spa Services'}, // --> Replace with actual company name
                        ),
                        style: AppTypography.infoLabel,
                      ),
                    ],
                  ],
                ),
              ),

              // Chevron indicating navigation or more details.
              _icon(AppAssets.icChevronRight, null, AppColors.textGrey),
            ],
          ),

          // Existing users also see the scheduled date and time.
          if (!isNewUser) ...[
            8.verticalSpace,
            const Divider(color: AppColors.dividerColor),
            8.verticalSpace,

            /// Footer: scheduled service date and time.
            Row(
              children: [
                _icon(AppAssets.icCalendar, 14, AppColors.textGrey),
                8.horizontalSpace,
                Text('24 May 2026', style: AppTypography.infoLabel), // --> Replace with actual date
                16.horizontalSpace,
                _icon(AppAssets.icNavHistory, 14, AppColors.textGrey),
                8.horizontalSpace,
                Text('10:00 AM', style: AppTypography.infoLabel), // --> Replace with actual time
              ],
            ),
          ],
        ],
      ),
    );
  }
}