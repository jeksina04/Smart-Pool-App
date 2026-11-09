import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../util/app_assets.dart';
import '../../../../../../util/app_colors.dart';
import '../../../../../../util/app_typography.dart';

class PayInvoiceMethodsList extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onChanged;

  const PayInvoiceMethodsList({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8.r,
                offset: Offset(0, 2))
          ]),
      child: Column(
        children: [
          // --> Replace with actual data
          _buildMethod(0, AppAssets.icCreditCard, "Visa •••• 6411",
              context.getString('card_fee_desc', {'fee': '2.99'}), "+\$4.62"),
          const Divider(height: 1, color: AppColors.dividerColor),
          _buildMethod(1, AppAssets.icTransfer, context.getString('bank_transfer_ach'),
              context.getString('cheapest_way_desc', {'fee': '1'}), "+\$1.54"),
          const Divider(height: 1, color: AppColors.dividerColor,),
          _buildMethod(2, AppAssets.icAdd, context.getString('new_card'),
              context.getString('fee_added', {'fee': '2.99%'}), null),
        ],
      ),
    );
  }

  Widget _buildMethod(int index, String asset, String title, String sub, String? extraPrice) {
    bool isSelected = selectedIndex == index;
    return InkWell(
      onTap: () => onChanged(index),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  color: AppColors.recurringQuoteBg,
                  borderRadius: BorderRadius.circular(12.r)),
              child: SizedBox(
                height: 20.w,
                width: 20.w,
                child: SvgPicture.asset(asset,
                    colorFilter: const ColorFilter.mode(
                        AppColors.primaryBlue, BlendMode.srcIn)),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTypography.sectionHeader),
                  Text(sub, style: AppTypography.cardTitle),
                ],
              ),
            ),
            if (extraPrice != null) ...[
              Text(extraPrice, style: AppTypography.skipButton),
              8.horizontalSpace,
            ],
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? AppColors.primaryBlue : AppColors.dividerColor,
            ),
          ],
        ),
      ),
    );
  }
}