import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/technician/menu/technician_menu_screen.dart';
import 'package:flutter_skeleton/presentation/screen/technician/today_route/widgets/technician_bottom_nav.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

import 'package:flutter_skeleton/presentation/service/navigation.dart';

import 'widgets/work_order_item_row.dart';
import 'widgets/work_orders_header_bar.dart';
import 'widgets/work_orders_tab_selector.dart';

/// Technician Screen: "Work orders - Open / Done"
class WorkOrdersScreen extends StatefulWidget {
  const WorkOrdersScreen({super.key});

  @override
  State<WorkOrdersScreen> createState() => _WorkOrdersScreenState();
}

class _WorkOrdersScreenState extends State<WorkOrdersScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedTab = 0; // 0 for Open, 1 for Done
  int _currentBottomNavIndex = 3; // 'More' tab active

  final List<WorkOrderItemModel> _openWorkOrders = const [
    WorkOrderItemModel(
      title: 'Filter clean · A. Keys',
      subtitle: 'WO #1042 · due Fri',
      status: WorkOrderStatus.open,
      iconType: WorkOrderIconType.repair,
    ),
    WorkOrderItemModel(
      title: 'Repair callback · Roth',
      subtitle: 'WO #1039 · customer waiting',
      status: WorkOrderStatus.urgent,
      iconType: WorkOrderIconType.warning,
    ),
    WorkOrderItemModel(
      title: 'Pump replace · Hull',
      subtitle: 'WO #1035 · parts ordered',
      status: WorkOrderStatus.approved,
      iconType: WorkOrderIconType.repair,
    ),
  ];

  final List<WorkOrderItemModel> _doneWorkOrders = const [
    WorkOrderItemModel(
      title: 'Salt cell service · A. Keys',
      subtitle: 'WO #1031 · completed Fri 1 Aug',
      status: WorkOrderStatus.done,
      iconType: WorkOrderIconType.checkmark,
    ),
    WorkOrderItemModel(
      title: 'Heater ignitor · Pike',
      subtitle: 'WO #1027 · completed Wed 30 Jul',
      status: WorkOrderStatus.done,
      iconType: WorkOrderIconType.checkmark,
    ),
    WorkOrderItemModel(
      title: 'Green pool recovery · Diaz',
      subtitle: 'WO #1022 · completed Mon 28 Jul',
      status: WorkOrderStatus.done,
      iconType: WorkOrderIconType.checkmark,
    ),
    WorkOrderItemModel(
      title: 'Filter deep clean · Shannon',
      subtitle: 'WO #1018 · completed Thu 24 Jul',
      status: WorkOrderStatus.done,
      iconType: WorkOrderIconType.checkmark,
    ),
  ];

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _closeDrawer() {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      _scaffoldKey.currentState?.closeDrawer();
    } else {
      Navigator.of(context).maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeOrders = _selectedTab == 0 ? _openWorkOrders : _doneWorkOrders;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF7FAFC),
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        width: 290.w,
        child: TechnicianMenuScreen(
          onClose: _closeDrawer,
          onNavigateToTab: (index) {
            _closeDrawer();
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.todayRoute,
              (route) => false,
              arguments: index,
            );
          },
          onLogout: () {
            // Handle logout
          },
        ),
      ),
      bottomNavigationBar: TechnicianBottomNav(
        currentIndex: _currentBottomNavIndex,
        onTap: (index) {
          if (index == 3) {
            setState(() => _currentBottomNavIndex = 3);
          } else {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.todayRoute,
              (route) => false,
              arguments: index,
            );
          }
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// Header bar with back button (if canPop), title, and + button
            WorkOrdersHeaderBar(
              onMenuTap: _openDrawer,
              onBack: Navigator.of(context).canPop()
                  ? () => Navigator.of(context).pop()
                  : null,
              onAddTap: () {
                Navigator.of(context).pushNamed(Routes.newWorkOrder);
              },
            ),

            /// Scrollable content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  children: [
                    /// Segmented Tab: Open | Done
                    WorkOrdersTabSelector(
                      selectedIndex: _selectedTab,
                      onTabChanged: (index) {
                        setState(() => _selectedTab = index);
                      },
                    ),
                    20.verticalSpace,

                    /// Card container holding work order rows
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
                        children: List.generate(activeOrders.length, (index) {
                          final item = activeOrders[index];
                          return Column(
                            children: [
                              WorkOrderItemRow(
                                item: item,
                                onTap: () {
                                  _navigateToWorkOrderDetail(item);
                                },
                              ),
                              if (index != activeOrders.length - 1)
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
                    if (_selectedTab == 0) ...[
                      32.verticalSpace,
                      _buildNewWorkOrderButton(),
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

  Widget _buildNewWorkOrderButton() {
    return Container(
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(26.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08102A50),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.newWorkOrder);
          },
          borderRadius: BorderRadius.circular(26.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_rounded,
                size: 20.w,
                color: AppColors.darkNavy,
              ),
              8.horizontalSpace,
              Text(
                'New Work Order',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkNavy,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCompletedReadOnlySnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF1E2837),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        content: Text(
          'Completed work orders are read-only.',
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _navigateToWorkOrderDetail(WorkOrderItemModel item) {
    if (_selectedTab == 1 || item.status == WorkOrderStatus.done) {
      _showCompletedReadOnlySnackBar();
      return;
    }

    // If it's the Kaiden Roth callback / WO #1039
    if (item.subtitle.contains('WO #1039') || item.title.contains('Roth')) {
      Navigator.of(context).pushNamed(
        Routes.techWorkOrderDetail,
        arguments: {
          'orderNumber': 'WO #1039',
          'customer': 'Kaiden Roth',
          'type': 'Repair callback',
          'priority': 'Urgent',
          'priorityBgColor': const Color(0xFFFFECEB),
          'priorityTextColor': const Color(0xFFD63B30),
          'dueDate': 'Today · Mon 4 Aug',
          'scopeOfWork':
              'Pump seal is weeping after last week’s service. Replace the shaft seal, run the pump 15 minutes and check for leaks.',
          'customerNote':
              '"There’s a puddle under the pump again this morning."',
          'partsCount': 1,
        },
      );
      return;
    }

    if (item.subtitle.contains('WO #1035') || item.title.contains('Hull')) {
      Navigator.of(context).pushNamed(
        Routes.techWorkOrderDetail,
        arguments: {
          'orderNumber': 'WO #1035',
          'customer': 'Quinn Hull',
          'type': 'Pump replace',
          'status': 'Approved',
          'dueDate': 'Thu 7 Aug',
          'scopeOfWork':
              'Disconnect faulty pump motor, mount new variable-speed pump, re-plumb suction/discharge lines, and commission timer cycle.',
          'customerNote':
              '"Motor makes a loud screeching noise when it kicks on."',
          'partsCount': 2,
        },
      );
      return;
    }

    if (item.subtitle.contains('WO #1031')) {
      Navigator.of(context).pushNamed(
        Routes.techWorkOrderDetail,
        arguments: {
          'orderNumber': 'WO #1031',
          'customer': 'Alicia Keys',
          'type': 'Salt cell service',
          'status': 'Completed',
          'dueDate': 'Fri 1 Aug',
          'scopeOfWork':
              'Inspect and acid wash titanium cell plates, check salinity sensor calibration, and clear low salt warning on control panel.',
          'customerNote': '"Check cell light has been flashing for three days."',
          'partsCount': 1,
        },
      );
      return;
    }

    // Default to WO #1042 / A. Keys
    Navigator.of(context).pushNamed(
      Routes.techWorkOrderDetail,
      arguments: {
        'orderNumber': 'WO #1042',
        'customer': 'Alicia Keys',
        'type': 'Filter clean',
        'status': 'Approved',
        'dueDate': 'Fri 8 Aug',
        'scopeOfWork':
            'Strip and deep-clean the cartridge filter, replace both O-rings, pressure test, and log the pressure reading before and after.',
        'customerNote':
            '"Pressure gauge has been reading high since the storm."',
        'partsCount': 2,
      },
    );
  }
}
