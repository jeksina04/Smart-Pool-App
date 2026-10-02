import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class HistoryCardItem extends StatelessWidget {
  final String date;
  final String description;
  final bool isRepair;

  const HistoryCardItem({
    super.key,
    required this.date,
    required this.description,
    required this.isRepair,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, ),
      leading: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: AppColors.infoBannerBg,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: SvgPicture.asset(
          isRepair ? AppAssets.icWrench : AppAssets.icCheck,
          width: 20.w,
          colorFilter: const ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),
        ),
      ),
      title: Text(
          date,
          style: AppTypography.inputLabel.copyWith(fontSize: 16.sp)
      ),
      subtitle: Text(
          description,
          style: AppTypography.infoLabel
      ),
      trailing: SvgPicture.asset(AppAssets.icChevronRight),
      onTap: () {}, // --> Handle tap
    );
  }
}