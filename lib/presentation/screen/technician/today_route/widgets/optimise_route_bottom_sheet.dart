import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Modal bottom sheet: "Optimise today's route"
class OptimiseRouteBottomSheet extends StatelessWidget {
  final VoidCallback? onApply;
  final VoidCallback? onKeepCurrent;

  const OptimiseRouteBottomSheet({
    super.key,
    this.onApply,
    this.onKeepCurrent,
  });

  static Future<void> show(
    BuildContext context, {
    VoidCallback? onApply,
    VoidCallback? onKeepCurrent,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => OptimiseRouteBottomSheet(
        onApply: onApply,
        onKeepCurrent: onKeepCurrent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top drag handle
              Center(
                child: Container(
                  width: 36.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD6DFE8),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              14.verticalSpace,

              // Header Row: Title & Close Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Optimise today’s route',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.darkNavy,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    borderRadius: BorderRadius.circular(16.r),
                    child: Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF3F6FA),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.close_rounded,
                          size: 18.w,
                          color: AppColors.darkNavy,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              6.verticalSpace,

              // Subtitle
              Text(
                'Six stops, one already done. Here is what we would change.',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGrey,
                  height: 1.4,
                ),
              ),
              18.verticalSpace,

              // Comparison cards: Now (70.9 mi) vs Optimised (58.4 mi)
              _buildComparisonCardsRow(),
              12.verticalSpace,

              // Pill badge: "✓ 12.5 mi · 55 min saved"
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2F6EC),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_rounded,
                        size: 14.w,
                        color: const Color(0xFF0F7645),
                      ),
                      6.horizontalSpace,
                      Text(
                        '12.5 mi · 55 min saved',
                        style: TextStyle(
                          fontFamily: AppTypography.poppinsFont,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF0F7645),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.verticalSpace,

              // Section: Why this order
              Text(
                'Why this order',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.darkNavy,
                ),
              ),
              12.verticalSpace,

              // Why this order list card
              _buildReasonsCard(),
              16.verticalSpace,

              // Amber Recommendation Banner
              _buildRecommendationBanner(),
              20.verticalSpace,

              // "Apply new order" Primary Blue Button
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onApply?.call();
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
                    'Apply new order',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              12.verticalSpace,

              // "Keep current order" Outline/Secondary Pill Button
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onKeepCurrent?.call();
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.r),
                    ),
                  ),
                  child: Text(
                    'Keep current order',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkNavy,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildComparisonCardsRow() {
    return Row(
      children: [
        // "Now" Card
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(18.r),
              border: Border.all(color: const Color(0xFFEDF2F7), width: 1),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x06102A50),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Now',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGrey,
                  ),
                ),
                4.verticalSpace,
                Text(
                  '70.9 mi',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.darkNavy,
                    height: 1.15,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'ends 4:10 pm',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 11.sp,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
        14.horizontalSpace,

        // "Optimised" Card (Mint green background)
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F6EE),
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Column(
              children: [
                Text(
                  'Optimised',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0F7645),
                  ),
                ),
                4.verticalSpace,
                Text(
                  '58.4 mi',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF0F7645),
                    height: 1.15,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'ends 3:15 pm',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 11.sp,
                    color: const Color(0xFF0F7645),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReasonsCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFEDF2F7), width: 1),
      ),
      child: Column(
        children: [
          // 1. Marta Diaz -> 2nd
          _buildReasonRow(
            icon: Icon(
              Icons.water_drop_outlined,
              size: 19.w,
              color: const Color(0xFFC5221F),
            ),
            iconBg: const Color(0xFFFDF0F0),
            title: 'Marta Diaz → 2nd',
            description:
                'Free chlorine 0.4 ppm, below safe range. Earliest slot that clears it today.',
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFF0F3F6)),

          // 2. Clay Shannon + Quinn Hull paired
          _buildReasonRow(
            icon: SvgPicture.asset(
              AppAssets.icWrench,
              width: 18.w,
              height: 18.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
            iconBg: const Color(0xFFEDF4FE),
            title: 'Clay Shannon + Quinn Hull paired',
            description:
                'Both need a salt-cell service and the parts are already on your truck.',
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFF0F3F6)),

          // 3. 12.5 fewer miles
          _buildReasonRow(
            icon: SvgPicture.asset(
              AppAssets.icRoute,
              width: 18.w,
              height: 18.w,
              colorFilter: const ColorFilter.mode(
                Color(0xFF0F7645),
                BlendMode.srcIn,
              ),
            ),
            iconBg: const Color(0xFFE2F6EC),
            title: '12.5 fewer miles',
            description:
                'Reordering also removes a double-back across the river.',
          ),
        ],
      ),
    );
  }

  Widget _buildReasonRow({
    required Widget icon,
    required Color iconBg,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38.w,
            height: 38.w,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(child: icon),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkNavy,
                  ),
                ),
                3.verticalSpace,
                Text(
                  description,
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
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationBanner() {
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
            child: Text(
              'A recommendation, not an instruction. Keep your own order if you prefer, or re-optimise on the road.',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF7A4D05),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
