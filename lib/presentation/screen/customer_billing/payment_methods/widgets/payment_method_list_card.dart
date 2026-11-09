import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import 'payment_method_tile.dart';

class PaymentMethodListCard extends StatelessWidget {
  const PaymentMethodListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          PaymentMethodTile(
            title: context.getString('bank_account', {'account': '•••• 4821'}),
            subtitle: context.getString('ach_no_fee'),
            isDefault: true,
            onTap: () {}, // --> Handle tap
          ),
          const Divider(height: 1, color: AppColors.cardBorder),
          PaymentMethodTile(
            title: context.getString('visa', {'visa_number': '•••• 6411'}),
            subtitle: context.getString('expires', {'date': '04/29'}),
            showChevron: true,
            onTap: () {}, // --> Handle tap
          ),
        ],
      ),
    );
  }
}