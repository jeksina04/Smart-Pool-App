import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';

import 'package:flutter_skeleton/presentation/service/navigation.dart';

import '../../../../util/app_typography.dart';
import 'widgets/service_history_header_bar.dart';
import 'widgets/service_history_item_row.dart';
import 'widgets/service_history_tab_selector.dart';

/// Screen: "Service history" for a customer
class ServiceHistoryScreen extends StatefulWidget {
  final String customerName;
  final int initialTab;

  const ServiceHistoryScreen({
    super.key,
    this.customerName = 'A. Keys',
    this.initialTab = 0,
  });

  @override
  State<ServiceHistoryScreen> createState() => _ServiceHistoryScreenState();
}

class _ServiceHistoryScreenState extends State<ServiceHistoryScreen> {
  late int _selectedTab; // 0 for Last 4, 1 for All time

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTab;
  }

  final List<ServiceHistoryItemModel> _last4History = const [
    ServiceHistoryItemModel(
      dateAndTechnician: '28 Jul · Ray',
      details: '7/7 tasks · FC 3.0 · pH 7.4',
    ),
    ServiceHistoryItemModel(
      dateAndTechnician: '21 Jul · Ray',
      details: '7/7 tasks · FC 2.8 · pH 7.5',
    ),
    ServiceHistoryItemModel(
      dateAndTechnician: '14 Jul · Dan',
      details: '6/7 tasks · FC 1.9 · pH 7.8',
    ),
    ServiceHistoryItemModel(
      dateAndTechnician: '07 Jul · Ray',
      details: '7/7 tasks · FC 3.1 · pH 7.3',
    ),
  ];

  /// Monthly grouped service history for "All time" view
  final List<Map<String, dynamic>> _allTimeGrouped = const [
    {
      'month': 'July 2026',
      'items': [
        ServiceHistoryItemModel(
          dateAndTechnician: '28 Jul · Ray',
          details: '7/7 tasks · FC 3.0 · pH 7.4',
        ),
        ServiceHistoryItemModel(
          dateAndTechnician: '21 Jul · Ray',
          details: '7/7 tasks · FC 2.8 · pH 7.5',
        ),
        ServiceHistoryItemModel(
          dateAndTechnician: '14 Jul · Dan',
          details: '6/7 tasks · FC 1.9 · pH 7.8',
        ),
        ServiceHistoryItemModel(
          dateAndTechnician: '07 Jul · Ray',
          details: '7/7 tasks · FC 3.1 · pH 7.3',
        ),
      ],
    },
    {
      'month': 'June 2026',
      'items': [
        ServiceHistoryItemModel(
          dateAndTechnician: '30 Jun · Ray',
          details: '7/7 tasks · FC 2.9 · pH 7.4',
        ),
        ServiceHistoryItemModel(
          dateAndTechnician: '23 Jun · Ray',
          details: '7/7 tasks · FC 3.2 · pH 7.5',
        ),
        ServiceHistoryItemModel(
          dateAndTechnician: '16 Jun · Ray',
          details: '7/7 tasks · FC 2.7 · pH 7.6',
        ),
      ],
    },
    {
      'month': 'May 2026',
      'items': [
        ServiceHistoryItemModel(
          dateAndTechnician: '26 May · Dan',
          details: '7/7 tasks · FC 3.0 · pH 7.4',
        ),
        ServiceHistoryItemModel(
          dateAndTechnician: '19 May · Ray',
          details: '7/7 tasks · FC 3.3 · pH 7.3',
        ),
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            /// Header Bar with circular back button and title
            ServiceHistoryHeaderBar(
              title: 'History · ${widget.customerName}',
              onBack: () => Navigator.of(context).maybePop(),
            ),

            /// Scrollable content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Segmented Tab: Last 4 | All time
                    ServiceHistoryTabSelector(
                      selectedIndex: _selectedTab,
                      onTabChanged: (index) {
                        setState(() => _selectedTab = index);
                      },
                    ),
                    20.verticalSpace,

                    if (_selectedTab == 0)
                      _buildItemsCard(_last4History)
                    else
                      ..._buildAllTimeSections(),

                    24.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAllTimeSections() {
    final widgets = <Widget>[];
    for (int i = 0; i < _allTimeGrouped.length; i++) {
      final group = _allTimeGrouped[i];
      final month = group['month'] as String;
      final items = group['items'] as List<ServiceHistoryItemModel>;

      widgets.add(
        Padding(
          padding: EdgeInsets.only(bottom: 12.h, top: i == 0 ? 0 : 20.h),
          child: Text(
            month,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),
        ),
      );
      widgets.add(_buildItemsCard(items));
    }
    return widgets;
  }

  Widget _buildItemsCard(List<ServiceHistoryItemModel> items) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08102A50),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Column(
            children: [
              ServiceHistoryItemRow(
                item: item,
                onTap: () {
                  Navigator.of(context).pushNamed(
                    Routes.techVisitDetail,
                    arguments: {
                      'visitDate': item.dateAndTechnician.split('·').first.trim(),
                      'technicianName': item.dateAndTechnician.split('·').length > 1
                          ? '${item.dateAndTechnician.split('·').last.trim()} Delgado'
                          : 'Ray Delgado',
                    },
                  );
                },
              ),
              if (index != items.length - 1)
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xFFF0F3F6),
                ),
            ],
          );
        }),
      ),
    );
  }
}
