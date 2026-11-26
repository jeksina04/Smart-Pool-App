import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Screen: "T · Stop detail — Briefing before job start"
/// Displays 30-second brief:
/// - "What is different about this pool today"
/// - Chlorine drift card with test history chips
/// - Open work order row
/// - On your truck for this stop row
/// - Gate code row
/// - Last visit row
/// - Account standing banner
/// - Customer note banner
/// - Big "Start the job" button
class TechStopBriefingScreen extends StatelessWidget {
  final String customerName;
  final String gateCode;
  final String dogStatus;

  const TechStopBriefingScreen({
    super.key,
    this.customerName = 'Alicia Keys',
    this.gateCode = '#1324',
    this.dogStatus = 'dog in the garden',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Bar with circular back button and Customer name
            _buildHeaderBar(context),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subtitle: "What is different about this pool today"
                    Text(
                      'What is different about this pool today',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF7D8A99),
                      ),
                    ),
                    12.verticalSpace,

                    // Card 1: Chlorine drifting card
                    _buildChlorineDriftCard(),
                    16.verticalSpace,

                    // Card 2: Actions & Info list card (Open work order, Truck items, Gate code, Last visit)
                    _buildInfoListCard(context),
                    14.verticalSpace,

                    // Banner 1: Account is in good standing (Light blue banner)
                    _buildAccountStandingBanner(),
                    10.verticalSpace,

                    // Banner 2: Customer note (Amber banner)
                    _buildCustomerNoteBanner(),
                    20.verticalSpace,

                    // Big "Start the job" button (primary blue pill with checkmark)
                    _buildStartJobButton(context),
                    14.verticalSpace,

                    // Footer footnote text
                    Center(
                      child: Text(
                        'Everything here came from data already on the phone — no extra taps, no waiting on signal.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppTypography.poppinsFont,
                          fontSize: 12.sp,
                          color: const Color(0xFF7D8A99),
                          height: 1.4,
                        ),
                      ),
                    ),
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
            customerName,
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

  Widget _buildChlorineDriftCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + "3 visits" badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Chlorine has been drifting down',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkNavy,
                  ),
                ),
              ),
              8.horizontalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF3E2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  '3 visits',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 11.5.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFB57008),
                  ),
                ),
              ),
            ],
          ),
          12.verticalSpace,

          // Test History Chips: 21 Jul · FC 2.8 | 28 Jul · FC 2.1 | Today · FC ?
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              _buildHistoryChip('21 Jul · FC 2.8'),
              _buildHistoryChip('28 Jul · FC 2.1'),
              _buildHistoryChip('Today · FC ?'),
            ],
          ),
          14.verticalSpace,

          // Description text
          Text(
            'Down each visit even though the dose was followed. Worth checking the salt cell output before you top up again.',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 13.sp,
              color: const Color(0xFF5D6B7C),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryChip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F3F7),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: AppTypography.poppinsFont,
          fontSize: 11.5.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF5D6B7C),
        ),
      ),
    );
  }

  Widget _buildInfoListCard(BuildContext context) {
    return Container(
      width: double.infinity,
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
          // 1. Open work order
          _buildInfoRow(
            icon: SvgPicture.asset(
              AppAssets.icWrench,
              width: 18.w,
              height: 18.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
            title: 'Open work order',
            subtitle: 'Salt cell service —\napproved 1 Aug',
            badge: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: const Color(0xFFEEF4FF),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                'Do today',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 11.5.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
            showChevron: true,
            isTopRounded: true,
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.techWorkOrderDetail,
                arguments: {
                  'orderNumber': 'WO #1042',
                  'type': 'Repair',
                  'status': 'Approved',
                  'dueDate': 'Fri 8 Aug',
                  'scopeOfWork':
                      'Strip and deep-clean the cartridge filter, replace both O-rings, pressure test, and log the pressure reading before and after.',
                  'customerNote':
                      '"Pressure gauge has been reading high since the storm."',
                  'partsCount': 2,
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(height: 1, color: Color(0xFFF0F3F7)),
          ),

          // 2. On your truck for this stop
          _buildInfoRow(
            icon: SvgPicture.asset(
              AppAssets.icShoppingList,
              width: 20.w,
              height: 20.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
            title: 'On your truck for this stop',
            subtitle: 'Salt ×1 · cal-hypo 1 lb',
            badge: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: const Color(0xFFE2F6EC),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                'Loaded',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 11.5.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F7645),
                ),
              ),
            ),
            showChevron: true,
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.techOnYourTruck,
                arguments: {
                  'customerName': customerName,
                  'address': '26 Marina Way',
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(height: 1, color: Color(0xFFF0F3F7)),
          ),

          // 3. Gate code
          _buildInfoRow(
            icon: SvgPicture.asset(
              AppAssets.icLock,
              width: 18.w,
              height: 18.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
            title: 'Gate code',
            subtitle: '$gateCode · $dogStatus',
            showChevron: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(height: 1, color: Color(0xFFF0F3F7)),
          ),

          // 4. Last visit
          _buildInfoRow(
            icon: Icon(
              Icons.access_time_rounded,
              size: 20.w,
              color: AppColors.primaryBlue,
            ),
            title: 'Last visit',
            subtitle: '28 Jul · Ray · 7/7 tasks · 4 photos',
            showChevron: true,
            isBottomRounded: true,
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.techVisitDetail,
                arguments: {
                  'visitDate': '28 Jul',
                  'technicianName': 'Ray Delgado',
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required Widget icon,
    required String title,
    required String subtitle,
    Widget? badge,
    bool showChevron = false,
    bool isTopRounded = false,
    bool isBottomRounded = false,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.vertical(
          top: isTopRounded ? Radius.circular(20.r) : Radius.zero,
          bottom: isBottomRounded ? Radius.circular(20.r) : Radius.zero,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon container in soft blue circle
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

              // Title and Subtitle
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
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              8.horizontalSpace,

              // Badge (e.g. "Do today", "Loaded")
              if (badge != null) ...[
                badge,
                6.horizontalSpace,
              ],

              // Chevron right
              if (showChevron)
                Icon(
                  Icons.chevron_right_rounded,
                  size: 22.w,
                  color: const Color(0xFF9AA5B5),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountStandingBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF4FF),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Icon(
              Icons.check_rounded,
              size: 16.w,
              color: AppColors.primaryBlue,
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 12.5.sp,
                  color: AppColors.primaryBlue,
                  height: 1.4,
                ),
                children: const [
                  TextSpan(
                    text: 'Account is in good standing. ',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text: 'Nothing to collect, and no reason to skip.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerNoteBanner() {
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
                  height: 1.4,
                ),
                children: const [
                  TextSpan(
                    text: 'Customer note (2 Aug): ',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text: '“Please close the side gate, the dog gets out.”',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartJobButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            Routes.techChecklist,
            arguments: {
              'title': 'Checklist',
            },
          );
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
              'Start the job',
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
}
