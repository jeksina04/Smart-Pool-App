import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class UnreadBanner extends StatelessWidget {
  final int count;

  const UnreadBanner({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.w, 8.h),
      decoration: BoxDecoration(
        color: AppColors.infoBannerBg,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.icBell,
            colorFilter:
                ColorFilter.mode(AppColors.infoBannerText, BlendMode.srcIn),
          ),
          8.horizontalSpace,
          Text(context.getString('unread_updates', {'count': count.toString()}),
              style: AppTypography.stripText),
        ],
      ),
    );
  }
}
