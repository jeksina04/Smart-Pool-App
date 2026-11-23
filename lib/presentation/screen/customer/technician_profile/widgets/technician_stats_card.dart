import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/technician_profile/widgets/visits_count_row.dart';
import '../../../../../util/app_colors.dart';
import 'arrives_in_row.dart';
import 'last_visit_row.dart';

class TechnicianStatsCard extends StatelessWidget {
  final String visitsCount;
  final String lastVisitDate;
  final String vehicleInfo;
  final VoidCallback? onLastVisitTap;

  const TechnicianStatsCard({
    super.key,
    required this.visitsCount,
    required this.lastVisitDate,
    required this.vehicleInfo,
    this.onLastVisitTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          VisitsCountRow(visitsCount: visitsCount),
          const Divider(height: 1, color: AppColors.dividerColor),
          LastVisitRow(
            lastVisitDate: lastVisitDate,
            onTap: onLastVisitTap,
          ),
          const Divider(height: 1, color: AppColors.dividerColor),
          ArrivesInRow(vehicleInfo: vehicleInfo),
        ],
      ),
    );
  }
}