import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import 'widgets/invoice_footer.dart';
import 'widgets/invoice_list.dart';
import 'widgets/invoice_tab_selector.dart';

class InvoicesPage extends StatefulWidget {
  const InvoicesPage({super.key});

  @override
  State<InvoicesPage> createState() => _InvoicesPageState();
}

class _InvoicesPageState extends State<InvoicesPage> {
  int _selectedTabIndex = 0; // 0 for Due, 1 for Paid

  // --> Replace with actual data
  final List<Map<String, dynamic>> _dueInvoices = [
    {
      "id": "#3431",
      "month": "August",
      "desc": "Weekly cleaning \$135 + salt \$18",
      "amount": "\$154.49",
      "isDue": true
    }
  ];

  final List<Map<String, dynamic>> _paidInvoices = [
    {
      "id": "#3406",
      "month": "July",
      "desc": "Paid 2 Jul",
      "amount": "\$135",
      "isDue": false
    },
    {
      "id": "#3379",
      "month": "June",
      "desc": "Paid 2 Jun",
      "amount": "\$135",
      "isDue": false
    }
  ];

  @override
  Widget build(BuildContext context) {
    final currentInvoices = _selectedTabIndex == 0 ? _dueInvoices : _paidInvoices;

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

                    // Invoice List
                    InvoiceList(items: currentInvoices),
                    16.verticalSpace,

                    // Footer
                    if (_selectedTabIndex == 0)
                      InvoiceFooter(
                          totalDue: _dueAmount,
                          invoice: _dueInvoices.first
                      ),
                    16.verticalSpace,
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