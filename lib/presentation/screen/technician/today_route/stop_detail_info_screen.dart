import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';
import 'widgets/stop_detail_options_bottom_sheet.dart';

/// Screen: "T · Stop detail — Info ★"
/// Displays Stop details with Info / Pool toggle, address, access warning,
/// pool health score, service history, items needed, work orders, Navigate and Start Job.
class StopDetailInfoScreen extends StatefulWidget {
  final String customerName;
  final String address;
  final String cityStateZip;
  final String gateCode;
  final String dogStatus;
  final String accessNote;
  final int healthScore;
  final int itemsNeededCount;
  final int workOrdersCount;
  final int initialTab;

  const StopDetailInfoScreen({
    super.key,
    this.customerName = 'Alicia Keys',
    this.address = '26 Marina Way',
    this.cityStateZip = 'Austin, TX 78704',
    this.gateCode = 'Gate #1324',
    this.dogStatus = 'Dog on site',
    this.accessNote =
        'Access: Enter through the left gate — dog is friendly but keep the gate shut.',
    this.healthScore = 92,
    this.itemsNeededCount = 2,
    this.workOrdersCount = 1,
    this.initialTab = 0,
  });

  @override
  State<StopDetailInfoScreen> createState() => _StopDetailInfoScreenState();
}

class _StopDetailInfoScreenState extends State<StopDetailInfoScreen> {
  late int _selectedTab; // 0 for Info, 1 for Pool

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTab;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Bar with circular back button, customer name, and 3-dots more menu
            _buildHeaderBar(),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Segmented Selector: Info | Pool
                    _buildSegmentedTabSelector(),
                    16.verticalSpace,

                    if (_selectedTab == 0) ...[
                      // Customer Address Card (Phone + Location icons, Gate + Dog pills)
                      _buildCustomerAddressCard(),
                      14.verticalSpace,

                      // Amber Access Notice Banner
                      _buildAccessNoticeBanner(),
                      16.verticalSpace,

                      // Pool Health Score Card
                      _buildPoolHealthScoreCard(),
                      14.verticalSpace,

                      // Actions List Card (Service history, Items needed, Work orders)
                      _buildActionsListCard(),
                      24.verticalSpace,

                      // Action Buttons Row: Navigate & Start Job
                      _buildActionButtonsRow(),
                      16.verticalSpace,

                      // Footer Briefing Note
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: AppTypography.poppinsFont,
                              fontSize: 12.sp,
                              color: AppColors.textGrey,
                              height: 1.45,
                            ),
                            children: const [
                              TextSpan(text: 'You get a '),
                              TextSpan(
                                text: '30-second brief',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                text:
                                    ' on what changed since last visit before the task clock starts. Your paid day began when you left the office.',
                              ),
                            ],
                          ),
                        ),
                      ),
                      20.verticalSpace,
                    ] else ...[
                      // Pool Specifications Card
                      _buildPoolSpecsCard(),
                      20.verticalSpace,

                      // Equipment — digital passport Title
                      Text(
                        'Equipment — digital passport',
                        style: TextStyle(
                          fontFamily: AppTypography.poppinsFont,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkNavy,
                        ),
                      ),
                      12.verticalSpace,

                      // Equipment Digital Passport Card
                      _buildEquipmentPassportCard(),
                      16.verticalSpace,

                      // Add Equipment Button
                      _buildAddEquipmentButton(),
                      24.verticalSpace,
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Circular Back Button
          InkWell(
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

          // Centered Customer Name or Name · Pool
          Text(
            _selectedTab == 1
                ? '${widget.customerName} · Pool'
                : widget.customerName,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),

          // 3-dots More Menu Button
          InkWell(
            onTap: () {
              StopDetailOptionsBottomSheet.show(
                context,
                customerName: widget.customerName,
                onSkipStop: () {
                  // handle skip stop action
                },
                onMessageOffice: () {
                  // handle message office action
                },
                onReassignStop: () {
                  // handle reassign stop action
                },
              );
            },
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
                  Icons.more_vert_rounded,
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

  Widget _buildSegmentedTabSelector() {
    return Container(
      width: double.infinity,
      height: 48.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06102A50),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Info Tab
          Expanded(
            child: InkWell(
              onTap: () => setState(() => _selectedTab = 0),
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                decoration: BoxDecoration(
                  color: _selectedTab == 0
                      ? AppColors.primaryBlue
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: Text(
                    'Info',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w700,
                      color: _selectedTab == 0
                          ? AppColors.white
                          : AppColors.darkNavy,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Pool Tab
          Expanded(
            child: InkWell(
              onTap: () => setState(() => _selectedTab = 1),
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                decoration: BoxDecoration(
                  color: _selectedTab == 1
                      ? AppColors.primaryBlue
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: Text(
                    'Pool',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w700,
                      color: _selectedTab == 1
                          ? AppColors.white
                          : AppColors.darkNavy,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerAddressCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.address,
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.darkNavy,
                      ),
                    ),
                    3.verticalSpace,
                    Text(
                      widget.cityStateZip,
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
              10.horizontalSpace,

              // Circular Phone Action Icon
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(18.r),
                child: Container(
                  width: 38.w,
                  height: 38.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7FAFD),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFEBF1F7), width: 1),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.icPhone,
                      width: 17.w,
                      height: 17.w,
                      colorFilter: const ColorFilter.mode(
                        AppColors.darkNavy,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              8.horizontalSpace,

              // Circular Location / Directions Icon
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(18.r),
                child: Container(
                  width: 38.w,
                  height: 38.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7FAFD),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFEBF1F7), width: 1),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.icLocation,
                      width: 18.w,
                      height: 18.w,
                      colorFilter: const ColorFilter.mode(
                        AppColors.darkNavy,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          14.verticalSpace,
          const Divider(height: 1, thickness: 1, color: Color(0xFFF0F3F6)),
          12.verticalSpace,

          // Gate Code & Dog status pill tags
          Row(
            children: [
              // Gate pill
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFEBF1F8),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.icLock,
                      width: 13.w,
                      height: 13.w,
                      colorFilter: const ColorFilter.mode(
                        AppColors.textGrey,
                        BlendMode.srcIn,
                      ),
                    ),
                    6.horizontalSpace,
                    Text(
                      widget.gateCode,
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 11.5.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
              10.horizontalSpace,

              // Dog on site pill
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFEBF1F8),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.icAlert,
                      width: 13.w,
                      height: 13.w,
                      colorFilter: const ColorFilter.mode(
                        AppColors.textGrey,
                        BlendMode.srcIn,
                      ),
                    ),
                    6.horizontalSpace,
                    Text(
                      widget.dogStatus,
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 11.5.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAccessNoticeBanner() {
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
                Color(0xFFB57008),
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
                  fontSize: 12.sp,
                  color: const Color(0xFF7A4D05),
                  height: 1.4,
                ),
                children: const [
                  TextSpan(
                    text: 'Access: ',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text:
                        'Enter through the left gate — dog is friendly but keep the gate shut.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPoolHealthScoreCard() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.techPoolHealth,
          arguments: {
            'overallScore': widget.healthScore,
          },
        );
      },
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
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
            // Green heart icon in mint rounded container
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: const Color(0xFFE2F6EC),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.icHeart,
                  width: 22.w,
                  height: 22.w,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF0F7645),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            14.horizontalSpace,

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pool health score',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textGrey,
                    ),
                  ),
                  2.verticalSpace,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${widget.healthScore} ',
                          style: TextStyle(
                            fontFamily: AppTypography.poppinsFont,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.darkNavy,
                          ),
                        ),
                        TextSpan(
                          text: '/ 100',
                          style: TextStyle(
                            fontFamily: AppTypography.poppinsFont,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              Icons.chevron_right_rounded,
              size: 22.w,
              color: const Color(0xFF9AA5B5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionsListCard() {
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
          // 1. Service history
          _buildActionRow(
            icon: SvgPicture.asset(
              AppAssets.icClock,
              width: 19.w,
              height: 19.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
            title: 'Service history',
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.technicianServiceHistory,
                arguments: widget.customerName,
              );
            },
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFF0F3F6)),

          // 2. Items needed
          _buildActionRow(
            icon: SvgPicture.asset(
              AppAssets.icShoppingList,
              width: 19.w,
              height: 19.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
            title: 'Items needed',
            badgeText: '${widget.itemsNeededCount}',
            badgeColor: const Color(0xFFFFF1D6),
            badgeTextColor: const Color(0xFFC07000),
            onTap: () {
              Navigator.of(context).pushNamed(Routes.shoppingList);
            },
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFF0F3F6)),

          // 3. Work orders
          _buildActionRow(
            icon: SvgPicture.asset(
              AppAssets.icWrench,
              width: 19.w,
              height: 19.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
            title: 'Work orders',
            badgeText: '${widget.workOrdersCount}',
            badgeColor: const Color(0xFFE2EDFE),
            badgeTextColor: AppColors.primaryBlue,
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.techWorkOrderDetail,
                arguments: {
                  'orderNumber': 'WO #1042',
                  'customer': widget.customerName,
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
        ],
      ),
    );
  }

  Widget _buildActionRow({
    required Widget icon,
    required String title,
    String? badgeText,
    Color? badgeColor,
    Color? badgeTextColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: const Color(0xFFEDF4FE),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(child: icon),
            ),
            14.horizontalSpace,
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkNavy,
                ),
              ),
            ),
            if (badgeText != null) ...[
              Container(
                width: 22.w,
                height: 22.w,
                decoration: BoxDecoration(
                  color: badgeColor ?? const Color(0xFFE2EDFE),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    badgeText,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: badgeTextColor ?? AppColors.primaryBlue,
                    ),
                  ),
                ),
              ),
              10.horizontalSpace,
            ],
            Icon(
              Icons.chevron_right_rounded,
              size: 22.w,
              color: const Color(0xFF9AA5B5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtonsRow() {
    return Row(
      children: [
        // Navigate button (white pill)
        Expanded(
          child: Container(
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
                onTap: () {},
                borderRadius: BorderRadius.circular(26.r),
                child: Center(
                  child: Text(
                    'Navigate',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkNavy,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        14.horizontalSpace,

        // Start Job button (primary blue pill)
        Expanded(
          child: SizedBox(
            height: 52.h,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  Routes.techStopBriefing,
                  arguments: {
                    'customerName': widget.customerName,
                    'gateCode': widget.gateCode,
                    'dogStatus': widget.dogStatus,
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
              child: Text(
                'Start Job',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 15.5.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // -------------------------------------------------------------
  // POOL TAB WIDGETS
  // -------------------------------------------------------------

  /// Card 1: Pool Specifications (Volume, Sanitiser, Surface)
  Widget _buildPoolSpecsCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
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
          _buildSpecRow('Volume', '10,000 gal'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: const Divider(height: 1, color: Color(0xFFF0F3F7)),
          ),
          _buildSpecRow('Sanitiser', 'Salt / chlorine'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: const Divider(height: 1, color: Color(0xFFF0F3F7)),
          ),
          _buildSpecRow('Surface', 'Plaster'),
        ],
      ),
    );
  }

  Widget _buildSpecRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 14.5.sp,
            color: const Color(0xFF7D8A99),
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 15.sp,
            color: AppColors.darkNavy,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  /// Card 2: Equipment — digital passport (Pump, Filter, Salt cell, Heater)
  Widget _buildEquipmentPassportCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
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
          _buildEquipmentItemRow(
            title: 'Pump',
            subtitle: 'Hayward TriStar · installed 2026',
            status: 'OK',
            statusBgColor: const Color(0xFFE2F6EC),
            statusTextColor: const Color(0xFF0F7645),
            hasChevron: true,
            isTopRounded: true,
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.techEquipmentDetail,
                arguments: {
                  'title': 'Pump',
                  'makeModel': 'Hayward TriStar VS 950',
                  'serial': 'SP3206VSP-4491',
                  'fittedDate': '12 Jan 2026',
                  'warranty': 'Until Jan 2029',
                  'condition': 'OK',
                  'conditionBgColor': const Color(0xFFE2F6EC),
                  'conditionTextColor': const Color(0xFF0F7645),
                  'adviceNotice': null,
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(height: 1, color: Color(0xFFF0F3F7)),
          ),
          _buildEquipmentItemRow(
            title: 'Filter',
            subtitle: 'Pentair Clean & Clear',
            status: 'OK',
            statusBgColor: const Color(0xFFE2F6EC),
            statusTextColor: const Color(0xFF0F7645),
            hasChevron: true,
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.techEquipmentDetail,
                arguments: {
                  'title': 'Filter',
                  'makeModel': 'Pentair Clean & Clear Plus 420',
                  'serial': 'CCP420-1982',
                  'fittedDate': '05 Sep 2024',
                  'warranty': 'Until Sep 2027',
                  'condition': 'OK',
                  'conditionBgColor': const Color(0xFFE2F6EC),
                  'conditionTextColor': const Color(0xFF0F7645),
                  'adviceNotice': null,
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(height: 1, color: Color(0xFFF0F3F7)),
          ),
          _buildEquipmentItemRow(
            title: 'Salt cell',
            subtitle: '2025 · warranty to 2028',
            status: 'Watch',
            statusBgColor: const Color(0xFFFEF3E2),
            statusTextColor: const Color(0xFFB57008),
            hasChevron: true,
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.techEquipmentDetail,
                arguments: {
                  'title': 'Salt cell',
                  'makeModel': 'Hayward T-Cell-15',
                  'serial': 'TC15-88213',
                  'fittedDate': '14 Mar 2025',
                  'warranty': 'Until Mar 2028',
                  'condition': 'Watch',
                  'conditionBgColor': const Color(0xFFFEF3E2),
                  'conditionTextColor': const Color(0xFFB57008),
                  'adviceNotice':
                      '14 months old. Cell output drops noticeably after about 3 years — worth quoting a replacement before next season.',
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(height: 1, color: Color(0xFFF0F3F7)),
          ),
          _buildEquipmentItemRow(
            title: 'Heater',
            subtitle: 'Not installed',
            status: null,
            trailingWidget: Text(
              '—',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF9AA5B5),
              ),
            ),
            isBottomRounded: true,
            onTap: null,
          ),
        ],
      ),
    );
  }

  Widget _buildEquipmentItemRow({
    required String title,
    required String subtitle,
    String? status,
    Color? statusBgColor,
    Color? statusTextColor,
    bool hasChevron = false,
    Widget? trailingWidget,
    bool isTopRounded = false,
    bool isBottomRounded = false,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.vertical(
          top: isTopRounded ? Radius.circular(16.r) : Radius.zero,
          bottom: isBottomRounded ? Radius.circular(16.r) : Radius.zero,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            children: [
              // Wrench icon in rounded square
              Container(
                width: 42.w,
                height: 42.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFEDF4FE),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.icWrench,
                    width: 20.w,
                    height: 20.w,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryBlue,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              14.horizontalSpace,

              // Equipment Title and Subtitle
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

              // Status Pill (e.g. OK / Watch)
              if (status != null) ...[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: statusBgColor ?? const Color(0xFFE2F6EC),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: statusTextColor ?? const Color(0xFF0F7645),
                    ),
                  ),
                ),
                6.horizontalSpace,
              ],

              // Trailing chevron or dash
              if (trailingWidget != null)
                trailingWidget
              else if (hasChevron)
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

  /// Button 3: + Add Equipment (white rounded button)
  Widget _buildAddEquipmentButton() {
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
            Navigator.of(context).pushNamed(Routes.techAddEquipment);
          },
          borderRadius: BorderRadius.circular(26.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_rounded,
                size: 20.w,
                color: AppColors.darkNavy,
              ),
              6.horizontalSpace,
              Text(
                'Add Equipment',
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
