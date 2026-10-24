import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

import 'widgets/my_day_header_bar.dart';

/// Screen: "My day"
/// Tracking technician hours, travel, customer site tasks, breaks, and state location.
class MyDayScreen extends StatefulWidget {
  const MyDayScreen({super.key});

  @override
  State<MyDayScreen> createState() => _MyDayScreenState();
}

class _MyDayScreenState extends State<MyDayScreen> {
  bool _isDayStarted = false;
  String _workState = '–';
  String _crossedStateLine = 'No';

  // Sample timeline entries for "Today"
  final List<Map<String, dynamic>> _todayEvents = [
    {
      'title': 'Left the office',
      'subtitle': '6:54 am · day started',
      'tagText': 'Paid',
      'tagBg': const Color(0xFFE2EDFE),
      'tagTextColor': AppColors.primaryBlue,
      'icon': Icons.alt_route_rounded,
      'iconBg': const Color(0xFFEDF4FE),
      'iconColor': AppColors.primaryBlue,
    },
    {
      'title': 'Kaiden Roth',
      'subtitle': 'Task · 7:22 – 8:00 · 38 min on site',
      'tagText': 'Done',
      'tagBg': const Color(0xFFE2F6EC),
      'tagTextColor': const Color(0xFF0F7645),
      'icon': Icons.check_rounded,
      'iconBg': const Color(0xFFEBF3FE),
      'iconColor': AppColors.primaryBlue,
    },
    {
      'title': 'Travel',
      'subtitle': '8:00 – 8:19 · 19 min',
      'tagText': 'Paid',
      'tagBg': const Color(0xFFE2EDFE),
      'tagTextColor': AppColors.primaryBlue,
      'icon': Icons.alt_route_rounded,
      'iconBg': const Color(0xFFEDF4FE),
      'iconColor': AppColors.primaryBlue,
    },
    {
      'title': 'Alicia Keys',
      'subtitle': 'Task · 9:30 – now',
      'tagText': 'Open',
      'tagBg': const Color(0xFFFEF3E2),
      'tagTextColor': const Color(0xFFB57008),
      'icon': Icons.access_time_rounded,
      'iconBg': const Color(0xFFEDF4FE),
      'iconColor': AppColors.primaryBlue,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Bar with back button & title "My day"
            MyDayHeaderBar(
              onBack: () => Navigator.of(context).maybePop(),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. Status Card ("Not started" / "Your day starts when you leave the office")
                    _buildDayStatusCard(),
                    16.verticalSpace,

                    // 2. Primary "Start my day" / "End my day" button
                    _buildStartDayButton(),
                    8.verticalSpace,

                    // Subtitle under start button
                    Text(
                      'Start when you leave the office, not when you reach the first pool — travel is paid time.',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey,
                        height: 1.4,
                      ),
                    ),
                    18.verticalSpace,

                    // 3. Paid today & On customer sites stats
                    _buildStatsRow(),
                    14.verticalSpace,

                    // 4. Blue informative banner
                    _buildInfoBanner(),
                    20.verticalSpace,

                    // 5. Section: "Today"
                    _buildSectionHeader('Today'),
                    12.verticalSpace,

                    // Today events card list
                    _buildTodayEventsCard(),
                    24.verticalSpace,

                    // 6. Section: "Where you worked"
                    _buildSectionHeader('Where you worked'),
                    12.verticalSpace,

                    // Work state & State line card
                    _buildWhereYouWorkedCard(),
                    20.verticalSpace,

                    // 7. "Start a break" pill button
                    _buildStartBreakButton(),
                    16.verticalSpace,

                    // 8. Warning notice banner (amber card)
                    _buildLocationTrackingNotice(),
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayStatusCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
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
        children: [
          Text(
            _isDayStarted ? 'In progress' : 'Not started',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textGrey,
            ),
          ),
          10.verticalSpace,
          Container(
            width: 24.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: AppColors.darkNavy,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          12.verticalSpace,
          Text(
            _isDayStarted
                ? 'Your day is currently active'
                : 'Your day starts when you leave the office',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textGrey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStartDayButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _isDayStarted = !_isDayStarted;
            if (_isDayStarted) {
              _workState = 'Texas (TX)';
            }
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.access_time_rounded,
              size: 20.w,
              color: AppColors.white,
            ),
            10.horizontalSpace,
            Text(
              _isDayStarted ? 'End my day' : 'Start my day',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        // Paid today
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Paid today',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGrey,
                  ),
                ),
                2.verticalSpace,
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    _isDayStarted ? '1.8 h' : '0.0 h',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.darkNavy,
                      height: 1.15,
                    ),
                  ),
                ),
                2.verticalSpace,
                Text(
                  'whole day',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 11.sp,
                    color: const Color(0xFF8A99AD),
                  ),
                ),
              ],
            ),
          ),
        ),
        14.horizontalSpace,

        // On customer sites
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'On customer sites',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGrey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                2.verticalSpace,
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    _isDayStarted ? '0.6 h' : '0.0 h',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.darkNavy,
                      height: 1.15,
                    ),
                  ),
                ),
                2.verticalSpace,
                Text(
                  'tasks only',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 11.sp,
                    color: const Color(0xFF8A99AD),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F1FE),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Icon(
              Icons.change_history_rounded,
              size: 14.w,
              color: AppColors.primaryBlue,
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 12.sp,
                  color: AppColors.primaryBlue,
                  height: 1.4,
                ),
                children: const [
                  TextSpan(
                    text: 'Both numbers are real. ',
                  ),
                  TextSpan(
                    text: 'You are paid for the day;',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text:
                        ' the office costs a job on the time spent at it. Travel is the difference.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: AppTypography.poppinsFont,
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.darkNavy,
      ),
    );
  }

  Widget _buildTodayEventsCard() {
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
        children: List.generate(_todayEvents.length, (index) {
          final item = _todayEvents[index];
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                child: Row(
                  children: [
                    // Icon Box
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: item['iconBg'] as Color,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Icon(
                          item['icon'] as IconData,
                          size: 20.w,
                          color: item['iconColor'] as Color,
                        ),
                      ),
                    ),
                    14.horizontalSpace,

                    // Title & Subtitle
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'] as String,
                            style: TextStyle(
                              fontFamily: AppTypography.poppinsFont,
                              fontSize: 14.5.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkNavy,
                            ),
                          ),
                          3.verticalSpace,
                          Text(
                            item['subtitle'] as String,
                            style: TextStyle(
                              fontFamily: AppTypography.poppinsFont,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.horizontalSpace,

                    // Tag Badge
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: item['tagBg'] as Color,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        item['tagText'] as String,
                        style: TextStyle(
                          fontFamily: AppTypography.poppinsFont,
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.w700,
                          color: item['tagTextColor'] as Color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (index != _todayEvents.length - 1)
                const Divider(height: 1, thickness: 1, color: Color(0xFFF0F3F6)),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildWhereYouWorkedCard() {
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
        children: [
          // 1. Work state
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF4FE),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.location_on_outlined,
                        size: 20.w,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
                  14.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Work state',
                          style: TextStyle(
                            fontFamily: AppTypography.poppinsFont,
                            fontSize: 14.5.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.darkNavy,
                          ),
                        ),
                        3.verticalSpace,
                        Text(
                          'set when you start your day',
                          style: TextStyle(
                            fontFamily: AppTypography.poppinsFont,
                            fontSize: 12.sp,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    _workState,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 14.sp,
                      color: AppColors.darkNavy,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  8.horizontalSpace,
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 20.w,
                    color: const Color(0xFF9AA5B5),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFF0F3F6)),

          // 2. Crossed a state line today?
          InkWell(
            onTap: () {
              setState(() {
                _crossedStateLine = _crossedStateLine == 'No' ? 'Yes' : 'No';
              });
            },
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF4FE),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.alt_route_rounded,
                        size: 20.w,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
                  14.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Crossed a state line today?',
                          style: TextStyle(
                            fontFamily: AppTypography.poppinsFont,
                            fontSize: 14.5.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.darkNavy,
                          ),
                        ),
                        3.verticalSpace,
                        Text(
                          'Tell us and the office splits the day',
                          style: TextStyle(
                            fontFamily: AppTypography.poppinsFont,
                            fontSize: 12.sp,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    _crossedStateLine,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 13.5.sp,
                      color: AppColors.darkNavy,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  8.horizontalSpace,
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 20.w,
                    color: const Color(0xFF9AA5B5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartBreakButton() {
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
            // Start a break action
          },
          borderRadius: BorderRadius.circular(26.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.access_time_rounded,
                size: 20.w,
                color: AppColors.darkNavy,
              ),
              10.horizontalSpace,
              Text(
                'Start a break',
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

  Widget _buildLocationTrackingNotice() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9EE),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFFFECCC), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Text(
              '✦',
              style: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xFFB57008),
              ),
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 12.sp,
                  color: const Color(0xFF7A4D05),
                  height: 1.45,
                ),
                children: const [
                  TextSpan(
                    text: 'While you are on the clock the office can see your ',
                  ),
                  TextSpan(
                    text: 'approximate',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text:
                        ' position. It stops the moment you end your day.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
