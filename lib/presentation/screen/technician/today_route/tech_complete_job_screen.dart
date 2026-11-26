import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Screen: "T19 · Complete stop / Complete job"
/// Displays:
/// - Header Bar: Back button and "Complete job" title
/// - Completed Overview Card:
///   - Checklist: 10 / 10
///   - Readings: Recorded
///   - Photos: 3 taken
///   - Signature: Signed
/// - System Actions info Card:
///   - "On complete, the system will"
///   - "• email the service report + photos to Alicia"
///   - "• text 'on the way' to the next customer"
/// - Note about this job * (multi-line input box):
///   - "What did you find? Anything the customer or the office should know?"
///   - "Goes on the service report the customer receives, and into the pool's history."
/// - Complete & Next Stop button (full width primary blue pill)
class TechCompleteJobScreen extends StatefulWidget {
  final String customerName;

  const TechCompleteJobScreen({
    super.key,
    this.customerName = 'Alicia',
  });

  @override
  State<TechCompleteJobScreen> createState() => _TechCompleteJobScreenState();
}

class _TechCompleteJobScreenState extends State<TechCompleteJobScreen> {
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
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
                    // Card 1: Completed Tasks Checklist, Readings, Photos, Signature
                    _buildOverviewCard(),
                    16.verticalSpace,

                    // Card 2: On complete, the system will
                    _buildSystemActionsCard(),
                    20.verticalSpace,

                    // "Note about this job *" Section Header
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: AppTypography.poppinsFont,
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.darkNavy,
                        ),
                        children: const [
                          TextSpan(text: 'Note about this job '),
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Color(0xFFE53935),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    12.verticalSpace,

                    // Note Input Box
                    _buildNoteInputCard(),
                    8.verticalSpace,

                    // Footnote below note input
                    Text(
                      'Goes on the service report the customer receives, and into the pool\'s history.',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 12.sp,
                        color: const Color(0xFF7D8A99),
                        height: 1.4,
                      ),
                    ),
                    24.verticalSpace,

                    // Complete & Next Stop Button
                    _buildCompleteButton(),
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
            'Complete job',
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

  Widget _buildOverviewCard() {
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
          // 1. Checklist
          _buildItemRow(
            icon: Icon(
              Icons.check_rounded,
              size: 20.w,
              color: AppColors.primaryBlue,
            ),
            title: 'Checklist',
            badgeText: '10 / 10',
            badgeBgColor: const Color(0xFFE2F6EC),
            badgeTextColor: const Color(0xFF0F7645),
            isTopRounded: true,
            onTap: () {
              Navigator.of(context).pushNamed(
                Routes.techChecklist,
                arguments: {'title': 'Checklist'},
              );
            },
          ),
          _buildDivider(),

          // 2. Readings
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
            title: 'Readings',
            badgeText: 'Recorded',
            badgeBgColor: const Color(0xFFE2F6EC),
            badgeTextColor: const Color(0xFF0F7645),
            onTap: () {
              Navigator.of(context).pushNamed(Routes.techWaterReadings);
            },
          ),
          _buildDivider(),

          // 3. Photos
          _buildItemRow(
            icon: Icon(
              Icons.camera_alt_outlined,
              size: 20.w,
              color: AppColors.primaryBlue,
            ),
            title: 'Photos',
            badgeText: '3 taken',
            badgeBgColor: const Color(0xFFE2F6EC),
            badgeTextColor: const Color(0xFF0F7645),
            onTap: () {
              Navigator.of(context).pushNamed(Routes.techPhotosVideo);
            },
          ),
          _buildDivider(),

          // 4. Signature
          _buildItemRow(
            icon: SvgPicture.asset(
              AppAssets.icEdit,
              width: 18.w,
              height: 18.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
            title: 'Signature',
            badgeText: 'Signed',
            badgeBgColor: const Color(0xFFE2F6EC),
            badgeTextColor: const Color(0xFF0F7645),
            isBottomRounded: true,
            onTap: () {
              Navigator.of(context).pushNamed(Routes.techCustomerSignOff);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItemRow({
    required Widget icon,
    required String title,
    required String badgeText,
    required Color badgeBgColor,
    required Color badgeTextColor,
    bool isTopRounded = false,
    bool isBottomRounded = false,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.vertical(
          top: isTopRounded ? Radius.circular(18.r) : Radius.zero,
          bottom: isBottomRounded ? Radius.circular(18.r) : Radius.zero,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            children: [
              // Icon container
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

              // Title
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

              // Status Badge
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
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const Divider(height: 1, color: Color(0xFFF0F3F7)),
    );
  }

  Widget _buildSystemActionsCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'On complete, the system will',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),
          10.verticalSpace,
          _buildBulletItem('email the service report + photos to ${widget.customerName}'),
          6.verticalSpace,
          _buildBulletItem('text "on the way" to the next customer'),
        ],
      ),
    );
  }

  Widget _buildBulletItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• ',
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 13.5.sp,
            color: const Color(0xFF5D6B7C),
            height: 1.4,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 13.sp,
              color: const Color(0xFF5D6B7C),
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNoteInputCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08102A50),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _noteController,
        maxLines: 4,
        style: TextStyle(
          fontFamily: AppTypography.poppinsFont,
          fontSize: 14.sp,
          color: AppColors.darkNavy,
        ),
        decoration: InputDecoration(
          hintText:
              'What did you find? Anything the customer or the office should know?',
          hintStyle: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 13.5.sp,
            color: const Color(0xFF7D8A99),
            height: 1.4,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  Widget _buildCompleteButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {
          // Navigates back or to today's route
          Navigator.of(context).popUntil((route) => route.isFirst);
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
          'Complete & Next Stop',
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
