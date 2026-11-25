import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';
import 'package:image_picker/image_picker.dart';

import 'widgets/tech_profile_header_bar.dart';

/// Screen: "My profile" for technician
class TechnicianProfileScreen extends StatefulWidget {
  final String technicianName;
  final String roleWithId;
  final String employmentSince;
  final String rating;
  final String totalRatings;
  final String vehicleName;
  final String vehiclePlate;
  final String payType;
  final String skillsCertifications;
  final String workersCompClass;

  const TechnicianProfileScreen({
    super.key,
    this.technicianName = 'Ray Delgado',
    this.roleWithId = 'Technician · ID 24',
    this.employmentSince = 'with NSP since Mar 2024',
    this.rating = '4.8',
    this.totalRatings = '62 ratings',
    this.vehicleName = 'White Ford Transit 250',
    this.vehiclePlate = 'Plate NSP-4471 · assigned by the office',
    this.payType = 'Hourly',
    this.skillsCertifications = 'CPO · Salt systems',
    this.workersCompClass = '5183',
  });

  @override
  State<TechnicianProfileScreen> createState() =>
      _TechnicianProfileScreenState();
}

class _TechnicianProfileScreenState extends State<TechnicianProfileScreen> {
  late String _technicianName;
  File? _profileImageFile;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _technicianName = widget.technicianName;
  }

  Future<void> _navigateToEditProfile() async {
    final result = await Navigator.of(context).pushNamed(
      Routes.technicianEditProfile,
      arguments: {
        'name': _technicianName,
      },
    );

    if (result is String && result.isNotEmpty && mounted) {
      setState(() {
        _technicianName = result;
      });
    }
  }

  String _getInitials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts[0].isEmpty) return 'RD';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  void _showPhotoSourceBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          padding: EdgeInsets.fromLTRB(
            20.w,
            16.h,
            20.w,
            24.h + MediaQuery.paddingOf(ctx).bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              18.verticalSpace,
              Text(
                'Change Profile Photo',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkNavy,
                ),
              ),
              20.verticalSpace,
              ListTile(
                leading: Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9F1FE),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.primaryBlue,
                    size: 22.w,
                  ),
                ),
                title: Text(
                  'Camera',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkNavy,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickPhoto(ImageSource.camera);
                },
              ),
              8.verticalSpace,
              ListTile(
                leading: Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9F1FE),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.photo_library_outlined,
                    color: AppColors.primaryBlue,
                    size: 22.w,
                  ),
                ),
                title: Text(
                  'Gallery',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkNavy,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickPhoto(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickPhoto(ImageSource source) async {
    try {
      final XFile? photo = await _imagePicker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1080,
        maxHeight: 1080,
      );

      if (photo != null && mounted) {
        setState(() {
          _profileImageFile = File(photo.path);
        });
      }
    } catch (e) {
      debugPrint('Error picking photo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            /// Header bar with back button, centered title, and edit button
            TechProfileHeaderBar(
              title: 'My profile',
              onBack: () => Navigator.of(context).maybePop(),
              onEdit: _navigateToEditProfile,
            ),

            /// Scrollable content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 1. Top Avatar & Details Card
                    _buildTopProfileCard(),
                    24.verticalSpace,

                    /// 2. "How customers rate you" Section
                    _buildSectionTitle('How customers rate you'),
                    12.verticalSpace,
                    _buildRatingsCard(),
                    12.verticalSpace,

                    /// Customer review cards
                    _buildCustomerReviewsCard(),
                    24.verticalSpace,

                    /// 3. "My vehicle" Section
                    _buildSectionTitle('My vehicle'),
                    12.verticalSpace,
                    _buildVehicleCard(),
                    24.verticalSpace,

                    /// 4. "Employment" Section
                    _buildSectionTitle('Employment'),
                    12.verticalSpace,
                    _buildEmploymentCard(),
                    12.verticalSpace,

                    /// Bottom info note
                    _buildEmploymentInfoBanner(),
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: AppTypography.poppinsFont,
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.darkNavy,
      ),
    );
  }

  /// 1. Top Avatar, Name, ID & Change photo button
  Widget _buildTopProfileCard() {
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
          /// Avatar Circle
          GestureDetector(
            onTap: _showPhotoSourceBottomSheet,
            child: Container(
              width: 76.w,
              height: 76.w,
              decoration: const BoxDecoration(
                color: AppColors.primaryBlue,
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.center,
              child: _profileImageFile != null
                  ? Image.file(
                      _profileImageFile!,
                      width: 76.w,
                      height: 76.w,
                      fit: BoxFit.cover,
                    )
                  : Text(
                      _getInitials(_technicianName),
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
            ),
          ),
          14.verticalSpace,

          /// Name
          Text(
            _technicianName,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.darkNavy,
            ),
          ),
          4.verticalSpace,

          /// Role & Since Info
          Text(
            '${widget.roleWithId} · ${widget.employmentSince}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textGrey,
            ),
          ),
          16.verticalSpace,

          /// Change photo pill button
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: const Color(0xFFE5E9F0)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x06102A50),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _showPhotoSourceBottomSheet,
                borderRadius: BorderRadius.circular(20.r),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        size: 16.w,
                        color: AppColors.darkNavy,
                      ),
                      8.horizontalSpace,
                      Text(
                        'Change photo',
                        style: TextStyle(
                          fontFamily: AppTypography.poppinsFont,
                          fontSize: 13.sp,
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
      ),
    );
  }

  /// 2. Ratings Score Card
  Widget _buildRatingsCard() {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.rating,
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.darkNavy,
                ),
              ),
              10.horizontalSpace,
              Row(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: 3.w),
                    child: Icon(
                      Icons.star_rounded,
                      size: 18.w,
                      color: const Color(0xFFE59819),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                widget.totalRatings,
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGrey,
                ),
              ),
            ],
          ),
          12.verticalSpace,
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 12.sp,
                color: AppColors.textGrey,
                height: 1.4,
              ),
              children: const [
                TextSpan(
                  text:
                      'Your average across the last 90 days. The office sees this beside route difficulty and on-time rate ',
                ),
                TextSpan(
                  text: '— never on its own.',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkNavy,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Reviews card container with divider
  Widget _buildCustomerReviewsCard() {
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
          _buildReviewRow(
            quote: '“Always leaves the gate locked.”',
            authorDate: 'R. Alvarez · 3 Aug',
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFF0F3F6),
          ),
          _buildReviewRow(
            quote: '“Explained what the cloudy water was.”',
            authorDate: 'O. Pike · 28 Jul',
          ),
        ],
      ),
    );
  }

  Widget _buildReviewRow({
    required String quote,
    required String authorDate,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Star in soft blue container
          Container(
            width: 38.w,
            height: 38.w,
            decoration: BoxDecoration(
              color: const Color(0xFFE9F1FE),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.star_outline_rounded,
              size: 20.w,
              color: AppColors.primaryBlue,
            ),
          ),
          14.horizontalSpace,

          /// Quote & Author
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quote,
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkNavy,
                  ),
                ),
                3.verticalSpace,
                Text(
                  authorDate,
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 3. Vehicle Card
  Widget _buildVehicleCard() {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Vehicle icon container
              Container(
                width: 38.w,
                height: 38.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFE9F1FE),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.alt_route_rounded,
                  size: 20.w,
                  color: AppColors.primaryBlue,
                ),
              ),
              14.horizontalSpace,

              /// Vehicle title & plate
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.vehicleName,
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkNavy,
                      ),
                    ),
                    3.verticalSpace,
                    Text(
                      widget.vehiclePlate,
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          12.verticalSpace,
          Text(
            'Customers are told which vehicle to expect. If you are in a different van today, tell dispatch — they change it here, not you.',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textGrey,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }

  /// 4. Employment Card
  Widget _buildEmploymentCard() {
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
          _buildEmploymentRow(
            label: 'Pay type',
            value: widget.payType,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFF0F3F6),
          ),
          _buildEmploymentRow(
            label: 'Skills & certifications',
            value: widget.skillsCertifications,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFF0F3F6),
          ),
          _buildEmploymentRow(
            label: "Workers' comp class",
            value: widget.workersCompClass,
          ),
        ],
      ),
    );
  }

  Widget _buildEmploymentRow({required String label, required String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Text(
              label,
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.darkNavy,
              ),
            ),
          ),
          12.horizontalSpace,
          Expanded(
            flex: 5,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 5. Employment Information banner
  Widget _buildEmploymentInfoBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF4FE),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Icon(
              Icons.lock_outline_rounded,
              size: 14.w,
              color: AppColors.primaryBlue,
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: Text(
              'Employment details are maintained by the office and are read-only here. Ask the office to change anything on this list.',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryBlue,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
