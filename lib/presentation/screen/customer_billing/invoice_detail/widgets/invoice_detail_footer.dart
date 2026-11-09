import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import '../../../../service/navigation.dart';
import '../../pay_invoice_sheet/pay_invoice_sheet.dart';

class InvoiceDetailFooter extends StatelessWidget {
  final Map<String, dynamic> invoice;
  const InvoiceDetailFooter({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _showPaySheet(context, invoice);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            minimumSize: Size(double.infinity, 56.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
          ),
          child: Text(context.getString('pay_now'), style: AppTypography.signInButton),
        ),
        8.verticalSpace,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 1.w,),
          decoration: BoxDecoration(
            color: AppColors.otherWaysToPayBg,
            border: Border.all(
              color: AppColors.black,
              width: 2,
            ),
          ),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.howToPay, arguments: invoice),
            child: Text(
              context.getString('other_ways_to_pay'),
              style: AppTypography.otherWaysToPay,
            ),
          ),
        ),
        8.verticalSpace,
        Text(
          context.getString('payment_link_info'),
          style: AppTypography.dayTitle,
        ),
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