import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';

/// Reusable shadow text field with top label, leading SVG icon, and optional trailing widget.
class CustomShadowTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final String iconAsset;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? trailing;
  final TextInputType keyboardType;

  const CustomShadowTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.iconAsset,
    required this.controller,
    this.obscureText = false,
    this.trailing,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.inputLabel,
        ),
        8.verticalSpace,
        Container(
          width: double.infinity,
          height: 48.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(26.r),
            boxShadow: const [
              BoxShadow(
                color: AppColors.cardShadow,
                offset: Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 0,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              SvgPicture.asset(
                iconAsset,
                width: 20.w,
                height: 20.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.textGrey,
                  BlendMode.srcIn,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  cursorColor: AppColors.primaryBlue,
                  style: AppTypography.inputText,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    hintText: hintText,
                    hintStyle: AppTypography.inputHint,
                  ),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ],
    );
  }
}
