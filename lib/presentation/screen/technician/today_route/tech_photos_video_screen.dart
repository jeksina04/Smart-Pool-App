import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Screen: "T · Stop detail — Photos & Video (3/15) · Video (1/2)"
/// Displays:
/// - Header Bar: Circular back button and "Photos (3/15) · Video (1/2)" title
/// - 2x2 Photos grid: "before", "after", "filter", and dashed upload photo button
/// - Geotag notice text
/// - Pending upload queue banner: "Upload queue: 2 pending — never blocks job completion"
/// - "Videos (1/2)" section with list of recorded videos (Before · 12s, Office only, Send now)
/// - Record Video button (white pill)
/// - Take Photo button (white pill)
/// - Next → AI check button (primary blue pill)
class TechPhotosVideoScreen extends StatefulWidget {
  const TechPhotosVideoScreen({super.key});

  @override
  State<TechPhotosVideoScreen> createState() => _TechPhotosVideoScreenState();
}

class _TechPhotosVideoScreenState extends State<TechPhotosVideoScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  final List<Map<String, dynamic>> _recordedVideos = [
    {
      'title': 'Before · 12s',
      'size': '3.8 MB · no audio',
      'badge': 'Office only',
      'transfer': 'Wi-Fi only',
      'action': 'Send now',
    },
  ];

  Future<void> _recordVideo() async {
    try {
      final XFile? video = await _imagePicker.pickVideo(
        source: ImageSource.camera,
        maxDuration: const Duration(seconds: 15),
      );

      if (video != null) {
        final file = File(video.path);
        int fileSizeBytes = 0;
        if (await file.exists()) {
          fileSizeBytes = await file.length();
        }
        final double mb = fileSizeBytes > 0
            ? (fileSizeBytes / (1024 * 1024))
            : 3.5;
        final sizeText = '${mb.toStringAsFixed(1)} MB · no audio';

        setState(() {
          _recordedVideos.add({
            'title': 'Video ${_recordedVideos.length + 1} · 15s',
            'size': sizeText,
            'badge': 'Office only',
            'transfer': 'Wi-Fi only',
            'action': 'Send now',
            'path': video.path,
          });
        });
      }
    } catch (e) {
      debugPrint('Error recording video: $e');
    }
  }

  Future<void> _takePhoto() async {
    try {
      final XFile? photo = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
        maxWidth: 1920,
        maxHeight: 1080,
      );
      if (photo != null) {
        // photo captured
      }
    } catch (e) {
      debugPrint('Error taking photo: $e');
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
            _buildHeaderBar(),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 2x2 Photo Grid
                    _buildPhotoGrid(),
                    12.verticalSpace,

                    // Geotag caption
                    Text(
                      'Auto timestamped and geotagged · compressed before upload · duplicate shots are rejected',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 12.sp,
                        color: const Color(0xFF7D8A99),
                        height: 1.4,
                      ),
                    ),
                    14.verticalSpace,

                    // Upload queue banner (soft blue)
                    _buildUploadQueueBanner(),
                    20.verticalSpace,

                    // "Videos" Section Header with dynamic count
                    Text(
                      'Videos (${_recordedVideos.length}/2)',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 17.5.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.darkNavy,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      'Max 15s each · no audio · 3.8 / 12.0 MB this visit',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 12.5.sp,
                        color: const Color(0xFF7D8A99),
                      ),
                    ),
                    12.verticalSpace,

                    // Dynamic Video list items
                    ...List.generate(_recordedVideos.length, (index) {
                      final item = _recordedVideos[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: _buildVideoItemCard(item),
                      );
                    }),
                    8.verticalSpace,

                    // Record Video Button (Opens Camera up to 15s)
                    _buildActionButton(
                      icon: Icons.camera_alt_outlined,
                      label: 'Record Video',
                      onTap: _recordVideo,
                    ),
                    12.verticalSpace,

                    // Take Photo Button
                    _buildActionButton(
                      icon: Icons.camera_alt_outlined,
                      label: 'Take Photo',
                      onTap: _takePhoto,
                    ),
                    16.verticalSpace,

                    // Next → AI check Button
                    _buildNextButton(),
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

  Widget _buildHeaderBar() {
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
            'Photos (3/15) · Video (1/2)',
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

  Widget _buildPhotoGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildPhotoTile('before')),
            14.horizontalSpace,
            Expanded(child: _buildPhotoTile('after')),
          ],
        ),
        14.verticalSpace,
        Row(
          children: [
            Expanded(child: _buildPhotoTile('filter')),
            14.horizontalSpace,
            Expanded(child: _buildAddPhotoDashedTile()),
          ],
        ),
      ],
    );
  }

  Widget _buildPhotoTile(String label) {
    return Container(
      height: 110.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF86ACEC), Color(0xFF5E93EA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12102A50),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildAddPhotoDashedTile() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(18.r),
      child: Container(
        height: 110.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: const Color(0xFFCCE1FD),
            width: 1.5,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.camera_alt_outlined,
            size: 28.w,
            color: AppColors.primaryBlue,
          ),
        ),
      ),
    );
  }

  Widget _buildUploadQueueBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF4FF),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.refresh_rounded,
            size: 18.w,
            color: AppColors.primaryBlue,
          ),
          10.horizontalSpace,
          Expanded(
            child: Text(
              'Upload queue: 2 pending — never blocks job completion',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 12.5.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryBlue,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoItemCard(Map<String, dynamic> item) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
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
          Row(
            children: [
              Icon(
                Icons.camera_alt_outlined,
                size: 20.w,
                color: AppColors.darkNavy,
              ),
              10.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'] as String? ?? 'Video',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkNavy,
                      ),
                    ),
                    2.verticalSpace,
                    Text(
                      item['size'] as String? ?? 'no audio',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 12.sp,
                        color: const Color(0xFF7D8A99),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF4FF),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  item['badge'] as String? ?? 'Office only',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 11.5.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
          12.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item['transfer'] as String? ?? 'Wi-Fi only',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 12.sp,
                  color: const Color(0xFF7D8A99),
                ),
              ),
              Text(
                item['action'] as String? ?? 'Send now',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 12.5.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryBlue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
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
          onTap: onTap,
          borderRadius: BorderRadius.circular(26.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20.w,
                color: AppColors.darkNavy,
              ),
              8.horizontalSpace,
              Text(
                label,
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

  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.techAiPhotoCheck);
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
          'Next → AI check',
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
