import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

enum WorkOrderStatus {
  open,
  urgent,
  approved,
  done,
}

enum WorkOrderIconType {
  wrench,
  repair,
  warning,
  checkmark,
}

class WorkOrderItemModel {
  final String title;
  final String subtitle;
  final WorkOrderStatus status;
  final WorkOrderIconType iconType;

  const WorkOrderItemModel({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.iconType,
  });
}

/// A single row within the work orders card list
class WorkOrderItemRow extends StatelessWidget {
  final WorkOrderItemModel item;
  final VoidCallback? onTap;

  const WorkOrderItemRow({
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
            /// Leading icon in rounded square container
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
                  4.verticalSpace,
                  Text(
                    item.subtitle,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGrey,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),

            /// Status badge pill
            _buildStatusBadge(),
            10.horizontalSpace,

            /// Chevron right
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
    return Container(
      width: 44.w,
      height: 44.w,
      decoration: BoxDecoration(
        color: const Color(0xFFEFF4FE),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Center(
        child: item.iconType == WorkOrderIconType.checkmark
            ? SvgPicture.asset(
                AppAssets.icCheck,
                width: 20.w,
                height: 20.w,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF1668D6),
                  BlendMode.srcIn,
                ),
              )
            : item.iconType == WorkOrderIconType.warning
                ? Icon(
                    Icons.warning_amber_rounded,
                    size: 22.w,
                    color: AppColors.primaryBlue,
                  )
                : SvgPicture.asset(
                    AppAssets.icRepair,
                    width: 20.w,
                    height: 20.w,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF1668D6),
                      BlendMode.srcIn,
                    ),
                  ),
      ),
    );
  }

  Widget _buildStatusBadge() {
    String text;
    Color bgColor;
    Color textColor;

    switch (item.status) {
      case WorkOrderStatus.open:
        text = 'Open';
        bgColor = const Color(0xFFE8F1FE);
        textColor = AppColors.primaryBlue;
        break;
      case WorkOrderStatus.urgent:
        text = 'Urgent';
        bgColor = const Color(0xFFFFECEB);
        textColor = const Color(0xFFD32F2F);
        break;
      case WorkOrderStatus.approved:
        text = 'Approved';
        bgColor = const Color(0xFFE6F7EF);
        textColor = const Color(0xFF157A4C);
        break;
      case WorkOrderStatus.done:
        text = 'Done';
        bgColor = const Color(0xFFE4F6ED);
        textColor = const Color(0xFF1B8755);
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: AppTypography.poppinsFont,
          fontSize: 11.sp,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
}
