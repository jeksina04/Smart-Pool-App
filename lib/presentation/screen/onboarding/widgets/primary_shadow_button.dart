import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';

/// Custom primary action button with exact drop shadow box-shadow: 0px 2px 8px 0px #102A500F.
class PrimaryShadowButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const PrimaryShadowButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.nextButtonShadow,
            offset: Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(28.r),
          child: Center(
            child: Text(
              text,
              style: AppTypography.nextButton,
            ),
          ),
        ),
      ),
    );
  }
}
