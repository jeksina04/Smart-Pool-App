import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class CheckoutPriceBreakdownCard extends StatelessWidget {
  final String serviceTitle;
  final double basePrice;
  final double salesTaxRate;
  final double salesTaxAmount;

  const CheckoutPriceBreakdownCard({
    super.key,
    required this.serviceTitle,
    required this.basePrice,
    required this.salesTaxRate,
    required this.salesTaxAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h,),
            title: Text(serviceTitle, style: AppTypography.sectionHeader),
            trailing: Text(
              "\$${basePrice.toStringAsFixed(2)}",
              style: AppTypography.infoLabel,
            ),
          ),
          const Divider(
            height: 1,
            color: AppColors.dividerColor,
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h,),
            title: Text(
              context.getString('sales_tax', {'tax': "${salesTaxRate.toStringAsFixed(2)}%"}),
              style: AppTypography.sectionHeader,
            ),
            trailing: Text(
              "\$${salesTaxAmount.toStringAsFixed(2)}",
              style: AppTypography.infoLabel,
            ),
          ),
        ],
      ),
    );
  }
}