import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';

/// Custom primary action button with exact drop shadow box-shadow: 0px 2px 8px 0px #102A500F.
class PrimaryShadowButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? height;

  const PrimaryShadowButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? 44.h;
    return Container(
      width: double.infinity,
      height: buttonHeight,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(buttonHeight / 2),
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
          borderRadius: BorderRadius.circular(buttonHeight / 2),
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
