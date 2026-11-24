import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class UpdatePasswordButton extends StatelessWidget {
  final VoidCallback onPressed;

  const UpdatePasswordButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBlue,
          borderRadius: BorderRadius.circular(28.r),
        ),
        child: Center(
          child: Text(
            context.getString('update_password_button'),
            style: AppTypography.signInButton,
          ),
        ),
      ),
    );
  }
}