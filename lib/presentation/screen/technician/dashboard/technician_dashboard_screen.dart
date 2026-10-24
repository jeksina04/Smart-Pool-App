import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/technician/menu/technician_menu_screen.dart';
import 'package:flutter_skeleton/presentation/screen/technician/today_route/today_route_screen.dart';
import 'package:flutter_skeleton/presentation/screen/technician/today_route/widgets/route_header_bar.dart';
import 'package:flutter_skeleton/presentation/screen/technician/today_route/widgets/route_progress_card.dart';
import 'package:flutter_skeleton/presentation/screen/technician/today_route/widgets/route_stop_item.dart';
import 'package:flutter_skeleton/presentation/screen/technician/today_route/widgets/technician_bottom_nav.dart';
import 'package:flutter_skeleton/presentation/screen/technician/work_orders/widgets/work_order_item_row.dart';
import 'package:flutter_skeleton/presentation/screen/technician/work_orders/widgets/work_orders_header_bar.dart';
import 'package:flutter_skeleton/presentation/screen/technician/work_orders/widgets/work_orders_tab_selector.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Common Dashboard Screen for Technician with unified bottom navigation
/// Tabs:
///  0: Today (Route)
///  1: Map
///  2: Customers
///  3: More (Work Orders)
class TechnicianDashboardScreen extends StatefulWidget {
  final int initialIndex;

  const TechnicianDashboardScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<TechnicianDashboardScreen> createState() => _TechnicianDashboardScreenState();
}

class _TechnicianDashboardScreenState extends State<TechnicianDashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late int _currentIndex;

  // Work Orders tab state (0: Open, 1: Done)
  int _workOrdersTab = 0;

  // Search filter for Customers tab
  final TextEditingController _customerSearchController = TextEditingController();
  String _customerSearchQuery = '';

  // Today Route stops
  final List<StopItemModel> _stops = const [
    StopItemModel(
      stopNumber: 1,
      customerName: 'Kaiden Roth',
      type: StopType.routine,
      time: '8:00',
      distance: '2.1 mi',
      status: StopStatus.done,
    ),
    StopItemModel(
      stopNumber: 2,
      customerName: 'Alicia Keys',
      type: StopType.routine,
      time: '9:30',
      distance: '4.4 mi',
      status: StopStatus.next,
    ),
    StopItemModel(
      stopNumber: 3,
      customerName: 'Clay Shannon',
      type: StopType.repair,
      time: '11:00',
      distance: '6.2 mi',
      status: StopStatus.pending,
    ),
    StopItemModel(
      stopNumber: 4,
      customerName: 'Quinn Hull',
      type: StopType.serviceCall,
      time: '12:30',
      distance: '3.8 mi',
      status: StopStatus.pending,
    ),
    StopItemModel(
      stopNumber: 5,
      customerName: 'Marta Diaz',
      type: StopType.routine,
      time: '13:45',
      distance: '5.0 mi',
      status: StopStatus.pending,
    ),
    StopItemModel(
      stopNumber: 6,
      customerName: 'Owen Pike',
      type: StopType.repair,
      time: '15:00',
      distance: '7.4 mi',
      status: StopStatus.pending,
    ),
  ];

  // Work orders data
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

  // Customers filter state: 0: All, 1: Active, 2: Inactive
  int _customerStatusFilter = 0;
  bool _filterTagsSelected = false;
  bool _filterOnMyRoute = false;

  // Customers data
  final List<Map<String, dynamic>> _customers = const [
    {
      'name': 'Alicia Keys',
      'address': '26 Marina Way',
      'frequency': 'weekly',
      'score': 92,
      'status': 'Active',
      'onRoute': true,
    },
    {
      'name': 'Clay Shannon',
      'address': '19 Juniper Ln',
      'frequency': 'fortnightly',
      'score': 84,
      'status': 'Active',
      'onRoute': true,
    },
    {
      'name': 'Kaiden Roth',
      'address': '88 Oak Ave',
      'frequency': 'weekly',
      'score': 78,
      'status': 'Active',
      'onRoute': true,
    },
    {
      'name': 'Marta Diaz',
      'address': '440 Cedar St',
      'frequency': 'weekly',
      'score': 91,
      'status': 'Active',
      'onRoute': true,
    },
    {
      'name': 'Owen Pike',
      'address': '7 Lake Rd',
      'frequency': 'monthly',
      'score': 61,
      'status': 'Active',
      'onRoute': false,
    },
    {
      'name': 'Quinn Hull',
      'address': '12 Palm Ct',
      'frequency': 'fortnightly',
      'score': 85,
      'status': 'Active',
      'onRoute': true,
    },
    {
      'name': 'Tom Bright',
      'address': '910 Sunset Blvd',
      'frequency': 'weekly',
      'score': 54,
      'status': 'Inactive',
      'onRoute': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  void dispose() {
    _customerSearchController.dispose();
    super.dispose();
  }

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

  void _switchTab(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
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
            _switchTab(index);
          },
          onLogout: () {
            // Handle logout
          },
        ),
      ),
      bottomNavigationBar: TechnicianBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            _buildTodayRouteTab(),
            _buildMapTab(),
            _buildCustomersTab(),
            _buildMoreWorkOrdersTab(),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // TAB 0: TODAY ROUTE
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildTodayRouteTab() {
    return Column(
      children: [
        RouteHeaderBar(
          onMenuTap: _openDrawer,
          onNotificationTap: () {
            Navigator.of(context).pushNamed(Routes.technicianNotifications);
          },
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(20.w, 6.h, 20.w, 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RouteProgressCard(
                  completedStops: 1,
                  totalStops: 6,
                  distance: '70.9 mi',
                  eta: '4:10 pm',
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Stops',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.darkNavy,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(8.r),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 4.h,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppAssets.icRoute,
                              width: 16.w,
                              height: 16.w,
                              colorFilter: const ColorFilter.mode(
                                AppColors.primaryBlue,
                                BlendMode.srcIn,
                              ),
                            ),
                            6.horizontalSpace,
                            Text(
                              'Optimise',
                              style: TextStyle(
                                fontFamily: AppTypography.poppinsFont,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                12.verticalSpace,
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
                    children: List.generate(_stops.length, (index) {
                      final stop = _stops[index];
                      return Column(
                        children: [
                          RouteStopItem(
                            stop: stop,
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                Routes.techVisitDetail,
                                arguments: {
                                  'visitDate': 'Today',
                                  'technicianName': stop.customerName,
                                },
                              );
                            },
                          ),
                          if (index != _stops.length - 1)
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
                20.verticalSpace,
                _buildRunningLateButton(),
                14.verticalSpace,
                _buildStartRouteButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRunningLateButton() {
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
          onTap: () {},
          borderRadius: BorderRadius.circular(26.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.notifications_none_rounded,
                size: 20.w,
                color: AppColors.darkNavy,
              ),
              8.horizontalSpace,
              Text(
                'Tell the office I am running late',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 14.sp,
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

  Widget _buildStartRouteButton() {
    return SizedBox(
      width: double.infinity,
      height: 54.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27.r),
          ),
        ),
        child: Text(
          'Start Route',
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // TAB 1: MAP
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildMapTab() {
    return Column(
      children: [
        RouteHeaderBar(
          title: 'Route Map',
          onMenuTap: _openDrawer,
          onNotificationTap: () {
            Navigator.of(context).pushNamed(Routes.technicianNotifications);
          },
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(20.w, 6.h, 20.w, 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Simulated Map Visual Card
                Container(
                  width: double.infinity,
                  height: 220.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3EDF7),
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0C102A50),
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Grid line background
                      Positioned.fill(
                        child: CustomPaint(
                          painter: _MapGridPainter(),
                        ),
                      ),
                      // Stop Pins
                      Align(
                        alignment: const Alignment(-0.6, -0.4),
                        child: _buildMapPin(1, 'Kaiden Roth', isDone: true),
                      ),
                      Align(
                        alignment: const Alignment(-0.1, -0.1),
                        child: _buildMapPin(2, 'Alicia Keys', isCurrent: true),
                      ),
                      Align(
                        alignment: const Alignment(0.5, -0.3),
                        child: _buildMapPin(3, 'Clay Shannon'),
                      ),
                      Align(
                        alignment: const Alignment(0.4, 0.4),
                        child: _buildMapPin(4, 'Quinn Hull'),
                      ),
                      Align(
                        alignment: const Alignment(-0.3, 0.5),
                        child: _buildMapPin(5, 'Marta Diaz'),
                      ),
                      // Recenter button
                      Positioned(
                        right: 14.w,
                        bottom: 14.h,
                        child: Container(
                          width: 38.w,
                          height: 38.w,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14102A50),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.my_location_rounded,
                            size: 19.w,
                            color: AppColors.primaryBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                18.verticalSpace,

                // Stops along route heading
                Text(
                  'Stops On Map (${_stops.length})',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.darkNavy,
                  ),
                ),
                12.verticalSpace,

                // List of stops for quick navigation
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
                    children: List.generate(_stops.length, (index) {
                      final stop = _stops[index];
                      return Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                            leading: Container(
                              width: 32.w,
                              height: 32.w,
                              decoration: BoxDecoration(
                                color: stop.status == StopStatus.done
                                    ? const Color(0xFFE8F5E9)
                                    : (stop.status == StopStatus.next
                                        ? const Color(0xFFE2EDFE)
                                        : const Color(0xFFF0F3F6)),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${stop.stopNumber}',
                                  style: TextStyle(
                                    fontFamily: AppTypography.poppinsFont,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                    color: stop.status == StopStatus.done
                                        ? const Color(0xFF2E7D32)
                                        : (stop.status == StopStatus.next
                                            ? AppColors.primaryBlue
                                            : AppColors.textGrey),
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              stop.customerName,
                              style: TextStyle(
                                fontFamily: AppTypography.poppinsFont,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.darkNavy,
                              ),
                            ),
                            subtitle: Text(
                              '${stop.distance} · ETA ${stop.time}',
                              style: TextStyle(
                                fontFamily: AppTypography.poppinsFont,
                                fontSize: 12.sp,
                                color: AppColors.textGrey,
                              ),
                            ),
                            trailing: Icon(
                              Icons.directions_rounded,
                              color: AppColors.primaryBlue,
                              size: 24.w,
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                Routes.techVisitDetail,
                                arguments: {
                                  'visitDate': 'Today',
                                  'technicianName': stop.customerName,
                                },
                              );
                            },
                          ),
                          if (index != _stops.length - 1)
                            const Divider(height: 1, thickness: 1, color: Color(0xFFF0F3F6)),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMapPin(int number, String label, {bool isDone = false, bool isCurrent = false}) {
    final bgColor = isDone
        ? const Color(0xFF2E7D32)
        : (isCurrent ? AppColors.primaryBlue : AppColors.darkNavy);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6.r),
            boxShadow: const [
              BoxShadow(color: Color(0x1A000000), blurRadius: 4),
            ],
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),
        ),
        4.verticalSpace,
        Container(
          width: 26.w,
          height: 26.w,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.white, width: 2),
            boxShadow: const [
              BoxShadow(color: Color(0x1F000000), blurRadius: 4, offset: Offset(0, 2)),
            ],
          ),
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w800,
                fontSize: 11.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // TAB 2: CUSTOMERS
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildCustomersTab() {
    final filtered = _customers.where((c) {
      // 1. Status segment filter
      if (_customerStatusFilter == 1 && c['status'] != 'Active') return false;
      if (_customerStatusFilter == 2 && c['status'] != 'Inactive') return false;

      // 2. On my route filter
      if (_filterOnMyRoute && (c['onRoute'] != true)) return false;

      // 3. Search query
      if (_customerSearchQuery.isEmpty) return true;
      final q = _customerSearchQuery.toLowerCase();
      final name = (c['name'] as String).toLowerCase();
      final addr = (c['address'] as String).toLowerCase();
      return name.contains(q) || addr.contains(q);
    }).toList();

    return Column(
      children: [
        // Custom Header Bar with Hamburger, Title "Customers (7)", and "+" button
        _buildCustomersHeaderBar(),

        Expanded(
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(20.w, 6.h, 24.w, 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Bar
                    _buildCustomerSearchBar(),
                    14.verticalSpace,

                    // Filter Chips: Tags, On my route
                    _buildCustomerFilterChips(),
                    16.verticalSpace,

                    // Segmented Filter: All | Active | Inactive
                    _buildCustomerSegmentedFilter(),
                    16.verticalSpace,

                    // Customer Cards List
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
                        children: List.generate(filtered.length, (index) {
                          final item = filtered[index];
                          return Column(
                            children: [
                              _buildCustomerCardRow(item),
                              if (index != filtered.length - 1)
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
                    18.verticalSpace,

                    // Info Banner for Inactive customers
                    _buildInactiveCustomersBanner(),
                  ],
                ),
              ),

              // Alphabetical A-Z Scroller on the right
              Positioned(
                right: 4.w,
                top: 70.h,
                bottom: 20.h,
                child: _buildAlphabetIndex(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCustomersHeaderBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 3-line hamburger menu button
          InkWell(
            onTap: _openDrawer,
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0C102A50),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.menu_rounded,
                  size: 22.w,
                  color: AppColors.darkNavy,
                ),
              ),
            ),
          ),

          // Title: Customers (7)
          Text(
            'Customers (${_customers.length})',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),

          // Right "+" Add button
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.addCustomer);
            },
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0C102A50),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.add_rounded,
                  size: 24.w,
                  color: AppColors.darkNavy,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerSearchBar() {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08102A50),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _customerSearchController,
        onChanged: (val) {
          setState(() => _customerSearchQuery = val);
        },
        decoration: InputDecoration(
          hintText: 'Search by name or address',
          hintStyle: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 14.sp,
            color: const Color(0xFF8A99AD),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 14.w, right: 10.w),
            child: Icon(
              Icons.search_rounded,
              size: 22.w,
              color: const Color(0xFF7A8A9E),
            ),
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 44.w),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
        ),
      ),
    );
  }

  Widget _buildCustomerFilterChips() {
    return Row(
      children: [
        // Tags chip
        InkWell(
          onTap: () {
            setState(() => _filterTagsSelected = !_filterTagsSelected);
          },
          borderRadius: BorderRadius.circular(18.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F1FE),
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.local_offer_outlined,
                  size: 14.w,
                  color: AppColors.primaryBlue,
                ),
                6.horizontalSpace,
                Text(
                  'Tags',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
        10.horizontalSpace,

        // On my route chip
        InkWell(
          onTap: () {
            setState(() => _filterOnMyRoute = !_filterOnMyRoute);
          },
          borderRadius: BorderRadius.circular(18.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
            decoration: BoxDecoration(
              color: _filterOnMyRoute ? AppColors.primaryBlue : const Color(0xFFF0F3F7),
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Text(
              'On my route',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: _filterOnMyRoute ? AppColors.white : const Color(0xFF5A6B82),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerSegmentedFilter() {
    return Container(
      width: double.infinity,
      height: 48.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06102A50),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildSegmentButton('All', 0),
          _buildSegmentButton('Active', 1),
          _buildSegmentButton('Inactive', 2),
        ],
      ),
    );
  }

  Widget _buildSegmentButton(String title, int index) {
    final isSelected = _customerStatusFilter == index;
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() => _customerStatusFilter = index);
        },
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(20.r),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 14.sp,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
              color: isSelected ? AppColors.white : AppColors.darkNavy,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomerCardRow(Map<String, dynamic> item) {
    final int score = (item['score'] as int?) ?? 80;
    final bool isInactive = item['status'] == 'Inactive';

    Color scoreBg;
    Color scoreTextColor;

    if (score >= 80) {
      scoreBg = const Color(0xFFE2F6EC);
      scoreTextColor = const Color(0xFF0F7645);
    } else if (score >= 70) {
      scoreBg = const Color(0xFFFEF3E2);
      scoreTextColor = const Color(0xFFB57008);
    } else {
      scoreBg = const Color(0xFFFFEBEE);
      scoreTextColor = const Color(0xFFD32F2F);
    }

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.techCustomerDetail,
          arguments: {
            'name': item['name'],
            'address': item['address'],
            'frequency': item['frequency'],
            'healthScore': score,
            'nextVisit': 'Mon',
            'workOrdersCount': 1,
            'shoppingItemsCount': 2,
          },
        );
      },
      borderRadius: BorderRadius.circular(16.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Blue Icon avatar box
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: const Color(0xFFEDF4FE),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Center(
                child: Icon(
                  Icons.person_outline_rounded,
                  size: 22.w,
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
            12.horizontalSpace,

            // Details (Name, Address · frequency)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'] as String,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkNavy,
                    ),
                  ),
                  4.verticalSpace,
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          '${item['address']} · ${item['frequency']}',
                          style: TextStyle(
                            fontFamily: AppTypography.poppinsFont,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGrey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (isInactive) ...[
                        6.horizontalSpace,
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F3F7),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            'Inactive',
                            style: TextStyle(
                              fontFamily: AppTypography.poppinsFont,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF5A6B82),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            8.horizontalSpace,

            // Score Pill Badge
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: scoreBg,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                '$score',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: scoreTextColor,
                ),
              ),
            ),
            8.horizontalSpace,

            // Trailing Chevron
            Icon(
              Icons.chevron_right_rounded,
              size: 20.w,
              color: const Color(0xFF9AA5B5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInactiveCustomersBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F1FE),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        'Inactive customers stay on the list. The office keeps them for re-marketing, and you may still be asked to quote one.',
        style: TextStyle(
          fontFamily: AppTypography.poppinsFont,
          fontSize: 12.5.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryBlue,
          height: 1.4,
        ),
      ),
    );
  }

  Widget _buildAlphabetIndex() {
    const alphabet = [
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
      'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
      'U', 'V', 'W', 'X', 'Y', 'Z'
    ];

    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: alphabet.map((letter) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 0.8.h),
            child: Text(
              letter,
              style: TextStyle(
                fontSize: 9.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryBlue,
                height: 1.0,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // TAB 3: MORE / WORK ORDERS
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildMoreWorkOrdersTab() {
    final activeOrders = _workOrdersTab == 0 ? _openWorkOrders : _doneWorkOrders;

    return Column(
      children: [
        WorkOrdersHeaderBar(
          onMenuTap: _openDrawer,
          onAddTap: () {
            Navigator.of(context).pushNamed(Routes.newWorkOrder);
          },
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Column(
              children: [
                WorkOrdersTabSelector(
                  selectedIndex: _workOrdersTab,
                  onTabChanged: (index) {
                    setState(() => _workOrdersTab = index);
                  },
                ),
                20.verticalSpace,
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
                            onTap: () {},
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
                _buildNewWorkOrderButton(),
              ],
            ),
          ),
        ),
      ],
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

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD4E3F3)
      ..strokeWidth = 1;

    // Draw grid roads
    for (double x = 20; x < size.width; x += 40) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 20; y < size.height; y += 40) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // Draw route path line connecting pins
    final routePaint = Paint()
      ..color = AppColors.primaryBlue.withOpacity(0.6)
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.3)
      ..lineTo(size.width * 0.45, size.height * 0.45)
      ..lineTo(size.width * 0.75, size.height * 0.35)
      ..lineTo(size.width * 0.7, size.height * 0.7)
      ..lineTo(size.width * 0.35, size.height * 0.75);

    canvas.drawPath(path, routePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
