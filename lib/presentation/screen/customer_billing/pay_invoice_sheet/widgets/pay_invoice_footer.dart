import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../util/app_colors.dart';
import '../../../../../../util/app_typography.dart';

class PayInvoiceFooter extends StatelessWidget {
  final bool saveCard;
  final ValueChanged<bool?> onSaveCardChanged;
  final String totalAmount;

  const PayInvoiceFooter({
    super.key,
    required this.saveCard,
    required this.onSaveCardChanged,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Save Card Checkbox
        GestureDetector(
          onTap: () => onSaveCardChanged(!saveCard),
          child: Row(
            children: [
              SizedBox(
                width: 22.w,
                height: 22.w,
                child: Checkbox(
                  value: saveCard,
                  onChanged: onSaveCardChanged,
                  activeColor: AppColors.profileActive,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.r)),
                  side: const BorderSide(color: AppColors.dividerColor),
                ),
              ),
              12.horizontalSpace,
              Text(
                context.getString('save_card_future'),
                style: AppTypography.cardTitle,
              ),
            ],
          ),
        ),
        8.verticalSpace,

        // Pay Button
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: () {
              // --> Handle Pay Button Press
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
              elevation: 0,
            ),
            child: Text(
              context.getString('pay_total', {'amount': totalAmount}),
              style: AppTypography.signInButton,
            ),
          ),
        ),
        8.verticalSpace,

        // Detailed Disclaimer
        Text(
          context.getString('fee_disclaimer_detailed', {'company': 'NSP Pool & Spa Services'}),
          textAlign: TextAlign.center,
          style: AppTypography.dayTitle,
        ),
      ],
    );
  }
}