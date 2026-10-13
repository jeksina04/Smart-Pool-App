import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class SupportProfileSection extends StatelessWidget {
  const SupportProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 32.w,
              backgroundColor: AppColors.profileBg,
              child: SvgPicture.asset(
                AppAssets.icNavProfile,
                height: 30.w,
                width: 30,
              ),
            ),
            Positioned(
              right: 2.w,
              bottom: 5.h,
              child: Container(
                height: 14.w,
                width: 14.w,
                decoration: BoxDecoration(
                  color: AppColors.profileActive,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            )
          ],
        ),
        8.verticalSpace,
        Text(
          context.getString('pool_care_support'),
          style: AppTypography.poolCareSupport,
        ),
        4.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 8.w,
                height: 8.w,
                decoration: const BoxDecoration(
                    color: AppColors.profileActive, shape: BoxShape.circle)),
            8.horizontalSpace,
            Text(context.getString('support_subtitle'),
                style: AppTypography.infoLabel),
          ],
        ),
      ],
    );
  }
}
