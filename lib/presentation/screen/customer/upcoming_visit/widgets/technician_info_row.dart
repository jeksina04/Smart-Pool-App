import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class TechnicianInfoRow extends StatelessWidget {
  final String name;
  final String roleSubtitle;
  final VoidCallback? onTap;

  const TechnicianInfoRow({
    super.key,
    required this.name,
    required this.roleSubtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      leading: Container(
        width: 40.w,
        height: 40.w,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: AppColors.infoBannerBg,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: SvgPicture.asset(
          AppAssets.icCustomer,
          colorFilter: const ColorFilter.mode(
            AppColors.primaryBlue,
            BlendMode.srcIn,
          ),
        ),
      ),
      title: Text(
        name,
        style: AppTypography.sectionHeader
      ),
      subtitle: Text(
        roleSubtitle,
        style: AppTypography.infoLabel
      ),
      trailing: SvgPicture.asset(AppAssets.icChevronRight),
      onTap: onTap,
    );
  }
}