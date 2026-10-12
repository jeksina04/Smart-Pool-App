import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class NotificationItemTile extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback? onTap;

  const NotificationItemTile({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    final bool isRead = data['isRead'] ?? true;

    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      leading: Container(
        width: 40.w,
        height: 40.w,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: isRead
              ? AppColors.infoBannerBg
              : AppColors.readNotificationIconBg,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: SvgPicture.asset(
          _getIconPath(data['type']),
          colorFilter: ColorFilter.mode(
            isRead
                ? AppColors.primaryBlue
                : AppColors.readNotificationIconColor,
            BlendMode.srcIn,),
        ),
      ),
      title: Text(
        data['title'],
        style: AppTypography.sectionHeader.copyWith(
          fontWeight: isRead ? FontWeight.w500 : null,
        ),
      ),
      subtitle: Text(
        data['subtitle'],
        style: AppTypography.infoLabel,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            data['time'],
            style: AppTypography.dayTitle,
          ),
          8.horizontalSpace,
          isRead
              ? SvgPicture.asset(AppAssets.icChevronRight,)
              : Container(
            width: 8.w,
            height: 8.w,
            decoration: const BoxDecoration(
              color: AppColors.primaryBlue,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }

  String _getIconPath(String? type) {
    switch (type) {
      case 'alert': return AppAssets.icAlert;
      case 'invite': return AppAssets.icShoppingBag;
      case 'quote': return AppAssets.icDocument;
      case 'checkin': return AppAssets.icCheck;
      case 'payment': return AppAssets.icCreditCard;
      case 'calendar': return AppAssets.icCalendar;
      case 'message': return AppAssets.icDocument;
      default: return AppAssets.icBell;
    }
  }
}