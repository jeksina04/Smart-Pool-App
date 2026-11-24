import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import '../../../../service/navigation.dart';
import 'technician_info_row.dart';
import 'vehicle_info_row.dart';

class WhoIsComingCard extends StatelessWidget {
  final String technicianName;
  final String technicianRole;
  final String vehicleName;
  final String vehicleInstruction;

  const WhoIsComingCard({
    super.key,
    required this.technicianName,
    required this.technicianRole,
    required this.vehicleName,
    required this.vehicleInstruction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.getString('who_is_coming'),
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
              TechnicianInfoRow(
                name: technicianName,
                roleSubtitle: technicianRole,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.technicianProfile,
                    arguments: {
                      'name': technicianName,
                      'role': technicianRole,
                      'vehicleInfo': vehicleName,
                    },
                  );
                },
              ),
              const Divider(height: 1, color: AppColors.dividerColor),
              VehicleInfoRow(
                vehicleName: vehicleName,
                instruction: vehicleInstruction,
              ),
            ],
          ),
        ),
      ],
    );
  }
}