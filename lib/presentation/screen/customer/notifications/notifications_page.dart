import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import '../../../service/navigation.dart';
import './widgets/notification_section.dart';
import './widgets/unread_banner.dart';

class NotificationsPage extends StatefulWidget {
  // Callback to go back to the previous dashboard state
  final VoidCallback? onBack;
  final VoidCallback? onSupportTap;

  const NotificationsPage({super.key, this.onBack, this.onSupportTap});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late List<Map<String, dynamic>> _notifications;

  @override
  void initState() {
    super.initState();

    // --> Replace with actual notifications data
    _notifications = [
      {
        'title': 'Chlorine is low',
        'subtitle': '1.1 ppm — below the target range',
        'time': '10m',
        'isRead': false,
        'type': 'pool_alert',
        'isToday': true
      },
      {
        'title': 'Sunset Pool & Spa invited you',
        'subtitle': 'Add them to your account for the lake house',
        'time': '1h',
        'isRead': false,
        'type': 'invite',
        'isToday': true
      },
      {
        'title': 'Your quote is ready',
        'subtitle': 'Green pool recovery · \$311.76',
        'time': '1h',
        'isRead': false,
        'type': 'quote',
        'isToday': true
      },
      {
        'title': 'Service paused',
        'subtitle': 'NSP Pool & Spa Services is not active on Smart Pool',
        'time': '1h',
        'isRead': true,
        'type': 'alert',
        'isToday': true
      },
      {
        'title': 'Ray has checked in',
        'subtitle': 'Full clean & balance started',
        'time': '2h',
        'isRead': true,
        'type': 'checkin',
        'isToday': true
      },
      {
        'title': 'Payment received',
        'subtitle': '\$135.00 by bank •••• 4821 — invoice #3406',
        'time': '5h',
        'isRead': true,
        'type': 'payment',
        'isToday': true
      },
      {
        'title': 'Visit rescheduled',
        'subtitle': 'Moved to Fri 7 Aug, 10:00 AM',
        'time': 'Yest.',
        'isRead': true,
        'type': 'calendar',
        'isToday': false
      },
      {
        'title': 'Message from NSP Pool & Spa Services',
        'subtitle': '"Topped off the salt cell."',
        'time': 'Yest.',
        'isRead': false,
        'type': 'message',
        'isToday': false
      },
    ];
  }

  /// Day wise grouped notifications
  List<Map<String, dynamic>> get _groupedNotifications {
    final today = _notifications.where((n) => n['isToday']).toList();
    final yesterday = _notifications.where((n) => !n['isToday']).toList();

    List<Map<String, dynamic>> sections = [];
    if (today.isNotEmpty) sections.add({'header': 'TODAY', 'items': today});
    if (yesterday.isNotEmpty) sections.add({'header': 'YESTERDAY', 'items': yesterday});
    return sections;
  }

  void _markAllAsRead() {
    setState(() {
      for (var n in _notifications) {
        n['isRead'] = true;
      }
    });
  }

  int get _unreadCount => _notifications.where((n) => !n['isRead']).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
              child: SizedBox(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: widget.onBack ?? () => Navigator.pop(context),
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
                    Text(
                      context.getString('notifications_title'),
                      style: AppTypography.sectionHeader,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: _markAllAsRead,
                        child: Text(
                          context.getString('mark_all'),
                          style: AppTypography.markAllText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,

                    // Unread Count Banner
                    if (_unreadCount > 0) ...[
                      UnreadBanner(count: _unreadCount),
                      16.verticalSpace,
                    ],

                    // Notification Sections
                    ..._groupedNotifications.map((section) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 24.h),
                        child: NotificationSection(
                          title: section['header'],
                          items: section['items'],
                          onItemTap: (data) {
                            if (data['type'] == 'pool_alert') {
                              Navigator.pushNamed(context, Routes.poolHealth);
                            }
                            else if (data['type'] == 'quote') {
                              Navigator.pushNamed(context, Routes.approveQuote);
                            }
                            else if (data['type'] == 'alert') {
                              Navigator.pushNamed(context, Routes.servicePaused);
                            }
                            else if (data['type'] == 'calendar') {
                              Navigator.pushNamed(context, Routes.scheduledVisits);
                            }
                            else if (data['type'] == 'checkin') {
                              // --> Replace with actual data
                              final latestVisit = {
                                'date': "28 Jul 2026",
                                'desc': "Ray · 7 tasks · 4 photos",
                                'isRepair': false
                              };

                              Navigator.pushNamed(
                                context,
                                Routes.visitDetail,
                                arguments: latestVisit,
                              );
                            }
                            else if(data['type'] == 'message'){
                              if (widget.onSupportTap != null) {
                                widget.onSupportTap!();
                              } else {
                                Navigator.pushNamed(context, Routes.poolCareSupport);
                              }
                            }
                          },
                        ),
                      );
                    }).toList(),

                    8.verticalSpace,
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
