import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';

import 'package:flutter_skeleton/presentation/service/navigation.dart';

import 'widgets/service_history_header_bar.dart';
import 'widgets/service_history_item_row.dart';
import 'widgets/service_history_tab_selector.dart';

/// Screen: "Service history" for a customer
class ServiceHistoryScreen extends StatefulWidget {
  final String customerName;

  const ServiceHistoryScreen({
    super.key,
    this.customerName = 'A. Keys',
  });

  @override
  State<ServiceHistoryScreen> createState() => _ServiceHistoryScreenState();
}

class _ServiceHistoryScreenState extends State<ServiceHistoryScreen> {
  int _selectedTab = 0; // 0 for Last 4, 1 for All time

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

  final List<ServiceHistoryItemModel> _allTimeHistory = const [
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
    ServiceHistoryItemModel(
      dateAndTechnician: '30 Jun · Ray',
      details: '7/7 tasks · FC 2.9 · pH 7.4',
    ),
    ServiceHistoryItemModel(
      dateAndTechnician: '23 Jun · Dan',
      details: '7/7 tasks · FC 2.5 · pH 7.5',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final activeList = _selectedTab == 0 ? _last4History : _allTimeHistory;

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
                  children: [
                    /// Segmented Tab: Last 4 | All time
                    ServiceHistoryTabSelector(
                      selectedIndex: _selectedTab,
                      onTabChanged: (index) {
                        setState(() => _selectedTab = index);
                      },
                    ),
                    20.verticalSpace,

                    /// History list card
                    Container(
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
                        children: List.generate(activeList.length, (index) {
                          final item = activeList[index];
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
                              if (index != activeList.length - 1)
                                const Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Color(0xFFF0F3F6),
                                ),
                            ],
                          );
                        }),
                      ),
                    ),
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
}
