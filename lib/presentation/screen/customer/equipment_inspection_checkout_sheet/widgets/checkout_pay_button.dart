import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class CheckoutPayButton extends StatelessWidget {
  final double totalCharged;
  final VoidCallback onPayPressed;

  const CheckoutPayButton({
    super.key,
    required this.totalCharged,
    required this.onPayPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: onPayPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.r),
          ),
          elevation: 0,
        ),
        child: Text(
          context.getString('pay', {'price': "\$${totalCharged.toStringAsFixed(2)}"}),
          style: AppTypography.signInButton,
        ),
      ),
    );
  }
}