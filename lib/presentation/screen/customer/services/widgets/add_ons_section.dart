import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class AddOnsSection extends StatelessWidget {
  const AddOnsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.getString(
              'add_ons_title', {'company': 'NSP Pool & Spa Services'}), // --> Replace with actual company name
          style: AppTypography.dashboardHeading.copyWith(fontSize: 18.sp),
        ),
        16.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                  color: AppColors.cardShadow,
                  blurRadius: 10,
                  offset: const Offset(0, 4))
            ],
          ),
          child: Column(
            children: [
              _buildAddOnItem(
                context,
                icon: AppAssets.icWrench,
                title: context.getString('filter_deep_clean'),
                subtitle: "60–90 min · ${context.getString('buy_in_app')}", // --> Replace with actual time duration
                price: "\$120", // --> Replace with actual price
              ),
              _buildAddOnItem(
                context,
                icon: AppAssets.icWaterDrop,
                title: context.getString('green_pool_recovery'),
                subtitle: context.getString('quoted_after_photos'),
                price: context.getString('from_price', {'price': '\$250'}), // --> Replace with actual price
              ),
              _buildAddOnItem(context,
                  icon: AppAssets.icWrench,
                  title: context.getString('equipment_inspection'),
                  price: "\$85", // --> Replace with actual price
                  isLast: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddOnItem(
    BuildContext context, {
    required String icon,
    required String title,
    String? subtitle,
    required String price,
    bool isLast = false,
  }) {
    return Column(children: [
      ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        leading: Container(
          width: 40.w,
          height: 40.w,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
              color: AppColors.infoBannerBg,
              borderRadius: BorderRadius.circular(12.r)),
          child: SvgPicture.asset(icon,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryBlue, BlendMode.srcIn)),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(title, style: AppTypography.sectionHeader)),
            Text(price, style: AppTypography.priceText),
            8.horizontalSpace,
            SvgPicture.asset(AppAssets.icChevronRight),
          ],
        ),
        subtitle: subtitle != null
            ? Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Text(subtitle, style: AppTypography.infoLabel),
              )
            : null,
        onTap: () {}, // --> Handle tap
      ),
      if (!isLast)
        const Divider(
          height: 1,
          color: AppColors.dividerColor,
        ),
    ]);
  }
}
