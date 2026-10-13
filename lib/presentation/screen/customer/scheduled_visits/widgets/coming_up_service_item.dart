import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class ComingUpServiceItem extends StatelessWidget {
  final String date;
  final String description;

  const ComingUpServiceItem({
    super.key,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      leading: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: AppColors.infoBannerBg,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: SvgPicture.asset( AppAssets.icCalendar,),
      ),
      title: Text(date, style: AppTypography.sectionHeader),
      subtitle: Text(description, style: AppTypography.infoLabel),
      trailing: SvgPicture.asset(AppAssets.icChevronRight),
      onTap: () {}, // --> Handle tap
    );
  }
}