import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/history/widgets/history_filter_tabs.dart';
import 'package:flutter_skeleton/presentation/screen/customer/history/widgets/history_section.dart';
import 'package:flutter_skeleton/util/app_typography.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int _selectedFilterIndex = 0;

  // --> Replace with actual data
  /// Raw data list representing the history sections and items
  final List<Map<String, dynamic>> _allData = [
    {
      'header': "NSP Pool & Spa Services · current",
      'items': [
        {
          'date': "28 Jul 2026",
          'desc': "Ray · 7 tasks · 4 photos",
          'isRepair': false
        },
        {
          'date': "21 Jul 2026",
          'desc': "Ray · 7 tasks · 2 photos",
          'isRepair': false
        },
        {
          'date': "14 Jul 2026",
          'desc': "Dan · 7 tasks · 3 photos",
          'isRepair': false
        },
        {
          'date': "30 Jun 2026",
          'desc': "Filter replacement · work order",
          'isRepair': true
        },
      ],
    },
    {
      'header': "Blue Wave Pools · until Feb 2026",
      'items': [
        {
          'date': "05 Feb 2026",
          'desc': "Marco · 6 tasks · 2 photos",
          'isRepair': false
        },
        {'date': "29 Jan 2026", 'desc': "Marco · 6 tasks", 'isRepair': false},
      ],
    },
  ];

  /// Getter that returns filtered data based on the active tab
  List<Map<String, dynamic>> get _filteredData {
    /// If "All" is selected, return the full list
    if (_selectedFilterIndex == 0) return _allData;

    return _allData
        .map((section) {
          final List<Map<String, dynamic>> items =
              List<Map<String, dynamic>>.from(section['items']);

          /// Filter items: cleans are items where isRepair is false, repairs are where isRepair is true
          final filteredItems = items.where((item) {
            final bool isRepair = item['isRepair'] ?? false;
            return _selectedFilterIndex == 1 ? !isRepair : isRepair;
          }).toList();

          return {
            'header': section['header'],
            'items': filteredItems,
          };
        })

        /// Remove sections that have no items after filtering
        .where((section) => (section['items'] as List).isNotEmpty)
        .toList();
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
            child: Text(
              context.getString('service_history_title'),
              style: AppTypography.sectionHeader,
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

                        HistoryFilterTabs(
                          selectedIndex: _selectedFilterIndex,
                          onChanged: (index) =>
                              setState(() => _selectedFilterIndex = index),
                        ),

                        16.verticalSpace,

                        /// Dynamically rendered history sections
                        ..._filteredData.map((section) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 24.h),
                            child: HistorySection(
                              header: section['header'],
                              items: section['items'],
                            ),
                          );
                        }).toList(),

                        Container(
                          padding: EdgeInsets.fromLTRB(10.w, 8.h, 0.w, 8.h),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.cardShadow,
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.icNavHistory,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.primaryBlue, BlendMode.srcIn),
                              ),
                              8.horizontalSpace,
                              Expanded(
                                child: Text(
                                  context.getString('previous_visits_info', {
                                    'company_name': 'NSP Pool & Spa Services'
                                  }),
                                  // --> Replace with actual company name,
                                  style: AppTypography.bannerNormalText
                                      .copyWith(fontSize: 12.5.sp),
                                ),
                              )
                            ],
                          ),
                        ),

                        16.verticalSpace
                      ])))
        ],
      )),
    );
  }
}
