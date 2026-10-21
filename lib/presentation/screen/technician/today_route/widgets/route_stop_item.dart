import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

enum StopType {
  routine,
  repair,
  serviceCall,
}

enum StopStatus {
  done,
  next,
  pending,
}

class StopItemModel {
  final int stopNumber;
  final String customerName;
  final StopType type;
  final String time;
  final String distance;
  final StopStatus status;

  const StopItemModel({
    required this.stopNumber,
    required this.customerName,
    required this.type,
    required this.time,
    required this.distance,
    this.status = StopStatus.pending,
  });
}

/// A single stop card in the route list
class RouteStopItem extends StatelessWidget {
  final StopItemModel stop;
  final VoidCallback? onTap;

  const RouteStopItem({
    super.key,
    required this.stop,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            /// Stop Number Box
            _buildNumberBox(),
            14.horizontalSpace,

            /// Customer Name + Tag & Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    stop.customerName,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkNavy,
                    ),
                  ),
                  4.verticalSpace,
                  Row(
                    children: [
                      _buildTypeTag(),
                      8.horizontalSpace,
                      Text(
                        '${stop.time} · ${stop.distance}',
                        style: TextStyle(
                          fontFamily: AppTypography.poppinsFont,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// Status badge (Done, Next) or empty space
            if (stop.status == StopStatus.done) ...[
              _buildStatusPill(
                text: 'Done',
                bgColor: const Color(0xFFE6F7EF),
                textColor: const Color(0xFF157A4C),
              ),
              8.horizontalSpace,
            ] else if (stop.status == StopStatus.next) ...[
              _buildStatusPill(
                text: 'Next',
                bgColor: const Color(0xFFE8F1FE),
                textColor: AppColors.primaryBlue,
              ),
              8.horizontalSpace,
            ],

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

  Widget _buildNumberBox() {
    Color bgColor;
    Color textColor;

    switch (stop.status) {
      case StopStatus.done:
        bgColor = const Color(0xFFE2F6EC);
        textColor = const Color(0xFF0F7645);
        break;
      case StopStatus.next:
        bgColor = const Color(0xFFDEEBFE);
        textColor = AppColors.primaryBlue;
        break;
      case StopStatus.pending:
      default:
        bgColor = const Color(0xFFF1F4F8);
        textColor = AppColors.darkNavy;
        break;
    }

    return Container(
      width: 42.w,
      height: 42.w,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      alignment: Alignment.center,
      child: Text(
        '${stop.stopNumber}',
        style: TextStyle(
          fontFamily: AppTypography.poppinsFont,
          fontSize: 16.sp,
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildTypeTag() {
    String label;
    Color bgColor;
    Color textColor;

    switch (stop.type) {
      case StopType.routine:
        label = 'Routine';
        bgColor = const Color(0xFFEDF2F7);
        textColor = const Color(0xFF4A5568);
        break;
      case StopType.repair:
        label = 'Repair';
        bgColor = const Color(0xFFEBF3FE);
        textColor = const Color(0xFF1E64D4);
        break;
      case StopType.serviceCall:
        label = 'Service call';
        bgColor = const Color(0xFFFEF3E2);
        textColor = const Color(0xFFB57008);
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: AppTypography.poppinsFont,
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildStatusPill({
    required String text,
    required Color bgColor,
    required Color textColor,
  }) {
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
