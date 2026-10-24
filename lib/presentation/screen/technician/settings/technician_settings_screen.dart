import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

import 'widgets/location_settings_card.dart';
import 'widgets/settings_tile_row.dart';
import 'widgets/technician_profile_card.dart';
import 'widgets/technician_settings_header_bar.dart';

/// Screen: "Settings" for Technician
class TechnicianSettingsScreen extends StatefulWidget {
  const TechnicianSettingsScreen({super.key});

  @override
  State<TechnicianSettingsScreen> createState() => _TechnicianSettingsScreenState();
}

class _TechnicianSettingsScreenState extends State<TechnicianSettingsScreen> {
  bool _pushNotifications = true;
  bool _dataSaver = false;
  String _units = 'US';
  String _photoQuality = 'High';
  bool _shareLocation = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            /// Header bar with back button and centered title
            TechnicianSettingsHeaderBar(
              onBack: () => Navigator.of(context).maybePop(),
            ),

            /// Scrollable Body Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 1. Profile Summary Card
                    TechnicianProfileCard(
                      initials: 'RD',
                      name: 'Ray Delgado',
                      subtitle: 'Technician · ID 24 · ★ 4.8',
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.technicianProfile);
                      },
                    ),
                    16.verticalSpace,

                    /// 2. General Settings Card (Push notifications, Data saver, Units, Photo quality, etc.)
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
                        children: [
                          /// Push notifications toggle
                          SettingsTileRow(
                            title: 'Push notifications',
                            trailing: Switch(
                              value: _pushNotifications,
                              onChanged: (val) {
                                setState(() => _pushNotifications = val);
                              },
                              activeColor: AppColors.white,
                              activeTrackColor: AppColors.primaryBlue,
                              inactiveThumbColor: AppColors.white,
                              inactiveTrackColor: const Color(0xFFD8DFE7),
                            ),
                          ),
                          _buildDivider(),

                          /// Data saver toggle
                          SettingsTileRow(
                            title: 'Data saver',
                            subtitle: 'Upload photos on Wi-Fi only',
                            trailing: Switch(
                              value: _dataSaver,
                              onChanged: (val) {
                                setState(() => _dataSaver = val);
                              },
                              activeColor: AppColors.white,
                              activeTrackColor: AppColors.primaryBlue,
                              inactiveThumbColor: AppColors.white,
                              inactiveTrackColor: const Color(0xFFD8DFE7),
                            ),
                          ),
                          _buildDivider(),

                          /// Units selector
                          SettingsTileRow(
                            title: 'Units',
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _units,
                                  style: TextStyle(
                                    fontFamily: AppTypography.poppinsFont,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textGrey,
                                  ),
                                ),
                                4.horizontalSpace,
                                Icon(
                                  Icons.chevron_right_rounded,
                                  size: 20.w,
                                  color: const Color(0xFF9AA5B5),
                                ),
                              ],
                            ),
                            onTap: () {
                              // Toggle or select units
                              setState(() {
                                _units = _units == 'US' ? 'Metric' : 'US';
                              });
                            },
                          ),
                          _buildDivider(),

                          /// Photo quality selector
                          SettingsTileRow(
                            title: 'Photo quality',
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _photoQuality,
                                  style: TextStyle(
                                    fontFamily: AppTypography.poppinsFont,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textGrey,
                                  ),
                                ),
                                4.horizontalSpace,
                                Icon(
                                  Icons.chevron_right_rounded,
                                  size: 20.w,
                                  color: const Color(0xFF9AA5B5),
                                ),
                              ],
                            ),
                            onTap: () {
                              // Select photo quality
                            },
                          ),
                          _buildDivider(),

                          /// Sync status row with red badge
                          SettingsTileRow(
                            leadingIcon: _buildIconContainer(
                              icon: Icons.sync_rounded,
                            ),
                            title: 'Sync status',
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 20.w,
                                  height: 20.w,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFECEB),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                      fontFamily: AppTypography.poppinsFont,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFFD32F2F),
                                    ),
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
                            onTap: () {
                              Navigator.of(context).pushNamed(Routes.syncStatus);
                            },
                          ),
                          _buildDivider(),

                          /// Roles & permissions with pill badge
                          SettingsTileRow(
                            leadingIcon: _buildIconContainer(
                              icon: Icons.shield_outlined,
                            ),
                            title: 'Roles &\npermissions',
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 3.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEFF2F6),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Text(
                                    'Lead technician',
                                    style: TextStyle(
                                      fontFamily: AppTypography.poppinsFont,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkNavy,
                                    ),
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
                            onTap: () {},
                          ),
                          _buildDivider(),

                          /// Change password
                          SettingsTileRow(
                            leadingIcon: _buildIconContainer(
                              icon: Icons.lock_outline_rounded,
                            ),
                            title: 'Change password',
                            trailing: Icon(
                              Icons.chevron_right_rounded,
                              size: 20.w,
                              color: const Color(0xFF9AA5B5),
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed(Routes.changePassword);
                            },
                          ),
                          _buildDivider(),

                          /// Report a problem
                          SettingsTileRow(
                            leadingIcon: _buildIconContainer(
                              icon: Icons.warning_amber_rounded,
                            ),
                            title: 'Report a problem',
                            subtitle: 'Goes to your office with your sync log\nattached',
                            trailing: Icon(
                              Icons.chevron_right_rounded,
                              size: 20.w,
                              color: const Color(0xFF9AA5B5),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    24.verticalSpace,

                    /// 3. Location Section Header
                    Text(
                      'Location',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.darkNavy,
                      ),
                    ),
                    12.verticalSpace,

                    /// 4. Location Settings Card
                    LocationSettingsCard(
                      isLocationSharingEnabled: _shareLocation,
                      onToggle: (val) {
                        setState(() => _shareLocation = val);
                      },
                      onPrivacyPolicyTap: () {},
                    ),
                    24.verticalSpace,

                    /// 5. App Version Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'App version',
                          style: TextStyle(
                            fontFamily: AppTypography.poppinsFont,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGrey,
                          ),
                        ),
                        Text(
                          '1.0.0 (build 24)',
                          style: TextStyle(
                            fontFamily: AppTypography.poppinsFont,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,

                    /// 6. Log out button
                    _buildLogoutButton(),
                    16.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconContainer({required IconData icon}) {
    return Container(
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(
        color: const Color(0xFFE9F1FE),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 19.w,
          color: AppColors.primaryBlue,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: Color(0xFFF0F3F6),
    );
  }

  Widget _buildLogoutButton() {
    return Container(
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFE5E9F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08102A50),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Logout logic
          },
          borderRadius: BorderRadius.circular(24.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.logout_rounded,
                size: 18.w,
                color: AppColors.darkNavy,
              ),
              8.horizontalSpace,
              Text(
                'Log out',
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
}
