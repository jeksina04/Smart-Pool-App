import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer_billing/invoices/widgets/invoice_paid_fee_disclaimer.dart';
import 'package:flutter_skeleton/presentation/screen/customer_billing/invoices/widgets/invoice_paid_list.dart';
import 'package:flutter_skeleton/presentation/screen/customer_billing/invoices/widgets/invoice_receipts_notice_card.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import 'widgets/invoice_footer.dart';
import 'widgets/invoice_list.dart';
import 'widgets/invoice_tab_selector.dart';

class InvoicesPage extends StatefulWidget {
  final int initialTabIndex;
  final List<Map<String, dynamic>>? dueInvoices;
  final List<Map<String, dynamic>>? paidInvoices;

  const InvoicesPage({
    super.key,
    this.initialTabIndex = 0,
    this.dueInvoices,
    this.paidInvoices,
  });

  @override
  State<InvoicesPage> createState() => _InvoicesPageState();
}

class _InvoicesPageState extends State<InvoicesPage> {
  late int _selectedTabIndex; // 0 for Due, 1 for Paid
  late List<Map<String, dynamic>> _dueInvoices;
  late List<Map<String, dynamic>> _paidInvoices;

  @override
  void initState() {
    super.initState();
    _selectedTabIndex = widget.initialTabIndex;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _dueInvoices = widget.dueInvoices ??
        [
          {
            "id": "#3431",
            "month": "August",
            "desc": "Weekly cleaning \$135 + salt \$18",
            "amount": "\$154.49",
            "isDue": true,
          }
        ];

    _paidInvoices = widget.paidInvoices ??
        [
          {
            "id": "#3406",
            "month": "July",
            "paidDate": "2 Jul",
            "paymentMethod": "Visa •••• 6411",
            "summary": "Weekly cleaning · \$135.00",
            "amount": "\$135",
            "isDue": false,
          },
          {
            "id": "#3379",
            "month": "June",
            "paidDate": "2 Jun",
            "paymentMethod": "Bank transfer (ACH)",
            "summary": "Weekly cleaning · \$135.00",
            "amount": "\$135",
            "isDue": false,
          },
        ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 36.w,
                        height: 36.w,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.icBack,
                            width: 20.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    context.getString('invoices_title'),
                    style: AppTypography.sectionHeader,
                  ),
                ],
              ),
            ),
            8.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    // Tab Selector
                    InvoiceTabSelector(
                      selectedIndex: _selectedTabIndex,
                      onTabChanged: (index) => setState(() => _selectedTabIndex = index),
                    ),
                    16.verticalSpace,

                    /// Active Tab View Content
                    if (_selectedTabIndex == 0) ...[
                      /// Due Tab Content
                      InvoiceList(items: _dueInvoices),
                      16.verticalSpace,
                      if (_dueInvoices.isNotEmpty)
                        InvoiceFooter(
                          totalDue: _dueAmount,
                          invoice: _dueInvoices.first,
                        ),
                    ] else ...[
                      /// Paid Tab Content (CA17b)
                      InvoicePaidList(items: _paidInvoices),
                      8.verticalSpace,

                      /// Payment Fee Disclaimer
                      const InvoicePaidFeeDisclaimer(),
                      8.verticalSpace,

                      /// Receipts Notice Card
                      const InvoiceReceiptsNoticeCard(),
                      8.verticalSpace,
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Calculate the total due dynamically from the list
  String get _dueAmount {
    double total = 0.0;
    for (var invoice in _dueInvoices) {
      // Remove '$' and parse to double
      final amountValue = invoice['amount']
          .toString()
          .replaceAll('\$', '')
          .replaceAll(',', '');
      total += double.tryParse(amountValue) ?? 0.0;
    }
    // Return formatted string with currency symbol
    return "\$${total.toStringAsFixed(2)}";
  }
}