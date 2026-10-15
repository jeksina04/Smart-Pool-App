import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class CompanyListItem extends StatelessWidget {
  final String id;
  final String name;
  final String initials;
  final String subtitle;
  final Color brandColor;
  final bool isSelected;
  final Function(String) onTap;

  const CompanyListItem({
    super.key,
    required this.id,
    required this.name,
    required this.initials,
    required this.subtitle,
    required this.brandColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      onTap: () => onTap(id),
      leading: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: brandColor,
          borderRadius: BorderRadius.circular(11.r),
        ),
        alignment: Alignment.center,
        child: Text(
          initials,
          style: AppTypography.signInButton.copyWith(fontSize: 13.sp),
        ),
      ),
      title: Text(name, style: AppTypography.sectionHeader),
      subtitle: Text(
        subtitle,
        style: AppTypography.cardTitle,
      ),
      trailing: isSelected
          ? Container(
        padding: EdgeInsets.all(10.w),
        decoration: const BoxDecoration(
          color: AppColors.statusGreen,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(AppAssets.icCheck, width: 14.w, colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),)
      )
          : SvgPicture.asset(
        AppAssets.icChevronRight,
        colorFilter: const ColorFilter.mode(AppColors.textGrey, BlendMode.srcIn),
      ),
    );
  }
}
