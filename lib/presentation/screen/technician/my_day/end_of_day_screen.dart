import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

import 'flagged_for_office_screen.dart';
import 'items_used_today_screen.dart';
import 'widgets/my_day_header_bar.dart';

/// Screen: "End of day"
/// Summary of stops completed, paid hours, miles, un-synced items notice,
/// and items/invoices raised before finishing.
class EndOfDayScreen extends StatefulWidget {
  final bool initialSynced;

  const EndOfDayScreen({
    super.key,
    this.initialSynced = false,
  });

  @override
  State<EndOfDayScreen> createState() => _EndOfDayScreenState();
}

class _EndOfDayScreenState extends State<EndOfDayScreen> {
  late bool _isSynced;

  @override
  void initState() {
    super.initState();
    _isSynced = widget.initialSynced;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Bar with circular back button & title "End of day"
            MyDayHeaderBar(
              title: 'End of day',
              onBack: () => Navigator.of(context).maybePop(),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. Top Card: Date & Stops completed
                    _buildStopsCompletedCard(),
                    16.verticalSpace,

                    // 2. Three Stat Cards (Paid, On site, Miles)
                    _buildMetricsRow(),
                    24.verticalSpace,

                    // 3. Section Title: "Before you finish"
                    Text(
                      'Before you finish',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.darkNavy,
                      ),
                    ),
                    14.verticalSpace,

                    // 4. Warning notice banner (or Synced success banner)
                    if (_isSynced)
                      _buildSyncedSuccessBanner()
                    else ...[
                      _buildSyncWarningBanner(),
                      14.verticalSpace,

                      // 5. "Sync now" blue button
                      _buildSyncNowButton(),
                    ],
                    16.verticalSpace,

                    // 6. Action items card (Flagged for office, Items used today, Invoices raised)
                    _buildActionItemsCard(),
                    24.verticalSpace,

                    // 7. "End my day" button (Disabled or Active Primary Blue)
                    _buildEndMyDayButton(),

                    // 8. Bottom explanation text (only when not synced)
                    if (!_isSynced) ...[
                      12.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                          'Sync first. This is deliberate — a day of work stranded on a handset is the one thing that cannot be recovered from the office.',
                          style: TextStyle(
                            fontFamily: AppTypography.poppinsFont,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGrey,
                            height: 1.45,
                          ),
                        ),
                      ),
                    ],
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

  Widget _buildStopsCompletedCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
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
          Text(
            'Monday 4 August',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 13.5.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textGrey,
            ),
          ),
          8.verticalSpace,
          Text(
            '6 of 6',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 32.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.darkNavy,
              height: 1.2,
            ),
          ),
          8.verticalSpace,
          Text(
            'stops completed',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textGrey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsRow() {
    return Row(
      children: [
        _buildMetricItem(label: 'Paid', value: '9.3 h'),
        12.horizontalSpace,
        _buildMetricItem(label: 'On site', value: '7.4 h'),
        12.horizontalSpace,
        _buildMetricItem(label: 'Miles', value: '25.9'),
      ],
    );
  }

  Widget _buildMetricItem({required String label, required String value}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
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
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textGrey,
              ),
            ),
            4.verticalSpace,
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.darkNavy,
                  height: 1.15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSyncedSuccessBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F6EE),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Icon(
              Icons.check_rounded,
              size: 16.w,
              color: const Color(0xFF0F7645),
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: Text(
              'Everything is synced. Nothing is left on this phone.',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 12.5.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F7645),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSyncWarningBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF0F0),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Text(
              '⌂',
              style: TextStyle(
                fontSize: 11.sp,
                color: const Color(0xFFC5221F),
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
                  color: const Color(0xFF901815),
                  height: 1.45,
                ),
                children: const [
                  TextSpan(
                    text: '3 jobs and 11 photos are still on this phone. ',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text:
                        'If you end your day now they stay here until you are next online — and nobody in the office can see today’s work.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSyncNowButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const EndOfDayScreen(initialSynced: true),
            ),
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
            SvgPicture.asset(
              AppAssets.icSync,
              width: 19.w,
              height: 19.w,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
            10.horizontalSpace,
            Text(
              'Sync now',
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

  Widget _buildActionItemsCard() {
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
          // 1. Flagged for the office
          _buildActionItemRow(
            iconAsset: AppAssets.icAlert,
            title: 'Flagged for the office',
            subtitle: '1 — Kaiden Roth, pump seal weeping',
            showChevron: true,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const FlaggedForOfficeScreen(),
                ),
              );
            },
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFF0F3F6)),

          // 2. Items used today
          _buildActionItemRow(
            iconAsset: AppAssets.icShoppingList,
            title: 'Items used today',
            subtitle: 'Salt ×2 · cal-hypo 1 lb · o-ring ×1',
            showChevron: true,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ItemsUsedTodayScreen(),
                ),
              );
            },
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFF0F3F6)),

          // 3. Invoices raised
          _buildActionItemRow(
            iconAsset: AppAssets.icDocument,
            title: 'Invoices raised',
            subtitle: '2 drafts sent to the office',
            showChevron: false,
          ),
        ],
      ),
    );
  }

  Widget _buildActionItemRow({
    required String iconAsset,
    required String title,
    required String subtitle,
    required bool showChevron,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: const Color(0xFFEDF4FE),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconAsset,
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkNavy,
                    ),
                  ),
                  3.verticalSpace,
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ),
            if (showChevron) ...[
              6.horizontalSpace,
              Icon(
                Icons.chevron_right_rounded,
                size: 20.w,
                color: const Color(0xFF9AA5B5),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildEndMyDayButton() {
    return Container(
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        color: _isSynced ? AppColors.primaryBlue : const Color(0xFFD9E2EC),
        borderRadius: BorderRadius.circular(26.r),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _isSynced
              ? () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                }
              : null,
          borderRadius: BorderRadius.circular(26.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.icClock,
                width: 18.w,
                height: 18.w,
                colorFilter: ColorFilter.mode(
                  _isSynced ? AppColors.white : const Color(0xFF98A6B8),
                  BlendMode.srcIn,
                ),
              ),
              10.horizontalSpace,
              Text(
                'End my day',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 15.5.sp,
                  fontWeight: FontWeight.w700,
                  color: _isSynced ? AppColors.white : const Color(0xFF98A6B8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
