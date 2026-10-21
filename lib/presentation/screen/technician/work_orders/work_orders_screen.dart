import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/technician/menu/technician_menu_screen.dart';
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

  final List<WorkOrderItemModel> _openWorkOrders = const [
    WorkOrderItemModel(
      title: 'Filter clean · A. Keys',
      subtitle: 'WO #1042 · due Fri',
      status: WorkOrderStatus.open,
      iconType: WorkOrderIconType.wrench,
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
      iconType: WorkOrderIconType.wrench,
    ),
  ];

  final List<WorkOrderItemModel> _doneWorkOrders = const [
    WorkOrderItemModel(
      title: 'Salt cell inspect · Garcia',
      subtitle: 'WO #1031 · completed yesterday',
      status: WorkOrderStatus.approved,
      iconType: WorkOrderIconType.wrench,
    ),
    WorkOrderItemModel(
      title: 'Heater sensor fix · Miller',
      subtitle: 'WO #1028 · completed Mon',
      status: WorkOrderStatus.approved,
      iconType: WorkOrderIconType.wrench,
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
          onLogout: () {
            // Handle logout
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// Header bar with 3-line hamburger menu, title, and + button
            WorkOrdersHeaderBar(
              onMenuTap: _openDrawer,
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
                                  // Navigate to Work Order details
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
                    32.verticalSpace,

                    /// Primary "+ New Work Order" pill button
                    _buildNewWorkOrderButton(),
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
}
