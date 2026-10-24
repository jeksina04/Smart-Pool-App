import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/technician/menu/technician_menu_screen.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';

import 'widgets/route_header_bar.dart';
import 'widgets/route_progress_card.dart';
import 'widgets/route_stop_item.dart';
import 'widgets/technician_bottom_nav.dart';

/// Main Technician Screen: "Today / My Route"
/// Clicking the top-left 3-line menu icon opens the Technician Drawer screen.
class TodayRouteScreen extends StatefulWidget {
  const TodayRouteScreen({super.key});

  @override
  State<TodayRouteScreen> createState() => _TodayRouteScreenState();
}

class _TodayRouteScreenState extends State<TodayRouteScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentBottomNavIndex = 0;

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
      bottomNavigationBar: TechnicianBottomNav(
        currentIndex: _currentBottomNavIndex,
        onTap: (index) {
          if (index == 3) {
            Navigator.of(context).pushNamed(Routes.workOrders);
          } else {
            setState(() => _currentBottomNavIndex = index);
          }
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// Top Header Bar with 3-button hamburger menu
            RouteHeaderBar(
              onMenuTap: _openDrawer,
              onNotificationTap: () {
                Navigator.of(context).pushNamed(Routes.technicianNotifications);
              },
            ),

            /// Scrollable Body Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(20.w, 6.h, 20.w, 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Progress Card (Stops completed, ETA, Distance, Progress Bar)
                    const RouteProgressCard(
                      completedStops: 1,
                      totalStops: 6,
                      distance: '70.9 mi',
                      eta: '4:10 pm',
                    ),
                    20.verticalSpace,

                    /// "Stops" section title and "Optimise" action
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
                          onTap: () {
                            // Route optimize action
                          },
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

                    /// Grouped Stops Card List
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
                                  // Navigate to stop detail / visit view
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

                    /// "Tell the office I am running late" pill button
                    _buildRunningLateButton(),
                    14.verticalSpace,

                    /// Primary "Start Route" Action Button
                    _buildStartRouteButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
          onTap: () {
            // Tell office running late
          },
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
        onPressed: () {
          // Start route action
        },
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
}
