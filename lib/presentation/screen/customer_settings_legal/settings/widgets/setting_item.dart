import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class SettingItem extends StatelessWidget {
  final String icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const SettingItem(
      {super.key,
      required this.icon,
      required this.title,
      this.subtitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      onTap: onTap,

      /// Icon inside a rounded blue background
      leading: Container(
        padding: EdgeInsets.all(10.w),
        height: 40.w,
        width: 40.w,
        decoration: BoxDecoration(
          color: AppColors.infoBannerBg,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: SizedBox(
          width: 20.w,
          height: 20.w,
          child: SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),
          ),
        ),
      ),
      title: Text(title, style: AppTypography.sectionHeader),
      subtitle: subtitle != null
          ? Text(subtitle!, style: AppTypography.infoLabel)
          : null,
      trailing: SvgPicture.asset(AppAssets.icChevronRight,),
    );
  }
}
