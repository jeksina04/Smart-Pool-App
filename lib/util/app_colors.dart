import 'package:flutter/material.dart';

/// Centralized application color constants matching Clean Architecture guidelines.
abstract class AppColors {
  AppColors._();

  /// Primary text and brand accent color `#0F2A3F`
  static const Color darkNavy = Color(0xFF0F2A3F);

  /// Next button shadow color `0px 2px 8px 0px #102A500F`
  static const Color nextButtonShadow = Color(0x0F102A50);

  /// Pure white `#FFFFFF` for button background and selected indicators
  static const Color white = Color(0xFFFFFFFF);

  /// Selected indicator color `#FFFFFF`
  static const Color indicatorSelected = Color(0xFFFFFFFF);

  /// Unselected indicator color `#FFFFFF80` (50% opacity)
  static const Color indicatorUnselected = Color(0x80FFFFFF);

  /// Background water gradient colors
  static const Color gradientStart = Color(0xFFC7E5F8);
  static const Color gradientMiddle = Color(0xFF5B9BD5);
  static const Color gradientDeep = Color(0xFF17548B);
  static const Color gradientEnd = Color(0xFF0C3E6E);

  /// Primary Brand Blue `#1668D6` for buttons, active tabs, links
  static const Color primaryBlue = Color(0xFF1668D6);

  /// Chlorine Level chart color'#4C97F5'
  static const Color chlorineChartColor = Color(0xFF4C97F5);

  /// Secondary/subtle text and hint color `#5F6C7A`
  static const Color textGrey = Color(0xFF5F6C7A);

  /// Divider color `#D8DFE7`
  static const Color dividerColor = Color(0xFFD8DFE7);

  /// Google brand blue `#4285F4`
  static const Color googleBlue = Color(0xFF4285F4);

  /// Elevation shadow `0px 2px 8px 0px #102A500F`
  static const Color cardShadow = Color(0x0F102A50);

  /// Bottom wave decoration colors
  static const Color waveLight = Color(0xFFD3E7F8);
  static const Color waveMedium = Color(0xFF7CB8EC);

  /// Info banner colors for registration screen
  static const Color infoBannerText = Color(0xFF0D5BC4);
  static const Color infoBannerBg = Color(0xFFE9EEFC);

  /// Read Notifications icon background color `#E3F0FD`
  static const Color readNotificationIconBg = Color(0xFFE3F0FD);

  /// Read Notifications icon color #0A4AA8
  static const Color readNotificationIconColor = Color(0xFF0A4AA8);

  /// Timer disabled button colors
  static const Color timerButtonBg = Color(0xFFD8DFE7);
  static const Color timerButtonText = Color(0xFFA9B4BF);

  /// Quick Action label color #3A4750
  static const Color quickActionLabel = Color(0xFF3A4750);

  /// Pool Care Support Profile Background color `#BBD6F5`
  static const Color profileBg = Color(0xFFBBD6F5);

  /// Pool Care Support Profile active color '#22A96B'
  static const Color profileActive = Color(0xFF22A96B);

  /// Pool Care Support Message Shadow color `#102A501A`
  static const Color messageShadow = Color(0x1A102A50);

  static const List<Color> onboardingBackgroundGradient = [
    gradientStart,
    gradientMiddle,
    gradientDeep,
    gradientEnd,
  ];

  /// Dashboard background light grey color `#F9FBFE`
  static const Color dashboardBg = Color(0xFFF9FBFE);

  /// Water Metrics Card Gradient Background colors for new user '#9BB3C9' '#6F8AA3"
  static const List<Color> newUserWaterQualityGradient = [
    Color(0xFF9BB3C9), // Start color
    Color(0xFF6F8AA3), // End color
  ];

  /// New User Metrics color '#9EADBA', '#EDF1F6', '#EEF2F6'
  static const Color newUserMetricValue = Color(0xFF9EADBA);
  static const Color newUserMetricPlaceholder = Color(0xFFEDF1F6);
  static const Color newUserMetricChartPlaceholder = Color(0xFFEEF2F6);

  /// New User Upcoming Service icon '#8193A5'
  static const Color newUserIcon = Color(0xFF8193A5);

  /// pH Level Status background '#E6F6EE'
  static const Color phStatusBg = Color(0xFFE6F6EE);

  /// Notification badge red color `#F44336`
  static const Color notificationRed = Color(0xFFF44336);

  /// Unread or Pending notification text color #A12525
  static const Color notificationAlertText = Color(0xFFA12525);

  /// Status "Normal" indicator green color `#4CAF50`
  static const Color statusGreen = Color(0xFF4CAF50);

  /// In range status text green color '#157A4C'
  static const Color inRangeGreen = Color(0xFF157A4C);

  /// Status "Normal" pill background green color `#E8F5E9`
  static const Color statusGreenBg = Color(0xFFE8F5E9);

  /// Border color for cards and dividers `#E0E6ED`
  static const Color cardBorder = Color(0xFFE0E6ED);

  /// Status "High" indicator background color `#FDF3E0`
  static const Color statusHighBg = Color(0xFFFFF3E0);

  /// Status "High" indicator text color `#8A5A00`
  static const Color statusHighText = Color(0xFF8A5A00);

  /// Notes hint text color `#757575`
  static const Color notesHint = Color(0xFF757575);

  /// Photo Upload button border color `#9BC4FF`
  static const Color photoUploadBorderColor = Color(0xFF9BC4FF);

  /// Providers strip background color `#FDF4E7`
  static const Color providersStripBg = Color(0xFFFDF4E7);

  /// Recurring Quote Card background color `#E9EEFC`
  static const Color recurringQuoteBg = Color(0xFFE9EEFC);

  /// Photo Viewer Background color `#0F1A24`
  static const Color photoViewerBg = Color(0xFF0F1A24);

  /// Photo info text color '#9FB8D8'
  static const Color photoInfoText = Color(0xFF9FB8D8);

  /// Rate Technician star  color '#7A8794'
  static const Color rateTechnicianStar = Color(0xFF7A8794);

  /// Linear gradient colors for the Water Quality card
  static const List<Color> waterQualityGradient = [
    Color(0xFF1668D6), // Primary Blue
    Color(0xFF62A1F4), // Light Blue
  ];
}
