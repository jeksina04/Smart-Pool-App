import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import 'company_list_item.dart';

class TechniciansSection extends StatelessWidget {
  const TechniciansSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8)],
          ),
          child: const Column(
            children: [
              // --> Replace with actual technicians
              CompanyListItem(
                icon: AppAssets.icNavProfile,
                title: "Ray Delgado",
                subtitle: "Lead technician · most of your visits",
              ),
              CompanyListItem(
                icon: AppAssets.icNavProfile,
                title: "Dan Morris",
                subtitle: "Covers when Ray is away",
                isLast: true,
              ),
            ],
          ),
        ),
        16.verticalSpace,
        // Technician Notice Banner
        Container(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.h, 8.h),
          decoration: BoxDecoration(
            color: AppColors.infoBannerBg,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppAssets.icLicense, height: 16.w, width: 6.w),
              8.horizontalSpace,
              // --> Replace with actual company name
              Expanded(
                child: Text(
                  context.getString('technician_employment_notice', {'company': 'NSP Pool & Spa Services'}),
                  style: AppTypography.stripText
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}