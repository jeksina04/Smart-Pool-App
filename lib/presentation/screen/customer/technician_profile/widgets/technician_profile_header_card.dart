import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class TechnicianProfileHeaderCard extends StatelessWidget {
  final String name;
  final String role;
  final String experience;

  const TechnicianProfileHeaderCard({
    super.key,
    required this.name,
    required this.role,
    required this.experience,
  });

  String _getInitials(String fullName) {
    if (fullName.trim().isEmpty) return 'T';
    final parts = fullName.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
          /// Initials Avatar Circle
          Container(
            width: 88.w,
            height: 88.w,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.chlorineChartColor,
                  AppColors.infoBannerText
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              _getInitials(name),
              style: AppTypography.technicianInitials,
            ),
          ),

          8.verticalSpace,

          /// Technician Name
          Text(name, style: AppTypography.technicianName,),

          4.verticalSpace,

          /// Role & Experience Lines
          Text(
            role,
            textAlign: TextAlign.center,
            style: AppTypography.infoLabel
          ),
          Text(
            experience,
            textAlign: TextAlign.center,
            style: AppTypography.infoLabel
          ),
        ],
      ),
    );
  }
}