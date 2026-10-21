import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/util/app_assets.dart';

import 'package:flutter_skeleton/presentation/service/navigation.dart';

import 'widgets/technician_menu_header.dart';
import 'widgets/technician_menu_item.dart';

/// Technician Drawer / Menu content
/// Can be used both as a standard Drawer widget or as a standalone screen/modal.
class TechnicianMenuScreen extends StatelessWidget {
  final VoidCallback? onClose;
  final VoidCallback? onLogout;
  final String technicianName;
  final String technicianRole;
  final bool isStandalone;

  const TechnicianMenuScreen({
    super.key,
    this.onClose,
    this.onLogout,
    this.technicianName = 'Ray Delgado',
    this.technicianRole = 'Lead technician · ID 24',
    this.isStandalone = false,
  });

  @override
  Widget build(BuildContext context) {
    final menuBody = Container(
      width: 290.w,
      height: double.infinity,
      color: AppColors.white,
      child: SafeArea(
        top: false,
        bottom: true,
        child: Column(
          children: [
            /// Top Blue Header with User Info & Close Button
            TechnicianMenuHeader(
              name: technicianName,
              roleWithId: technicianRole,
              onClose: onClose,
            ),

            /// Scrollable List of Navigation Menu Items
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    TechnicianMenuItem(
                      icon: SvgPicture.asset(
                        AppAssets.icRoute,
                        width: 18.w,
                        height: 18.w,
                        colorFilter: const ColorFilter.mode(
                          AppColors.primaryBlue,
                          BlendMode.srcIn,
                        ),
                      ),
                      title: "Today's Route",
                      onTap: () {
                        onClose?.call();
                      },
                    ),
                    _buildDivider(),

                    TechnicianMenuItem(
                      icon: SvgPicture.asset(
                        AppAssets.icWrench,
                        width: 18.w,
                        height: 18.w,
                        colorFilter: const ColorFilter.mode(
                          AppColors.primaryBlue,
                          BlendMode.srcIn,
                        ),
                      ),
                      title: 'Work Orders',
                      badgeText: '3',
                      badgeColor: const Color(0xFFE2EDFE),
                      badgeTextColor: AppColors.primaryBlue,
                      onTap: () {
                        onClose?.call();
                        Navigator.of(context).pushNamed(Routes.workOrders);
                      },
                    ),
                    _buildDivider(),

                    TechnicianMenuItem(
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 19.w,
                        color: AppColors.primaryBlue,
                      ),
                      title: 'Shopping List',
                      badgeText: '5',
                      badgeColor: const Color(0xFFFFF1D6),
                      badgeTextColor: const Color(0xFFC07000),
                      onTap: () {
                        onClose?.call();
                        Navigator.of(context).pushNamed(Routes.shoppingList);
                      },
                    ),
                    _buildDivider(),

                    TechnicianMenuItem(
                      icon: Icon(
                        Icons.access_time_rounded,
                        size: 19.w,
                        color: AppColors.primaryBlue,
                      ),
                      title: 'Service History',
                      onTap: () {
                        onClose?.call();
                        Navigator.of(context).pushNamed(Routes.technicianServiceHistory);
                      },
                    ),
                    _buildDivider(),

                    TechnicianMenuItem(
                      icon: Icon(
                        Icons.person_outline_rounded,
                        size: 19.w,
                        color: AppColors.primaryBlue,
                      ),
                      title: 'Customers',
                      onTap: () {},
                    ),
                    _buildDivider(),

                    TechnicianMenuItem(
                      icon: Icon(
                        Icons.sync_rounded,
                        size: 20.w,
                        color: AppColors.primaryBlue,
                      ),
                      title: 'Sync Status',
                      badgeText: '3',
                      badgeColor: const Color(0xFFFFE5E5),
                      badgeTextColor: const Color(0xFFD32F2F),
                      onTap: () {
                        onClose?.call();
                        Navigator.of(context).pushNamed(Routes.syncStatus);
                      },
                    ),
                    _buildDivider(),

                    TechnicianMenuItem(
                      icon: SvgPicture.asset(
                        AppAssets.icBell,
                        width: 18.w,
                        height: 18.w,
                        colorFilter: const ColorFilter.mode(
                          AppColors.primaryBlue,
                          BlendMode.srcIn,
                        ),
                      ),
                      title: 'Notifications',
                      badgeText: '2',
                      badgeColor: const Color(0xFFE2EDFE),
                      badgeTextColor: AppColors.primaryBlue,
                      onTap: () {
                        onClose?.call();
                        Navigator.of(context).pushNamed(Routes.technicianNotifications);
                      },
                    ),
                    _buildDivider(),

                    TechnicianMenuItem(
                      icon: SvgPicture.asset(
                        AppAssets.icSettings,
                        width: 18.w,
                        height: 18.w,
                        colorFilter: const ColorFilter.mode(
                          AppColors.primaryBlue,
                          BlendMode.srcIn,
                        ),
                      ),
                      title: 'Settings',
                      onTap: () {},
                    ),
                    _buildDivider(),

                    TechnicianMenuItem(
                      icon: Icon(
                        Icons.access_time_rounded,
                        size: 19.w,
                        color: AppColors.primaryBlue,
                      ),
                      title: 'My day',
                      subtitle: 'Start and end your day,\nhours, breaks',
                      onTap: () {},
                    ),
                    _buildDivider(),

                    TechnicianMenuItem(
                      icon: Icon(
                        Icons.warning_amber_rounded,
                        size: 20.w,
                        color: AppColors.primaryBlue,
                      ),
                      title: 'Help & Support',
                      onTap: () {},
                    ),
                    _buildDivider(),

                    TechnicianMenuItem(
                      icon: Icon(
                        Icons.bookmark_border_rounded,
                        size: 20.w,
                        color: AppColors.primaryBlue,
                      ),
                      title: 'Legal & Terms',
                      onTap: () {},
                    ),
                    16.verticalSpace,
                  ],
                ),
              ),
            ),

            /// Bottom Log out Pill Button
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
              child: _buildLogoutButton(context),
            ),
          ],
        ),
      ),
    );

    if (!isStandalone) {
      return menuBody;
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: [
          menuBody,
          Expanded(
            child: GestureDetector(
              onTap: onClose ?? () => Navigator.of(context).maybePop(),
              behavior: HitTestBehavior.opaque,
              child: Container(
                color: Colors.black.withValues(alpha: 0.35),
              ),
            ),
          ),
        ],
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

  Widget _buildLogoutButton(BuildContext context) {
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
          onTap: onLogout ?? () {},
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
