import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

/// A card widget that displays details about the next scheduled pool service.
class PoolServiceCompanyCard extends StatelessWidget {
  const PoolServiceCompanyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              /// Company icon
              // --> Replace with actual company icon
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF0E5FC4),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Text(
                  'CP',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              16.horizontalSpace,

              /// Service name and header
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.getString('pool_service_company'),
                        style: AppTypography.cardLabel
                            .copyWith(fontWeight: FontWeight.w400)),
                    Text(
                      "NSP Pool & Spa Services", // --> Replace with actual service name
                      style: AppTypography.cardLabel
                          .copyWith(fontSize: 16.sp, color: AppColors.darkNavy),
                    ),
                  ],
                ),
              ),

              /// Directional arrow icon
              16.horizontalSpace,

              Text(context.getString('switch'),
                  style: AppTypography.cardLabel.copyWith(
                    color: AppColors.primaryBlue,
                  )),
              8.horizontalSpace,
              SvgPicture.asset(AppAssets.icChevronRight),
            ],
          ),
          8.verticalSpace,
        ],
      ),
    );
  }
}
