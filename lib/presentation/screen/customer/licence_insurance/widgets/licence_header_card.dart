import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class LicenceHeaderCard extends StatelessWidget {
  final String licenceNumber;
  final String licenceType;
  final String companyName;
  final String issuedBy;
  final String expiresDate;
  final String status;

  const LicenceHeaderCard({
    super.key,
    required this.licenceNumber,
    required this.licenceType,
    required this.companyName,
    required this.issuedBy,
    required this.expiresDate,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.infoBannerBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: SvgPicture.asset(AppAssets.icLicense,),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.getString('licence_label', {'number': licenceNumber}),
                      style: AppTypography.sectionHeader
                    ),
                    Text(
                      "$licenceType · $companyName",
                      style: AppTypography.infoLabel
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.phStatusBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  status,
                  style: AppTypography.badgeText
                ),
              ),
            ],
          ),
          8.verticalSpace,
          const Divider(height: 1, color: AppColors.dividerColor),
          8.verticalSpace,
          /// Issued By Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.getString('issued_by'),
                style: AppTypography.infoLabel,
              ),
              Text(
                issuedBy,
                style: AppTypography.skipButton
              ),
            ],
          ),

          8.verticalSpace,

          /// Expires Date Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.getString('expires'),
                style: AppTypography.infoLabel,
              ),
              Text(
                expiresDate,
                style: AppTypography.skipButton
              ),
            ],
          ),
        ],
      ),
    );
  }
}