import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import '../../../../service/navigation.dart';

/// Layout for the Water Quality card and smaller measurement cards
class WaterMetricsSection extends StatelessWidget {
  final List<double> phData;
  final List<double> chlorineData;

  const WaterMetricsSection({
    super.key,
    required this.phData,
    required this.chlorineData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Left Side: Large Water Quality Card
        Expanded(
            flex: 4,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.poolHealth),
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
                    Text(context.getString('water_quality'),
                        style: AppTypography.infoLabel
                            .copyWith(color: AppColors.white)),
                    4.verticalSpace,
                    Text("Good", // --> Replace with actual quality
                        style: AppTypography.cardValueLarge),
                    4.verticalSpace,
                    Text(
                        context.getString('last_checked_day', {'day': 'today'}),
                        // --> Replace with actual date
                        style: AppTypography.infoText),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.white),
                            shape: BoxShape.circle),
                        child: SvgPicture.asset(AppAssets.icHeart,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn)),
                      ),
                    )
                  ],
                ),
              ),
            )),

        8.horizontalSpace,

        /// Right Side: Column of small metric cards (pH, Chlorine)
        Expanded(
          flex: 5,
          child: Column(
            children: [
              _buildSmallMetric(
                context,
                context.getString('ph_level'),
                "7.2",
                chartData: phData,
              ), // --> Replace with actual pH value
              16.verticalSpace,
              _buildSmallMetric(
                context,
                context.getString('chlorine_level'),
                "1.5", // --> Replace with actual chlorine value
                unit: "ppm",
                chartData: chlorineData,
              ),
            ],
          ),
        )
      ],
    );
  }

  /// Helper to build small white measurement cards with wave charts
  Widget _buildSmallMetric(
    BuildContext context,
    String title,
    String value, {
    String? unit,
    List<double>? chartData,
  }) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.waterTest),
      child: Container(
        padding: EdgeInsets.all(12.w),
        height: 108.h,
        width: 170.5.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: const Offset(0, 4))
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
                  Text(unit,
                      style:
                          AppTypography.metricValue.copyWith(fontSize: 13.sp))
                ],
                8.horizontalSpace,

                /// "Normal" status badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                      color: unit == null
                          ? AppColors.statusGreenBg
                          : AppColors.primaryBlue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Text(
                    "Normal", // --> Replace with actual status
                    style: AppTypography.badgeText.copyWith(
                      color: unit == null ? AppColors.inRangeGreen : AppColors.primaryBlue,
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
                painter: ReadingTrendPainter(
                  data: chartData ?? [],
                  color: title.contains("pH") ? AppColors.statusGreen : AppColors.primaryBlue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Custom painter for the wave line charts inside metric cards
class ReadingTrendPainter extends CustomPainter {
  final List<double> data;
  final Color color;

  ReadingTrendPainter({
    required this.data,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.length < 2) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    // Find data range
    final minValue = data.reduce(
      (a, b) => a < b ? a : b,
    );

    final maxValue = data.reduce(
      (a, b) => a > b ? a : b,
    );

    final range = maxValue - minValue;
    final safeRange = range == 0 ? 1.0 : range;

    // Convert data values into screen points
    final points = <Offset>[];

    final dx = size.width / (data.length - 1);

    for (int i = 0; i < data.length; i++) {
      final normalized = (data[i] - minValue) / safeRange;
      final x = i * dx;
      final y = size.height - (normalized * size.height);
      points.add(Offset(x, y),);
    }

    // Create smooth curve
    final path = Path();

    path.moveTo(points.first.dx, points.first.dy,);

    for (int i = 0; i < points.length - 1; i++) {
      final current = points[i];
      final next = points[i + 1];

      final previous = i > 0 ? points[i - 1] : current;

      final following = i + 2 < points.length ? points[i + 2] : next;

      // First Bézier control point
      final controlPoint1 = Offset(
        current.dx + (next.dx - previous.dx) / 6,
        current.dy + (next.dy - previous.dy) / 6,
      );

      // Second Bézier control point
      final controlPoint2 = Offset(
        next.dx - (following.dx - current.dx) / 6,
        next.dy - (following.dy - current.dy) / 6,
      );

      // Smooth curve instead of straight line
      path.cubicTo(
        controlPoint1.dx,
        controlPoint1.dy,
        controlPoint2.dx,
        controlPoint2.dy,
        next.dx,
        next.dy,
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
