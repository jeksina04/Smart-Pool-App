import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

class ServiceHistoryItemModel {
  final String dateAndTechnician;
  final String details; // e.g. "7/7 tasks · FC 3.0 · pH 7.4"

  const ServiceHistoryItemModel({
    required this.dateAndTechnician,
    required this.details,
  });
}

/// A row item in the Service History card
class ServiceHistoryItemRow extends StatelessWidget {
  final ServiceHistoryItemModel item;
  final VoidCallback? onTap;

  const ServiceHistoryItemRow({
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
            /// Soft blue rounded container with blue checkmark
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: const Color(0xFFE9F1FE),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Icon(
                  Icons.check_rounded,
                  size: 20.w,
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
            14.horizontalSpace,

            /// Date & Tech name + Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.dateAndTechnician,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkNavy,
                    ),
                  ),
                  3.verticalSpace,
                  Text(
                    item.details,
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
}
