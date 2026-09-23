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

  static const List<Color> onboardingBackgroundGradient = [
    gradientStart,
    gradientMiddle,
    gradientDeep,
    gradientEnd,
  ];
}
