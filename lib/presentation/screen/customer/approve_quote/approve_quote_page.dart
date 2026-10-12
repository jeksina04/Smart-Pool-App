import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/approve_quote/widgets/approve_quote_action_buttons.dart';
import 'package:flutter_skeleton/presentation/screen/customer/approve_quote/widgets/approve_quote_info_banner.dart';
import 'package:flutter_skeleton/presentation/screen/customer/approve_quote/widgets/approve_quote_price_card.dart';
import 'package:flutter_skeleton/presentation/screen/customer/approve_quote/widgets/approve_quote_summary_card.dart';
import 'package:flutter_skeleton/presentation/screen/customer/approve_quote/widgets/approve_quote_tab_selector.dart';
import 'package:flutter_skeleton/presentation/screen/customer/approve_quote/widgets/approve_quote_task_card.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';

class ApproveQuotePage extends StatefulWidget {
  const ApproveQuotePage({super.key});

  @override
  State<ApproveQuotePage> createState() => _ApproveQuotePageState();
}

class _ApproveQuotePageState extends State<ApproveQuotePage> {
  int _selectedTabIndex = 1; // Default to "Green pool recovery" based on your image

  // --> Replace with actual quotes data
  final List<Map<String, dynamic>> _quotes = [
    {
      'id': '#1026',
      'title': 'Weekly pool service',
      'company': 'NSP Pool & Spa Services',
      'validUntil': '25 Sep 2026',
      'tasks': [
        'Full 10-point service, every week',
        'Water tested and balanced each visit',
        'Baskets, filter and equipment checked',
        'Photo record of every visit in this app',
      ],
      'prices': [
        {'label': 'Service per visit', 'value': '\$75.00'},
        {'label': 'Chemicals per visit', 'value': '\$10.00'},
        {'label': 'Sales tax (parts only)', 'value': '\$0.83'},
      ],
      'total': '\$85.83',
      'isRecurring': true,
      'recurringDetail': 'Every week, on Tuesdays',
      'annualTotal': '\$4,463.16',
      'disclaimer': 'Billed monthly. You can pause or cancel with 30 days’ notice — you are not locked in for the year.',
      'infoBanner': 'Nothing is charged now. Your first invoice comes after your first visit.',
    },
    {
      'id': '#1025',
      'title': 'Green pool recovery',
      'company': 'NSP Pool & Spa Services',
      'validUntil': '30 Aug 2026',
      'tasks': [
        'Shock treatment over three visits',
        'Filter cleaned between each',
        'Vacuum to waste, brush walls and steps',
        'Water re-tested until clear',
      ],
      'prices': [
        {'label': 'Labour — 3 visits', 'value': '\$210.00'},
        {'label': 'Chemicals', 'value': '\$78.00'},
        {'label': 'Sales tax (8.25%)', 'value': '\$23.76'},
      ],
      'total': '\$311.76',
      'isRecurring': false,
      'infoBanner': 'Nothing is charged now. NSP Pool & Spa Services bills you when the work is finished.',
    }
  ];

  @override
  Widget build(BuildContext context) {
    final quote = _quotes[_selectedTabIndex];

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
                        padding: EdgeInsets.all(10.w),
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(AppAssets.icBack),
                      ),
                    ),
                  ),
                  Text(context.getString('your_quote_title'), style: AppTypography.sectionHeader),
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
                    // Tabs
                    ApproveQuoteTabSelector(
                      selectedIndex: _selectedTabIndex,
                      onTabChanged: (index) => setState(() => _selectedTabIndex = index),
                    ),

                    16.verticalSpace,
                    // Quote Summary Card
                    ApproveQuoteSummaryCard(quote: quote),

                    16.verticalSpace,
                    Text(context.getString('what_they_will_do'), style: AppTypography.quickActionsHeading),
                    16.verticalSpace,
                    // Tasks Card
                    ApproveQuoteTasksCard(tasks: quote['tasks']),

                    16.verticalSpace,
                    Text(context.getString('price_section_title'), style: AppTypography.quickActionsHeading),
                    16.verticalSpace,
                    // Price Card
                    ApproveQuotePriceCard(quote: quote),

                    if (!quote['isRecurring']) ...[
                      8.verticalSpace,
                      // Total Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(context.getString('total_label'), style: AppTypography.quickActionsHeading),
                          Text(quote['total'], style: AppTypography.totalPriceValue),
                        ],
                      ),
                    ],

                    8.verticalSpace,
                    // Info Banner
                    ApproveQuoteInfoBanner(text: quote['infoBanner']),

                    8.verticalSpace,
                    Text(context.getString('quote_fee_disclaimer'), style: AppTypography.disclaimerText),
                    16.verticalSpace,

                    // Approve Quote Action Buttons
                    ApproveQuoteActionButtons(
                      total: quote['total'],
                      isRecurring: quote['isRecurring'],
                      onApprove: () {},
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
}
