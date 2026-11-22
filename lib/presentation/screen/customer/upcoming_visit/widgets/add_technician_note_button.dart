import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class AddTechnicianNoteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddTechnicianNoteButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(28.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.icEdit,
              width: 18.w,
              colorFilter: const ColorFilter.mode(
                AppColors.darkNavy,
                BlendMode.srcIn,
              ),
            ),
            12.horizontalSpace,
            Text(
              context.getString('add_note_for_technician'),
              style: AppTypography.logOut,
            ),
          ],
        ),
      ),
    );
  }
}