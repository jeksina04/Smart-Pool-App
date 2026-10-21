import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

class ShoppingItemModel {
  final String id;
  final String title;
  final String price;
  final bool isInstalled;

  const ShoppingItemModel({
    required this.id,
    required this.title,
    required this.price,
    this.isInstalled = false,
  });

  ShoppingItemModel copyWith({bool? isInstalled}) {
    return ShoppingItemModel(
      id: id,
      title: title,
      price: price,
      isInstalled: isInstalled ?? this.isInstalled,
    );
  }
}

/// A row item in the shopping list / items needed card with custom rounded checkbox
class ShoppingItemRow extends StatelessWidget {
  final ShoppingItemModel item;
  final ValueChanged<bool> onToggle;

  const ShoppingItemRow({
    super.key,
    required this.item,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onToggle(!item.isInstalled),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Rounded custom Checkbox
            Container(
              width: 26.w,
              height: 26.w,
              decoration: BoxDecoration(
                color: item.isInstalled ? const Color(0xFF10B981) : AppColors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: item.isInstalled ? const Color(0xFF10B981) : const Color(0xFFCBD5E1),
                  width: 1.8,
                ),
              ),
              child: item.isInstalled
                  ? Icon(
                      Icons.check_rounded,
                      size: 18.w,
                      color: AppColors.white,
                    )
                  : null,
            ),
            14.horizontalSpace,

            /// Item Title & Status Subtitle
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
                    item.isInstalled ? 'Installed — billed' : 'Not yet installed',
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

            /// Price
            Text(
              item.price,
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.darkNavy,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
