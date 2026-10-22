import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class AddCardButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddCardButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: const Offset(0, 2))
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(28.r),
          onTap: () {}, // --> Handle tap
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.icAdd,
                  width: 20.w,
                  height: 20.w,
                  colorFilter: const ColorFilter.mode(
                      AppColors.darkNavy, BlendMode.srcIn)),
              8.horizontalSpace,
              Text(
                context.getString('add_card'),
                style: AppTypography.nextButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
