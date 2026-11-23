import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class WorkersCompRow extends StatelessWidget {
  final String workersCompInfo;

  const WorkersCompRow({
    super.key,
    required this.workersCompInfo,
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
        child: SvgPicture.asset(AppAssets.icLicense,),
      ),
      title: Text(
        context.getString('workers_compensation'),
        style: AppTypography.sectionHeader
      ),
      subtitle: Text(
        workersCompInfo,
        style: AppTypography.infoLabel
      ),
    );
  }
}