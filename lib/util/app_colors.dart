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

  /// Timer disabled button colors
  static const Color timerButtonBg = Color(0xFFD8DFE7);
  static const Color timerButtonText = Color(0xFFA9B4BF);

  /// Quick Action label color #3A4750
  static const Color quickActionLabel = Color(0xFF3A4750);

  static const List<Color> onboardingBackgroundGradient = [
    gradientStart,
    gradientMiddle,
    gradientDeep,
    gradientEnd,
  ];

  /// Dashboard background light grey color `#F9FBFE`
  static const Color dashboardBg = Color(0xFFF9FBFE);

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

  /// Linear gradient colors for the Water Quality card
  static const List<Color> waterQualityGradient = [
    Color(0xFF1668D6), // Primary Blue
    Color(0xFF62A1F4), // Light Blue
  ];
}
