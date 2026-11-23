import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class EquipmentInspectionBottomAction extends StatelessWidget {
  final String priceFormatted;
  final VoidCallback onBuyPressed;

  const EquipmentInspectionBottomAction({
    super.key,
    required this.priceFormatted,
    required this.onBuyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: onBuyPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.r),
              ),
              elevation: 0,
            ),
            child: Text(
              context.getString('buy_now', {'price': priceFormatted}),
              style: AppTypography.signInButton,
            ),
          ),
        ),
        8.verticalSpace,
        Text(
          context.getString('cancellation_notice'),
          style: AppTypography.dayTitle,
        ),
      ],
    );
  }
}