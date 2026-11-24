import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class GoodToKnowSection extends StatelessWidget {
  const GoodToKnowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.getString('good_to_know'),
            style: AppTypography.quickActionsHeading),
        16.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                  color: AppColors.cardShadow,
                  blurRadius: 8,
                  offset: const Offset(0, 2)),
            ],
          ),
          child: Column(children: [
            _buildInfoTile(
              context,
                icon: AppAssets.icShoppingBag,
                title: context.getString('sold_by'),
                subtitle: context.getString('prices_set_by_them',
                    {'company': 'NSP Pool & Spa Services'})),
            _buildInfoTile(
                context,
                icon: AppAssets.icCreditCard,
                title: context.getString('paid_to'),
                subtitle: context.getString('smart_pool_never_holds_your_money',
                    {'company': 'NSP Pool & Spa Services'})),
            _buildInfoTile(
                context,
                icon: AppAssets.icCalendar,
                title: context.getString('scheduling'),
                subtitle: context.getString('added_to_your_next_visit'),
                isLast: true),
          ]),
        )
      ],
    );
  }

  Widget _buildInfoTile(
    BuildContext context, {
    required String icon,
    required String title,
    required String subtitle,
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
        title: Text(title, style: AppTypography.sectionHeader),
        subtitle: Text(subtitle, style: AppTypography.infoLabel),
      ),
      if (!isLast)
        const Divider(
          height: 1,
          color: AppColors.dividerColor,
        ),
    ]);
  }
}
