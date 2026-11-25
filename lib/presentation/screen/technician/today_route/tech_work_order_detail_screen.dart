import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Screen: "T · Work order detail (WO #1042)"
/// Displays:
/// - Header: Circular back button and "WO #1042" title
/// - Top Card: Type (Repair), Status (Approved), Due (Fri 8 Aug)
/// - Scope of work Card: Explanation text
/// - Customer note Card: Quote from customer
/// - Parts used Card: Shopping cart icon, "Parts used", "2 items" and chevron
/// - Photo tiles: Existing photo thumbnail and empty dashed border photo upload container
/// - Bottom Button: Full width "Mark Complete" blue button
class TechWorkOrderDetailScreen extends StatefulWidget {
  final String orderNumber;
  final String? customer;
  final String type;
  final String? priority;
  final Color? priorityBgColor;
  final Color? priorityTextColor;
  final String status;
  final Color? statusBgColor;
  final Color? statusTextColor;
  final String dueDate;
  final String scopeOfWork;
  final String customerNote;
  final int partsCount;

  const TechWorkOrderDetailScreen({
    super.key,
    this.orderNumber = 'WO #1042',
    this.customer,
    this.type = 'Repair',
    this.priority,
    this.priorityBgColor,
    this.priorityTextColor,
    this.status = 'Approved',
    this.statusBgColor,
    this.statusTextColor,
    this.dueDate = 'Fri 8 Aug',
    this.scopeOfWork =
        'Strip and deep-clean the cartridge filter, replace both O-rings, pressure test, and log the pressure reading before and after.',
    this.customerNote = '"Pressure gauge has been reading high since the storm."',
    this.partsCount = 2,
  });

  @override
  State<TechWorkOrderDetailScreen> createState() => _TechWorkOrderDetailScreenState();
}

class _TechWorkOrderDetailScreenState extends State<TechWorkOrderDetailScreen> {
  File? _capturedImageFile;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _onCapturePhoto() async {
    try {
      final XFile? photo = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
        maxWidth: 1920,
        maxHeight: 1080,
      );

      if (photo != null) {
        setState(() {
          _capturedImageFile = File(photo.path);
        });
      }
    } catch (e) {
      debugPrint('Error capturing photo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Header Bar
            _buildHeaderBar(context),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Card 1: Type, Status, Due
                    _buildMetaCard(),
                    16.verticalSpace,

                    // Card 2: Scope of work
                    _buildScopeOfWorkCard(),
                    16.verticalSpace,

                    // Card 3: Customer note
                    _buildCustomerNoteCard(),
                    16.verticalSpace,

                    // Card 4: Parts used row
                    _buildPartsUsedCard(context),
                    20.verticalSpace,

                    // Photo Tiles Row
                    _buildPhotoTilesRow(),
                    24.verticalSpace,

                    // Mark Complete Button
                    _buildMarkCompleteButton(context),
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
            widget.orderNumber,
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

  Widget _buildMetaCard() {
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
          if (widget.customer != null) ...[
            _buildRow('Customer', widget.customer!, isBoldValue: true),
            14.verticalSpace,
          ],
          _buildRow('Type', widget.type, isBoldValue: true),
          if (widget.priority != null) ...[
            14.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Priority',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 14.sp,
                    color: const Color(0xFF7D8A99),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: widget.priorityBgColor ?? const Color(0xFFFFECEB),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    widget.priority!,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: widget.priorityTextColor ?? const Color(0xFFD63B30),
                    ),
                  ),
                ),
              ],
            ),
          ] else ...[
            14.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 14.sp,
                    color: const Color(0xFF7D8A99),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: widget.statusBgColor ?? const Color(0xFFEAF8F0),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    widget.status,
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: widget.statusTextColor ?? const Color(0xFF0F7645),
                    ),
                  ),
                ),
              ],
            ),
          ],
          14.verticalSpace,
          _buildRow('Due', widget.dueDate, isBoldValue: true),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isBoldValue = false}) {
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
            fontWeight: isBoldValue ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildScopeOfWorkCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Scope of work',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 15.5.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),
          10.verticalSpace,
          Text(
            widget.scopeOfWork,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 13.5.sp,
              color: const Color(0xFF5D6B7C),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerNoteCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Customer note',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 15.5.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),
          10.verticalSpace,
          Text(
            widget.customerNote,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 13.5.sp,
              color: const Color(0xFF5D6B7C),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPartsUsedCard(BuildContext context) {
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.shoppingList);
          },
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              children: [
                // Shopping list icon in soft blue rounded square
                Container(
                  width: 42.w,
                  height: 42.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDF4FE),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.icShoppingList,
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

                // Title
                Expanded(
                  child: Text(
                    'Parts used',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkNavy,
                    ),
                  ),
                ),

                // Trailing: "1 item" / "2 items" + chevron
                Text(
                  widget.partsCount == 1 ? '1 item' : '${widget.partsCount} items',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 13.5.sp,
                    color: const Color(0xFF7D8A99),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                6.horizontalSpace,
                Icon(
                  Icons.chevron_right_rounded,
                  size: 22.w,
                  color: const Color(0xFF9AA5B5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoTilesRow() {
    return Row(
      children: [
        // Left Tile: Captured photo or placeholder
        Expanded(
          child: Container(
            height: 96.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              gradient: _capturedImageFile == null
                  ? const LinearGradient(
                      colors: [Color(0xFF9BBDF9), Color(0xFF679EF5)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: _capturedImageFile != null ? AppColors.white : null,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14102A50),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: _capturedImageFile != null
                ? Image.file(
                    _capturedImageFile!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                : Center(
                    child: Text(
                      'photo',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
          ),
        ),
        16.horizontalSpace,

        // Right Tile: Dashed/Bordered Camera button to capture photo
        Expanded(
          child: InkWell(
            onTap: _onCapturePhoto,
            borderRadius: BorderRadius.circular(16.r),
            child: Container(
              height: 96.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: const Color(0xFFCCE1FD),
                  width: 1.5,
                  style: BorderStyle.solid,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 26.w,
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMarkCompleteButton(BuildContext context) {
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
        child: Text(
          'Mark Complete',
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 15.5.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
