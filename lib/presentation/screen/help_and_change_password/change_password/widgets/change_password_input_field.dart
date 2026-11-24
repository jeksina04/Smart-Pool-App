import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class ChangePasswordInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final String iconAsset;
  final TextEditingController controller;
  final bool obscureText;
  final bool showEyeToggle;
  final VoidCallback? onToggleObscure;

  const ChangePasswordInputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.iconAsset,
    required this.controller,
    this.obscureText = true,
    this.showEyeToggle = false,
    this.onToggleObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.inputLabel,),
        8.verticalSpace,
        Container(
          width: double.infinity,
          height: 56.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: const [
              BoxShadow(
                color: AppColors.cardShadow,
                offset: Offset(0, 2),
                blurRadius: 8,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              SvgPicture.asset(
                iconAsset,
                colorFilter: const ColorFilter.mode(
                  AppColors.rateTechnicianStar,
                  BlendMode.srcIn,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: obscureText,
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
              if (showEyeToggle)
                GestureDetector(
                  onTap: onToggleObscure,
                  child: SvgPicture.asset(
                    obscureText
                        ? AppAssets.icVisibility
                        : AppAssets.icVisibilityOff,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}