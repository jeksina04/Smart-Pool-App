import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/util/app_assets.dart';

enum TechNotificationIconType {
  route,
  wrench,
  person,
  sync,
}

class TechNotificationItemModel {
  final String title;
  final String subtitle;
  final String time;
  final TechNotificationIconType iconType;

  const TechNotificationItemModel({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.iconType,
  });
}

/// A row inside the notifications card
class TechNotificationItemRow extends StatelessWidget {
  final TechNotificationItemModel item;
  final VoidCallback? onTap;

  const TechNotificationItemRow({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Soft blue square container with icon
            _buildIcon(),
            14.horizontalSpace,

            /// Title + Subtitle details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkNavy,
                    ),
                  ),
                  3.verticalSpace,
                  Text(
                    item.subtitle,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ),

            /// Time (e.g. 2m, 1h, 3h, Yest.)
            Text(
              item.time,
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textGrey,
              ),
            ),
            8.horizontalSpace,

            /// Trailing chevron
            Icon(
              Icons.chevron_right_rounded,
              size: 20.w,
              color: const Color(0xFF9AA5B5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    Widget iconWidget;

    switch (item.iconType) {
      case TechNotificationIconType.route:
        iconWidget = SvgPicture.asset(
          AppAssets.icRoute,
          width: 18.w,
          height: 18.w,
          colorFilter: const ColorFilter.mode(
            AppColors.primaryBlue,
            BlendMode.srcIn,
          ),
        );
        break;
      case TechNotificationIconType.wrench:
        iconWidget = SvgPicture.asset(
          AppAssets.icWrench,
          width: 18.w,
          height: 18.w,
          colorFilter: const ColorFilter.mode(
            AppColors.primaryBlue,
            BlendMode.srcIn,
          ),
        );
        break;
      case TechNotificationIconType.person:
        iconWidget = Icon(
          Icons.person_outline_rounded,
          size: 20.w,
          color: AppColors.primaryBlue,
        );
        break;
      case TechNotificationIconType.sync:
        iconWidget = Icon(
          Icons.sync_rounded,
          size: 20.w,
          color: AppColors.primaryBlue,
        );
        break;
    }

    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: const Color(0xFFE9F1FE),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(child: iconWidget),
    );
  }
}
