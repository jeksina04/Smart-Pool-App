import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

enum WorkOrderStatus {
  open,
  urgent,
  approved,
}

enum WorkOrderIconType {
  wrench,
  warning,
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
      width: 42.w,
      height: 42.w,
      decoration: BoxDecoration(
        color: const Color(0xFFE9F1FE),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: item.iconType == WorkOrderIconType.warning
            ? Icon(
                Icons.warning_amber_rounded,
                size: 22.w,
                color: AppColors.primaryBlue,
              )
            : Icon(
                Icons.build_outlined,
                size: 20.w,
                color: AppColors.primaryBlue,
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
