import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Screen: "T · Stop detail — Equipment detail (e.g. Salt cell, Pump, Filter)"
/// Displays make/model, serial, fitted, warranty, condition, history events,
/// recommendation alert banner, and Photo / Work order action buttons.
class TechEquipmentDetailScreen extends StatelessWidget {
  final String title;
  final String makeModel;
  final String serial;
  final String fittedDate;
  final String warranty;
  final String condition;
  final Color conditionBgColor;
  final Color conditionTextColor;
  final List<EquipmentHistoryItem> history;
  final String? adviceNotice;

  const TechEquipmentDetailScreen({
    super.key,
    this.title = 'Salt cell',
    this.makeModel = 'Hayward T-Cell-15',
    this.serial = 'TC15-88213',
    this.fittedDate = '14 Mar 2025',
    this.warranty = 'Until Mar 2028',
    this.condition = 'Watch',
    this.conditionBgColor = const Color(0xFFFEF3E2),
    this.conditionTextColor = const Color(0xFFB57008),
    this.history = const [
      EquipmentHistoryItem(
        iconType: EquipmentHistoryIconType.check,
        title: 'Output checked',
        subtitle: '28 Jul · reading 2.9 ppm',
        author: 'Ray',
      ),
      EquipmentHistoryItem(
        iconType: EquipmentHistoryIconType.wrench,
        title: 'Cleaned',
        subtitle: '14 Jun · scale build-up removed',
        author: 'Dan',
      ),
      EquipmentHistoryItem(
        iconType: EquipmentHistoryIconType.plus,
        title: 'Fitted',
        subtitle: '14 Mar 2025',
        author: 'Ray',
      ),
    ],
    this.adviceNotice =
        '14 months old. Cell output drops noticeably after about 3 years — worth quoting a replacement before next season.',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Bar with back button and screen title
            _buildHeaderBar(context),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Equipment Info Card (Make/model, Serial, Fitted, Warranty, Condition)
                    _buildEquipmentInfoCard(),
                    24.verticalSpace,

                    // "History" Section Title
                    Text(
                      'History',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkNavy,
                      ),
                    ),
                    12.verticalSpace,

                    // History Card
                    _buildHistoryCard(),
                    16.verticalSpace,

                    // Advice Notice Banner
                    if (adviceNotice != null) ...[
                      _buildAdviceBanner(),
                      24.verticalSpace,
                    ],

                    // Action Buttons: [Photo] [Work order]
                    _buildActionButtonsRow(),
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
            title,
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

  Widget _buildEquipmentInfoCard() {
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
          _buildInfoRow('Make / model', makeModel),
          12.verticalSpace,
          _buildInfoRow('Serial', serial),
          12.verticalSpace,
          _buildInfoRow('Fitted', fittedDate),
          12.verticalSpace,
          _buildInfoRow('Warranty', warranty),
          12.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Condition',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 14.sp,
                  color: const Color(0xFF7D8A99),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: conditionBgColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  condition,
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: conditionTextColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 14.sp,
            color: const Color(0xFF7D8A99),
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 14.5.sp,
            color: AppColors.darkNavy,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryCard() {
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
        children: List.generate(history.length, (index) {
          final item = history[index];
          final isLast = index == history.length - 1;
          return Column(
            children: [
              _buildHistoryItemRow(item),
              if (!isLast)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: const Divider(height: 1, color: Color(0xFFF0F3F7)),
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildHistoryItemRow(EquipmentHistoryItem item) {
    Widget iconWidget;
    switch (item.iconType) {
      case EquipmentHistoryIconType.check:
        iconWidget = Container(
          width: 42.w,
          height: 42.w,
          decoration: BoxDecoration(
            color: const Color(0xFFEBF1F8),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: Icon(
              Icons.check_rounded,
              size: 20.w,
              color: AppColors.primaryBlue,
            ),
          ),
        );
        break;
      case EquipmentHistoryIconType.wrench:
        iconWidget = Container(
          width: 42.w,
          height: 42.w,
          decoration: BoxDecoration(
            color: const Color(0xFFEBF1F8),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              AppAssets.icWrench,
              width: 18.w,
              height: 18.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
          ),
        );
        break;
      case EquipmentHistoryIconType.plus:
        iconWidget = Container(
          width: 42.w,
          height: 42.w,
          decoration: BoxDecoration(
            color: const Color(0xFFEBF1F8),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: Icon(
              Icons.add_rounded,
              size: 20.w,
              color: AppColors.primaryBlue,
            ),
          ),
        );
        break;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Row(
        children: [
          iconWidget,
          14.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkNavy,
                  ),
                ),
                3.verticalSpace,
                Text(
                  item.subtitle,
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
          Text(
            item.author,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 12.5.sp,
              color: const Color(0xFF7D8A99),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdviceBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
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
            child: Text(
              adviceNotice!,
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 12.5.sp,
                color: const Color(0xFF7A4D05),
                height: 1.45,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtonsRow() {
    return Row(
      children: [
        // Photo Button
        Expanded(
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(25.r),
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
                borderRadius: BorderRadius.circular(25.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 20.w,
                      color: AppColors.darkNavy,
                    ),
                    8.horizontalSpace,
                    Text(
                      'Photo',
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
          ),
        ),
        14.horizontalSpace,

        // Work order Button
        Expanded(
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(25.r),
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
                borderRadius: BorderRadius.circular(25.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.icWrench,
                      width: 17.w,
                      height: 17.w,
                      colorFilter: const ColorFilter.mode(
                        AppColors.darkNavy,
                        BlendMode.srcIn,
                      ),
                    ),
                    8.horizontalSpace,
                    Text(
                      'Work order',
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
          ),
        ),
      ],
    );
  }
}

enum EquipmentHistoryIconType {
  check,
  wrench,
  plus,
}

class EquipmentHistoryItem {
  final EquipmentHistoryIconType iconType;
  final String title;
  final String subtitle;
  final String author;

  const EquipmentHistoryItem({
    required this.iconType,
    required this.title,
    required this.subtitle,
    required this.author,
  });
}
