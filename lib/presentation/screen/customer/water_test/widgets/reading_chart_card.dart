import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

/// A card that renders a trend line chart based on dynamic data points.
class ReadingChartCard extends StatelessWidget {
  final String title;
  final Color lineColor;

  final List<double> dataPoints;

  const ReadingChartCard({
    super.key,
    required this.title,
    required this.lineColor,
    required this.dataPoints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      height: 122.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.infoLabel),
          const Spacer(),
          // The Chart Area
          SizedBox(
            height: 60.h,
            width: double.infinity,
            child: CustomPaint(
              painter: ReadingTrendPainter(
                data: dataPoints,
                color: lineColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom Painter that draws a smooth line based on provided numeric data.
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
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    // Add some vertical breathing room so the curve doesn't
    // touch the top/bottom of the chart.
    const verticalPadding = 8.0;

    final chartHeight = size.height - (verticalPadding * 2);

    // Calculate min/max
    final minValue = data.reduce(
          (a, b) => a < b ? a : b,
    );

    final maxValue = data.reduce(
          (a, b) => a > b ? a : b,
    );

    final range = maxValue - minValue;

    // Prevent division by zero when all values are equal.
    final safeRange = range == 0 ? 1.0 : range;

    // Convert values into screen coordinates.
    final points = <Offset>[];

    final dx = size.width / (data.length - 1);

    for (int i = 0; i < data.length; i++) {
      final normalized =
          (data[i] - minValue) / safeRange;

      final x = i * dx;

      final y = verticalPadding +
          chartHeight -
          (normalized * chartHeight);

      points.add(Offset(x, y));
    }

    final path = Path();

    path.moveTo(
      points.first.dx,
      points.first.dy,
    );

    // Smooth cubic Bézier curve
    for (int i = 0; i < points.length - 1; i++) {
      final current = points[i];
      final next = points[i + 1];

      final previous =
      i > 0 ? points[i - 1] : current;

      final following =
      i + 2 < points.length
          ? points[i + 2]
          : next;

      // Control point 1
      final controlPoint1 = Offset(
        current.dx +
            (next.dx - previous.dx) / 6,
        current.dy +
            (next.dy - previous.dy) / 6,
      );

      // Control point 2
      final controlPoint2 = Offset(
        next.dx -
            (following.dx - current.dx) / 6,
        next.dy -
            (following.dy - current.dy) / 6,
      );

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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}