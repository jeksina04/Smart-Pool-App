import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import '../../../../service/navigation.dart';
import '../../pay_invoice_sheet/pay_invoice_sheet.dart';

class InvoiceFooter extends StatelessWidget {
  final String totalDue;
  final Map<String, dynamic> invoice;

  const InvoiceFooter({super.key, required this.totalDue, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          RichText(
            text: TextSpan(
              style: AppTypography.dividerText,
              children: [
                TextSpan(
                    text: context
                        .getString('payment_fee_notice')
                        .split('{cardFee}')[0]),
                const TextSpan(
                  text: "2.99%",
                  style: TextStyle(fontWeight: FontWeight.w700,),
                ),
                TextSpan(
                    text: context
                        .getString('payment_fee_notice')
                        .split('{cardFee}')[1]
                        .split('{bankFee}')[0]),
                const TextSpan(
                  text: "1%",
                  style: TextStyle(fontWeight: FontWeight.w700,),
                ),
                TextSpan(
                    text: context
                        .getString('payment_fee_notice')
                        .split('{bankFee}')[1]),
              ],
            ),
          ),
          16.verticalSpace,
          ElevatedButton(
            onPressed: () {
              _showPaySheet(context, invoice);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              minimumSize: Size(double.infinity, 56.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
              elevation: 0,
            ),
            child: Text(
              context.getString('pay_price_now', {'price': totalDue}),
              style: AppTypography.signInButton,
            ),
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, Routes.howToPay, arguments: invoice),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.w,),
                  decoration: BoxDecoration(
                    color: AppColors.otherWaysToPayBg,
                    border: Border.all(
                      color: AppColors.black,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    context.getString('other_ways_to_pay'),
                    style: AppTypography.otherWaysToPay,
                  ),
                ),
              ),
              Text(
                context.getString('cheque_cash_or_bank_transfer'),
                style: AppTypography.dividerText,
              ),
            ],
          ),
          16.verticalSpace,
        ],
    );
  }

  void _showPaySheet(BuildContext context, Map<String, dynamic> invoice) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.90,
          child: PayInvoiceSheet(invoice: invoice,),
        );
      },
    );
  }
}