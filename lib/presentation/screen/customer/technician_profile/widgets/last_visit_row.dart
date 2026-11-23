import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class LastVisitRow extends StatelessWidget {
  final String lastVisitDate;
  final VoidCallback? onTap;

  const LastVisitRow({
    super.key,
    required this.lastVisitDate,
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
          AppAssets.icNavHistory,
          colorFilter: const ColorFilter.mode(
            AppColors.primaryBlue,
            BlendMode.srcIn,
          ),
        ),
      ),
      title: Text(
        context.getString('last_visit'),
        style: AppTypography.sectionHeader,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            lastVisitDate,
            style: AppTypography.infoLabel,
          ),
          8.horizontalSpace,
          SvgPicture.asset(AppAssets.icChevronRight),
        ],
      ),
      onTap: onTap,
    );
  }
}