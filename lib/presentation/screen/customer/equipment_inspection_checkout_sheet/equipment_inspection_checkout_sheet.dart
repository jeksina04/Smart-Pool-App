import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/app_colors.dart';
import 'widgets/checkout_fee_disclaimer.dart';
import 'widgets/checkout_pay_button.dart';
import 'widgets/checkout_payment_info_banner.dart';
import 'widgets/checkout_payment_method_card.dart';
import 'widgets/checkout_price_breakdown_card.dart';
import 'widgets/checkout_price_summary.dart';
import 'widgets/checkout_sheet_header.dart';

class EquipmentInspectionCheckoutSheet extends StatefulWidget {
  final String serviceTitle;
  final double basePrice;
  final double salesTaxRate;
  final double cardFeeRate;
  final String companyName;

  const EquipmentInspectionCheckoutSheet({
    super.key,
    this.serviceTitle = 'Equipment inspection',
    this.basePrice = 85.00,
    this.salesTaxRate = 8.25,
    this.cardFeeRate = 2.99,
    this.companyName = 'NSP Pool & Spa Services',
  });

  @override
  State<EquipmentInspectionCheckoutSheet> createState() =>
      _EquipmentInspectionCheckoutSheetState();
}

class _EquipmentInspectionCheckoutSheetState
    extends State<EquipmentInspectionCheckoutSheet> {
  double get _salesTaxAmount => double.parse(
      (widget.basePrice * (widget.salesTaxRate / 100)).toStringAsFixed(2));

  double get _subtotalWithTax => widget.basePrice + _salesTaxAmount;

  double get _cardFeeAmount => double.parse(
      (_subtotalWithTax * (widget.cardFeeRate / 100)).toStringAsFixed(2));

  double get _totalCharged => _subtotalWithTax + _cardFeeAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          boxShadow: [
            BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 40,
                offset: Offset(0, 16))
          ]),
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            8.verticalSpace,

            /// Header Drag Handle & Title Row
            CheckoutSheetHeader(
              onClose: () => Navigator.pop(context),
            ),
            16.verticalSpace,

            /// Scrollable Body
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Price Breakdown Card
                    CheckoutPriceBreakdownCard(
                      serviceTitle: widget.serviceTitle,
                      basePrice: widget.basePrice,
                      salesTaxRate: widget.salesTaxRate,
                      salesTaxAmount: _salesTaxAmount,
                    ),
                    8.verticalSpace,

                    /// Summary Rows
                    CheckoutPriceSummary(
                      subtotalWithTax: _subtotalWithTax,
                      cardFeeRate: widget.cardFeeRate,
                      cardFeeAmount: _cardFeeAmount,
                      totalCharged: _totalCharged,
                    ),
                    8.verticalSpace,

                    /// Saved Payment Method Card
                    CheckoutPaymentMethodCard(
                      companyName: widget.companyName,
                    ),
                    8.verticalSpace,

                    /// Payment Recipient Banner
                    CheckoutPaymentInfoBanner(
                      companyName: widget.companyName,
                    ),
                    8.verticalSpace,

                    /// Fee Disclaimer
                    CheckoutFeeDisclaimer(
                      cardFeeRate: widget.cardFeeRate,
                    ),
                  ],
                ),
              ),
            ),

            /// Pay Button
            CheckoutPayButton(
              totalCharged: _totalCharged,
              onPayPressed: () {
                // --> Navigate to payment screen
              },
            ),
            8.verticalSpace,
          ],
        ),
      ),
    );
  }
}
