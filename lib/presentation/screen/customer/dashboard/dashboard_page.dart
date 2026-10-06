import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/dashboard/widgets/greeting_weather_section.dart';
import 'package:flutter_skeleton/presentation/screen/customer/dashboard/widgets/pool_service_company_card.dart';

import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import '../../../service/navigation.dart';
import '../history/history_page.dart';
import '../profile/profile_page.dart';
import '../services/services_page.dart';
import 'widgets/custom_bottom_nav.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/quick_actions_grid.dart';
import 'widgets/upcoming_service_card.dart';
import 'widgets/water_metrics_section.dart';

/// Main Dashboard screen for Customers
class DashboardPage extends StatefulWidget {
  final int initialIndex;
  const DashboardPage({super.key, this.initialIndex = 0});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  /// Current index for bottom navigation
  late int _currentIndex;

  // --> Replace with actual data for pHData & ChlorineData
  final List<double> _phData = [7.0, 7.3, 7.15, 7.5, 7.35, 7.0, 6.9, 7.1,];
  final List<double> _chlorineData = [1.2, 1.0, 1.5, 1.8, 1.4, 1.3, 1.6, 1.4,];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: _getTabContent(_currentIndex),

      /// Tab navigation at the bottom.
      /// The onTap callback updates the _currentIndex and triggers a UI rebuild via setState.
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }

  Widget _buildDashboardHome() {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
          child: const DashboardHeader(),
        ),
        8.verticalSpace,
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,

                /// User Greeting and Weather header
                const GreetingAndWeatherSection(),

                16.verticalSpace,

                /// Water quality and pH/Chlorine metrics
                WaterMetricsSection(
                  phData: _phData,
                  chlorineData: _chlorineData,
                ),

                16.verticalSpace,

                /// Quick Actions section title
                Text(
                  context.getString('quick_actions'),
                  style:
                      AppTypography.dashboardHeading.copyWith(fontSize: 18.sp),
                ),

                16.verticalSpace,

                /// Grid of actionable buttons
                QuickActionsGrid(
                  onHistoryTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                ),

                16.verticalSpace,

                /// Upcoming maintenance/service card
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                    child: UpcomingServiceCard()),

                16.verticalSpace,

                GestureDetector(
                  onTap: () async {
                    final result = await Navigator.pushNamed(context, Routes.serviceCompany);
                    if (result is int && mounted) {
                      setState(() {
                        _currentIndex = result;
                      });
                    }
                  },
                  child: const PoolServiceCompanyCard(),
                ),

                16.verticalSpace
              ],
            ),
          ),
        )
      ],
    ));
  }

  /// Helper to return the correct widget based on the selected tab
  Widget _getTabContent(int index) {
    switch (index) {
      case 0:
        return _buildDashboardHome();
      case 1:
        return const ServicesPage();
      case 2:
        return const HistoryPage();
      case 3:
        return const ProfilePage();
      default:
        return _buildDashboardHome();
    }
  }

  void _navigateToCompany(BuildContext context) async {
    final result = await Navigator.pushNamed(context, Routes.serviceCompany);

    if (result is int && context.mounted) {
      setState(() {
        _currentIndex = result;
      });
    }
  }
}
