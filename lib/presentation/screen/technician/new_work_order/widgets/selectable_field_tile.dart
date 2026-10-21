import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Selectable field tile with label and trailing chevron (Customer, Type of work)
class SelectableFieldTile extends StatelessWidget {
  final String label;
  final String? value;
  final String? placeholder;
  final VoidCallback? onTap;

  const SelectableFieldTile({
    super.key,
    required this.label,
    this.value,
    this.placeholder,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.darkNavy,
          ),
        ),
        8.verticalSpace,
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20.r),
          child: Container(
            width: double.infinity,
            height: 54.h,
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(22.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x08102A50),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    value ?? placeholder ?? '',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 14.sp,
                      fontWeight: value != null ? FontWeight.w600 : FontWeight.w400,
                      color: value != null ? AppColors.darkNavy : AppColors.textGrey,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 22.w,
                  color: const Color(0xFF9AA5B5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
