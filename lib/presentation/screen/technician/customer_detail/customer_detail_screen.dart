import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

import 'widgets/customer_detail_header_bar.dart';

/// Screen displaying Customer Details for a Technician
/// Matches design from screenshot:
/// - Customer profile card (avatar, name, address, phone action)
/// - Stat cards: Health score & Next visit day
/// - Navigation list card:
///     - Pool & equipment
///     - Service history
///     - Work orders (with badge)
///     - Items / shopping (with badge)
/// - Bottom Call / Text Customer pill button
class CustomerDetailScreen extends StatelessWidget {
  final String name;
  final String address;
  final String frequency;
  final int healthScore;
  final String nextVisit;
  final int workOrdersCount;
  final int shoppingItemsCount;

  const CustomerDetailScreen({
    super.key,
    this.name = 'Alicia Keys',
    this.address = '26 Marina Way',
    this.frequency = 'weekly',
    this.healthScore = 92,
    this.nextVisit = 'Mon',
    this.workOrdersCount = 1,
    this.shoppingItemsCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Bar with back chevron & centered customer name
            CustomerDetailHeaderBar(
              title: name,
              onBack: () => Navigator.of(context).maybePop(),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  children: [
                    // 1. Customer Profile Card
                    _buildProfileCard(context),
                    16.verticalSpace,

                    // 2. Health & Next Visit Stat Cards
                    _buildStatCardsRow(),
                    16.verticalSpace,

                    // 3. Navigation Menu Items Card
                    _buildMenuCard(context),
                    24.verticalSpace,

                    // 4. Primary Call / Text Customer Button
                    _buildCallTextButton(context),
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

  Widget _buildProfileCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
      child: Row(
        children: [
          // Person Avatar Icon box
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              color: const Color(0xFFEDF4FE),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Center(
              child: Icon(
                Icons.person_outline_rounded,
                size: 26.w,
                color: AppColors.primaryBlue,
              ),
            ),
          ),
          14.horizontalSpace,

          // Name & address · frequency
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkNavy,
                  ),
                ),
                4.verticalSpace,
                Text(
                  '$address · $frequency',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.5.sp,
                    color: AppColors.textGrey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          10.horizontalSpace,

          // Phone Call Button
          InkWell(
            onTap: () {
              // Trigger call action
            },
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF7FAFD),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFEFF2F6), width: 1),
              ),
              child: Center(
                child: Icon(
                  Icons.phone_outlined,
                  size: 20.w,
                  color: AppColors.darkNavy,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCardsRow() {
    return Row(
      children: [
        // Health Stat Card
        Expanded(
          child: Container(
            height: 100.h,
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Health',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.5.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGrey,
                  ),
                ),
                4.verticalSpace,
                Text(
                  '$healthScore',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF0F7645), // Green
                  ),
                ),
              ],
            ),
          ),
        ),
        14.horizontalSpace,

        // Next visit Stat Card
        Expanded(
          child: Container(
            height: 100.h,
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Next visit',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.5.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGrey,
                  ),
                ),
                4.verticalSpace,
                Text(
                  nextVisit,
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF0B223E), // Dark navy
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuCard(BuildContext context) {
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
          // 1. Pool & equipment
          _buildMenuRow(
            icon: Icons.build_outlined,
            iconBgColor: const Color(0xFFEDF4FE),
            iconColor: AppColors.primaryBlue,
            title: 'Pool & equipment',
            onTap: () {
              Navigator.of(context).pushNamed(Routes.poolEquipment);
            },
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFF0F3F6)),

          // 2. Service history
          _buildMenuRow(
            icon: Icons.access_time_rounded,
            iconBgColor: const Color(0xFFEDF4FE),
            iconColor: AppColors.primaryBlue,
            title: 'Service history',
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.technicianServiceHistory,
                arguments: name,
              );
            },
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFF0F3F6)),

          // 3. Work orders
          _buildMenuRow(
            icon: Icons.assignment_outlined,
            iconBgColor: const Color(0xFFEDF4FE),
            iconColor: AppColors.primaryBlue,
            title: 'Work orders',
            badgeText: workOrdersCount > 0 ? '$workOrdersCount' : null,
            badgeBgColor: const Color(0xFFE2EDFE),
            badgeTextColor: AppColors.primaryBlue,
            onTap: () {
              Navigator.of(context).pushNamed(Routes.workOrders);
            },
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFF0F3F6)),

          // 4. Items / shopping
          _buildMenuRow(
            icon: Icons.shopping_cart_outlined,
            iconBgColor: const Color(0xFFEDF4FE),
            iconColor: AppColors.primaryBlue,
            title: 'Items / shopping',
            badgeText: shoppingItemsCount > 0 ? '$shoppingItemsCount' : null,
            badgeBgColor: const Color(0xFFFFF1D6),
            badgeTextColor: const Color(0xFFC07000),
            onTap: () {
              Navigator.of(context).pushNamed(Routes.shoppingList);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuRow({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    String? badgeText,
    Color? badgeBgColor,
    Color? badgeTextColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            // Icon in rounded square
            Container(
              width: 38.w,
              height: 38.w,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 20.w,
                  color: iconColor,
                ),
              ),
            ),
            14.horizontalSpace,

            // Title
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 14.5.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkNavy,
                ),
              ),
            ),

            // Optional Badge
            if (badgeText != null) ...[
              Container(
                width: 22.w,
                height: 22.w,
                decoration: BoxDecoration(
                  color: badgeBgColor ?? const Color(0xFFE2EDFE),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    badgeText,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                      color: badgeTextColor ?? AppColors.primaryBlue,
                    ),
                  ),
                ),
              ),
              10.horizontalSpace,
            ],

            // Chevron
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

  Widget _buildCallTextButton(BuildContext context) {
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
            // Call / text customer action
          },
          borderRadius: BorderRadius.circular(26.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone_outlined,
                size: 20.w,
                color: AppColors.darkNavy,
              ),
              10.horizontalSpace,
              Text(
                'Call / Text Customer',
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
