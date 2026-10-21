import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

enum SyncItemBadgeType {
  queued,
  percentage,
  synced,
  retry,
}

enum SyncItemIconType {
  document,
  camera,
  cloud,
}

class SyncItemModel {
  final String title;
  final SyncItemIconType iconType;
  final SyncItemBadgeType? badgeType;
  final String? badgeText;
  final String? trailingText;

  const SyncItemModel({
    required this.title,
    required this.iconType,
    this.badgeType,
    this.badgeText,
    this.trailingText,
  });
}

/// A row inside the Sync Status list card
class SyncItemRow extends StatelessWidget {
  final SyncItemModel item;
  final VoidCallback? onTap;

  const SyncItemRow({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Soft blue square icon container
            _buildIcon(),
            14.horizontalSpace,

            /// Title
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkNavy,
                ),
              ),
            ),

            /// Right trailing element (Badge pill or Timestamp)
            if (item.badgeType != null)
              _buildBadge()
            else if (item.trailingText != null)
              Text(
                item.trailingText!,
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
    );
  }

  Widget _buildIcon() {
    IconData iconData;
    switch (item.iconType) {
      case SyncItemIconType.camera:
        iconData = Icons.camera_alt_outlined;
        break;
      case SyncItemIconType.cloud:
        iconData = Icons.cloud_outlined;
        break;
      case SyncItemIconType.document:
      default:
        iconData = Icons.article_outlined;
        break;
    }

    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: const Color(0xFFE9F1FE),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Icon(
          iconData,
          size: 20.w,
          color: AppColors.primaryBlue,
        ),
      ),
    );
  }

  Widget _buildBadge() {
    String text = item.badgeText ?? '';
    Color bgColor;
    Color textColor;

    switch (item.badgeType) {
      case SyncItemBadgeType.queued:
        text = text.isEmpty ? 'Queued' : text;
        bgColor = const Color(0xFFEFF2F6);
        textColor = const Color(0xFF6B7280);
        break;
      case SyncItemBadgeType.percentage:
        text = text.isEmpty ? '40%' : text;
        bgColor = const Color(0xFFE8F1FE);
        textColor = AppColors.primaryBlue;
        break;
      case SyncItemBadgeType.synced:
        text = text.isEmpty ? 'Synced' : text;
        bgColor = const Color(0xFFE6F7EF);
        textColor = const Color(0xFF157A4C);
        break;
      case SyncItemBadgeType.retry:
        text = text.isEmpty ? 'Retry' : text;
        bgColor = const Color(0xFFFFECEB);
        textColor = const Color(0xFFD32F2F);
        break;
      default:
        bgColor = const Color(0xFFEFF2F6);
        textColor = AppColors.darkNavy;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10.r),
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
