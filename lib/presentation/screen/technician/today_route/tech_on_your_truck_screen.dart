import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Screen: "T34b · On your truck for this stop"
/// Displays:
/// - Header Bar: Back button and "On your truck" title
/// - Subtitle: customerName · address (e.g. "Alicia Keys · 26 Marina Way")
/// - Truck items list card:
///   - Bag of salt 40lb (cart icon, x1 · for the salt cell, Loaded green badge)
///   - Cal-hypo shock (flask icon, 1 lb · chlorine top-up, Loaded green badge)
///   - Salt cell O-ring (wrench icon, x1 · spare for the service, Missing red badge)
/// - Missing item alert banner: "1 item missing. Add it to your shopping list or carry on without it."
/// - "Mark as used" blue pill button (with checkmark)
/// - "Open shopping list" white pill button (with cart icon)
class TechOnYourTruckScreen extends StatelessWidget {
  final String customerName;
  final String address;

  const TechOnYourTruckScreen({
    super.key,
    this.customerName = 'Alicia Keys',
    this.address = '26 Marina Way',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Bar
            _buildHeaderBar(context),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subtitle: Alicia Keys · 26 Marina Way
                    Text(
                      '$customerName · $address',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF7D8A99),
                      ),
                    ),
                    16.verticalSpace,

                    // Items on Truck Card
                    _buildItemsCard(),
                    16.verticalSpace,

                    // Missing items notice banner
                    _buildMissingAlertBanner(),
                    24.verticalSpace,

                    // Mark as used Button (blue pill)
                    _buildMarkAsUsedButton(context),
                    14.verticalSpace,

                    // Open shopping list Button (white pill)
                    _buildOpenShoppingListButton(context),
                    24.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => Navigator.of(context).maybePop(),
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0C102A50),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 18.w,
                    color: AppColors.darkNavy,
                  ),
                ),
              ),
            ),
          ),
          Text(
            'On your truck',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 17.5.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
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
          // 1. Bag of salt 40lb
          _buildItemRow(
            icon: SvgPicture.asset(
              AppAssets.icShoppingList,
              width: 20.w,
              height: 20.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
            title: 'Bag of salt 40lb',
            subtitle: '×1 · for the salt cell',
            badgeText: 'Loaded',
            badgeBgColor: const Color(0xFFE2F6EC),
            badgeTextColor: const Color(0xFF0F7645),
            isTopRounded: true,
          ),
          _buildDivider(),

          // 2. Cal-hypo shock
          _buildItemRow(
            icon: SvgPicture.asset(
              AppAssets.icFlask,
              width: 18.w,
              height: 18.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
            title: 'Cal-hypo shock',
            subtitle: '1 lb · chlorine top-up',
            badgeText: 'Loaded',
            badgeBgColor: const Color(0xFFE2F6EC),
            badgeTextColor: const Color(0xFF0F7645),
          ),
          _buildDivider(),

          // 3. Salt cell O-ring
          _buildItemRow(
            icon: SvgPicture.asset(
              AppAssets.icWrench,
              width: 18.w,
              height: 18.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
            title: 'Salt cell O-ring',
            subtitle: '×1 · spare for the service',
            badgeText: 'Missing',
            badgeBgColor: const Color(0xFFFDE8E8),
            badgeTextColor: const Color(0xFFE53935),
            isBottomRounded: true,
          ),
        ],
      ),
    );
  }

  Widget _buildItemRow({
    required Widget icon,
    required String title,
    required String subtitle,
    required String badgeText,
    required Color badgeBgColor,
    required Color badgeTextColor,
    bool isTopRounded = false,
    bool isBottomRounded = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
      child: Row(
        children: [
          Container(
            width: 42.w,
            height: 42.w,
            decoration: BoxDecoration(
              color: const Color(0xFFEDF4FE),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(child: icon),
          ),
          14.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkNavy,
                  ),
                ),
                3.verticalSpace,
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.5.sp,
                    color: const Color(0xFF7D8A99),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          8.horizontalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: badgeBgColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              badgeText,
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: badgeTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const Divider(height: 1, color: Color(0xFFF0F3F7)),
    );
  }

  Widget _buildMissingAlertBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9EE),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFFFECCC), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: SvgPicture.asset(
              AppAssets.icAlert,
              width: 14.w,
              height: 14.w,
              colorFilter: const ColorFilter.mode(
                Color(0xFF8B5A10),
                BlendMode.srcIn,
              ),
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 12.5.sp,
                  color: const Color(0xFF7A4D05),
                  height: 1.45,
                ),
                children: const [
                  TextSpan(
                    text: '1 item missing. ',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text: 'Add it to your shopping list or carry on without it.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMarkAsUsedButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).maybePop();
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
              Icons.check_rounded,
              size: 20.w,
              color: AppColors.white,
            ),
            8.horizontalSpace,
            Text(
              'Mark as used',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 15.5.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpenShoppingListButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(26.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06102A50),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.shoppingList);
          },
          borderRadius: BorderRadius.circular(26.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.icShoppingList,
                width: 20.w,
                height: 20.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.darkNavy,
                  BlendMode.srcIn,
                ),
              ),
              8.horizontalSpace,
              Text(
                'Open shopping list',
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
