import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class TechnicianInfoCard extends StatelessWidget {
  const TechnicianInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8, offset: Offset(0, 2))],
      ),
      child: Row(
        children: [
          // --> Replace with actual company logo
          Container(
            height: 36.w,
            width: 36.w,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Text("CP", style: AppTypography.priceText.copyWith(color: AppColors.white)),
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // --> Replace with actual company name, technician name, and service details
              children: [
                Text("NSP Pool & Spa Services", style: AppTypography.skipButton),
                Text("Ray Delgado · technician", style: AppTypography.infoLabel),
                Text("Arrived in White Ford Transit 250 · NSP-4471", style: AppTypography.infoLabel,),
              ],
            ),
          ),
          SvgPicture.asset(AppAssets.icChevronRight),
        ],
      ),
    );
  }
}
