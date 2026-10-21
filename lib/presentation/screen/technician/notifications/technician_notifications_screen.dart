import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

import 'widgets/tech_notification_item_row.dart';
import 'widgets/technician_notifications_header_bar.dart';

/// Screen: Technician "Notifications"
class TechnicianNotificationsScreen extends StatefulWidget {
  const TechnicianNotificationsScreen({super.key});

  @override
  State<TechnicianNotificationsScreen> createState() =>
      _TechnicianNotificationsScreenState();
}

class _TechnicianNotificationsScreenState
    extends State<TechnicianNotificationsScreen> {
  final List<TechNotificationItemModel> _notifications = const [
    TechNotificationItemModel(
      title: 'Route updated',
      subtitle: 'Stop 5 moved to 13:45',
      time: '2m',
      iconType: TechNotificationIconType.route,
    ),
    TechNotificationItemModel(
      title: 'New work order · Roth',
      subtitle: 'Repair callback — urgent',
      time: '1h',
      iconType: TechNotificationIconType.wrench,
    ),
    TechNotificationItemModel(
      title: 'Job reassigned',
      subtitle: 'Hull moved to Dan',
      time: '3h',
      iconType: TechNotificationIconType.person,
    ),
    TechNotificationItemModel(
      title: 'Sync completed',
      subtitle: '4 jobs uploaded',
      time: 'Yest.',
      iconType: TechNotificationIconType.sync,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            /// Header bar with circular back button and centered title
            TechnicianNotificationsHeaderBar(
              onBack: () => Navigator.of(context).maybePop(),
            ),

            /// Scrollable content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  children: [
                    /// Notifications list card
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
                        children: List.generate(_notifications.length, (index) {
                          final item = _notifications[index];
                          return Column(
                            children: [
                              TechNotificationItemRow(
                                item: item,
                                onTap: () {
                                  // Navigate to related notification action
                                },
                              ),
                              if (index != _notifications.length - 1)
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

                    /// "Mark All Read" action button
                    TextButton(
                      onPressed: () {
                        // Mark all notifications as read
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primaryBlue,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                      ),
                      child: Text(
                        'Mark All Read',
                        style: TextStyle(
                          fontFamily: AppTypography.poppinsFont,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ),
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
