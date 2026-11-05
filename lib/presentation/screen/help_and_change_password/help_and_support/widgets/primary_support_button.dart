import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_colors.dart';

class PrimarySupportButton extends StatelessWidget {
  const PrimarySupportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(28),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.dashboard,
                (route) => false,
            arguments: {
              'index': 3,
              'showSupport': true,
            },
          );
        },
        borderRadius: BorderRadius.circular(28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.icDocument,
                width: 20.w,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn)),
            12.horizontalSpace,
            Text(
              context.getString('message_pool_care_support'),
              style: AppTypography.signInButton
            ),
          ],
        ),
      ),
    );
  }
}
