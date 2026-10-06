import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_colors.dart';

class ServiceListCard extends StatelessWidget {
  const ServiceListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 8,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(children: [
        _buildItem(
          context,
          icon: AppAssets.icCalendar,
          title: context.getString('scheduled_visits'),
          subtitle: context.getString('next_visit', {'date': 'Fri 7Aug, 10:00 AM'}), // --> Replace with actual date
        ),
        _buildItem(context,
            icon: AppAssets.icFlask,
            title: context.getString('water_test_service')),
        _buildItem(context,
            icon: AppAssets.icAlert,
            title: context.getString('report_an_issue')),
        _buildItem(context,
            icon: AppAssets.icWrench,
            title: context.getString('pool_equipment')),
        _buildItem(
          context,
          icon: AppAssets.icShoppingBag,
          title: context.getString('service_company'),
          subtitle: "NSP Pool & Spa Services", // --> Replace with actual company name
          isLast: true,
        ),
      ]),
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required String icon,
    required String title,
    String? subtitle,
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
          subtitle: subtitle != null
              ? Text(subtitle, style: AppTypography.infoLabel)
              : null,
          trailing: SvgPicture.asset(AppAssets.icChevronRight),
          onTap: () {} // --> Handle tap
          ),
      if (!isLast)
        const Divider(
          height: 1,
          color: AppColors.dividerColor,
        ),
    ]);
  }
}
