import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ez_localization/ez_localization.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

/// Layout for the Water Quality card and smaller measurement cards
class WaterMetricsSection extends StatelessWidget {
  const WaterMetricsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Left Side: Large Water Quality Card
        Expanded(
          flex: 4,
          child: Container(
            height: 231.h,
            width: 170.5.w,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: AppColors.waterQualityGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    context.getString('water_quality'),
                    style: AppTypography.infoLabel.copyWith(color: AppColors.white)
                ),
                4.verticalSpace,
                Text(
                    "Good", // --> Replace with actual quality
                    style: AppTypography.cardValueLarge
                ),
                4.verticalSpace,
                Text(
                    context.getString('last_checked_day',{'day' : 'today'}), // --> Replace with actual date
                    style: AppTypography.infoText
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white),
                        shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset(
                        AppAssets.icHeart,
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        8.horizontalSpace,

        /// Right Side: Column of small metric cards (pH, Chlorine)
        Expanded(
          flex: 5,
          child: Column(
            children: [
              _buildSmallMetric(context, context.getString('ph_level'), "7.2"), // --> Replace with actual pH value
              16.verticalSpace,
              _buildSmallMetric(
                  context,
                  context.getString('chlorine_level'),
                  "1.5",  // --> Replace with actual chlorine value
                  unit: "ppm"
              ),
            ],
          ),
        )
      ],
    );
  }

  /// Helper to build small white measurement cards with wave charts
  Widget _buildSmallMetric(BuildContext context, String title, String value, {String? unit}) {
    return Container(
      padding: EdgeInsets.all(12.w),
      height: 108.h,
      width: 170.5.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 10,
              offset: const Offset(0, 4)
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.cardLabel),
          8.verticalSpace,
          Row(
            children: [
              Text(value, style: AppTypography.metricValue),
              if (unit != null) ...[
                2.horizontalSpace,
                Text(
                    unit,
                    style: AppTypography.metricValue.copyWith(fontSize: 13.sp)
                )
              ],
              8.horizontalSpace,
              /// "Normal" status badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                    color: unit == null
                        ? AppColors.statusGreenBg
                        : AppColors.primaryBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r)
                ),
                child: Text(
                  "Normal", // --> Replace with actual status
                  style: AppTypography.badgeText.copyWith(
                    color: unit == null
                        ? AppColors.statusGreen
                        : AppColors.primaryBlue,
                  ),
                ),
              )
            ],
          ),
          12.verticalSpace,
          /// Animated wave-like placeholder
          SizedBox(
            height: 20.h,
            width: double.infinity,
            child: CustomPaint(
                painter: WavePainter(title.contains("pH") ? AppColors.statusGreen : AppColors.primaryBlue)
            ),
          )
        ],
      ),
    );
  }
}

/// Custom painter for the wave line charts inside metric cards
// --> Replace with actual wave line chart
class WavePainter extends CustomPainter {
  final Color color;
  WavePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    var path = Path()..moveTo(0, size.height / 2);
    path.quadraticBezierTo(size.width * 0.25, 0, size.width * 0.5, size.height / 2);
    path.quadraticBezierTo(size.width * 0.75, size.height, size.width, size.height / 2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}