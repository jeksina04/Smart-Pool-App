import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import 'widgets/pay_invoice_header.dart';
import 'widgets/pay_invoice_methods_list.dart';
import 'widgets/pay_invoice_summary.dart';
import 'widgets/pay_invoice_footer.dart';

class PayInvoiceSheet extends StatefulWidget {
  final Map<String, dynamic> invoice;

  const PayInvoiceSheet({super.key, required this.invoice});

  @override
  State<PayInvoiceSheet> createState() => _PayInvoiceSheetState();
}

class _PayInvoiceSheetState extends State<PayInvoiceSheet> {
  int _selectedMethodIndex = 0;
  bool _saveCard = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 0),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle Bar
            Container(
              width: 36.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.dividerColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            8.verticalSpace,
            PayInvoiceHeader(invoiceId: widget.invoice['id'] ?? ''),
            8.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PayInvoiceMethodsList(
                      selectedIndex: _selectedMethodIndex,
                      onChanged: (index) => setState(() => _selectedMethodIndex = index),
                    ),
                    8.verticalSpace,
                    PayInvoiceSummary(
                      invoiceId: widget.invoice['id'] ?? '',
                      amount: widget.invoice['amount'] ?? '',
                      fee_added: _selectedMethodIndex == 0 ? "\$4.62" : (_selectedMethodIndex == 1 ? "\$1.54" : "\$0.00"),
                      total: _selectedMethodIndex == 0 ? "\$159.11" : (_selectedMethodIndex == 1 ? "\$156.03" : widget.invoice['amount']),
                    ),
                  ],
                ),
              ),
            ),
            8.verticalSpace,
            PayInvoiceFooter(
              saveCard: _saveCard,
              onSaveCardChanged: (val) => setState(() => _saveCard = val!),
              totalAmount: _selectedMethodIndex == 0 ? "\$159.11" : (_selectedMethodIndex == 1 ? "\$156.03" : widget.invoice['amount']),
            ),
            8.verticalSpace,
          ],
        ),
      ),
    );
  }
}