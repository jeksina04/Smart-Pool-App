import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import '../../../../service/navigation.dart';

/// A card widget that displays details about the next scheduled service.
class NextScheduledVisitCard extends StatelessWidget {
  final String? dateTitle;
  final String? fullDateTime;
  final String? serviceType;
  final String? technicianName;
  final String? technicianRole;
  final String? vehicleName;
  final String? vehicleInstruction;
  final String? plannedFrequency;
  final String? plannedDescription;

  const NextScheduledVisitCard({
    super.key,
    this.dateTitle,
    this.fullDateTime,
    this.serviceType,
    this.technicianName,
    this.technicianRole,
    this.vehicleName,
    this.vehicleInstruction,
    this.plannedFrequency,
    this.plannedDescription,
  });

  @override
  Widget build(BuildContext context) {
    // Hardcoded values for testing purpose
    final String resolvedDateTitle = dateTitle ?? 'Fri 7 Aug';
    final String resolvedFullDateTime =
        fullDateTime ?? 'Fri 7 Aug · 10:00 AM – 12:00 PM';
    final String resolvedServiceType =
        serviceType ?? context.getString('full_clean_and_balance');
    final String resolvedTechnicianName = technicianName ?? 'Ray Delgado';
    final String resolvedTechnicianRole =
        technicianRole ?? 'Lead technician · NSP Pool & Spa Services';
    final String resolvedVehicleName =
        vehicleName ?? 'White Ford Transit 250 · NSP-4471';
    final String resolvedVehicleInstruction =
        vehicleInstruction ?? context.getString('vehicle_search_instruction');
    final String resolvedFrequency =
        plannedFrequency ?? context.getString('weekly_tag');
    final String resolvedDescription =
        plannedDescription ?? context.getString('planned_visit_default_desc');

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.upcomingVisit, arguments: {
          'dateTitle': resolvedDateTitle,
          'fullDateTime': resolvedFullDateTime,
          'plannedTitle': resolvedServiceType,
          'plannedFrequency': resolvedFrequency,
          'plannedDescription': resolvedDescription,
          'technicianName': resolvedTechnicianName,
          'technicianRole': resolvedTechnicianRole,
          'vehicleName': resolvedVehicleName,
          'vehicleInstruction': resolvedVehicleInstruction,
        });
      },
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.recurringQuoteBg,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 8,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.cardShadow,
                            blurRadius: 8,
                            offset: Offset(0, 2))
                      ]),
                  child: SvgPicture.asset(AppAssets.icCalendar,),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context.getString('next_scheduled_visit'),
                          style: AppTypography.cardTitle),
                      Text(
                        "Fri 7 Aug · 10:00 AM",
                        style: AppTypography.sectionHeader,
                        // --> Hardcoded values for testing purpose.
                      ),
                      Text(
                          '$resolvedServiceType · Ray', // --> Hardcoded value for technician name
                          style: AppTypography.cardTitle),
                    ],
                  ),
                ),
              ],
            ),
            8.verticalSpace,

            /// Divider between header and schedule details
            const Divider(color: AppColors.dividerColor, indent: 2, endIndent: 2,),

            8.verticalSpace,

            Row(
              children: [
                SvgPicture.asset(
                  AppAssets.icRoute,
                ),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        resolvedVehicleName,
                        style: AppTypography.skipButton,
                      ),
                      Text(context.getString('vehicle_search_instruction'),
                          style: AppTypography.cardTitle),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}