import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import '../../../../service/navigation.dart';

class WaterMetricsSection extends StatelessWidget {
  final bool isNewUser;
  final List<double> phData, chlorineData;

  const WaterMetricsSection({
    super.key,
    required this.isNewUser,
    required this.phData,
    required this.chlorineData,
  });

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(flex: 4, child: _waterCard(context)),
      8.horizontalSpace,
      Expanded(
        flex: 5,
        child: Column(
          children: [
            _buildMetric(context, 'ph_level', '7.2', phData), // --> Replace with actual pH
            16.verticalSpace,
            _buildMetric(context, 'chlorine_level', '1.5', chlorineData, unit: 'ppm'), // --> Replace with actual chlorine
          ],
        ),
      ),
    ],
  );

  Widget _waterCard(BuildContext context) => GestureDetector(
    onTap: isNewUser
        ? null
        : () => Navigator.pushNamed(context, Routes.poolHealth),
    child: Container(
      height: 231.h,
      padding: EdgeInsets.all(isNewUser ? 16.w : 20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isNewUser
              ? AppColors.newUserWaterQualityGradient
              : AppColors.waterQualityGradient,
        ),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.getString('water_quality'),
              style: AppTypography.waterQualityLabel),
          4.verticalSpace,
          Text(
            isNewUser
                ? context.getString('no_readings_yet')
                : "Good", // --> Replace with actual water quality
            style: isNewUser
                ? AppTypography.noReadingsYet
                : AppTypography.cardValueLarge,
            softWrap: true,
          ),
          4.verticalSpace,
          Text(
            isNewUser
                ? context.getString('first_visit_notice')
                : context.getString('last_checked_day', {'day': 'today'}), // --> Replace with actual date
            style: AppTypography.infoText,
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withOpacity(.35)),
              ),
              child: SvgPicture.asset(
                isNewUser ? AppAssets.icFlask : AppAssets.icHeart,
                colorFilter: const ColorFilter.mode(
                    Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _buildMetric(
      BuildContext context,
      String key,
      String value,
      List<double> data, {
        String? unit,
      }) {
    final title = context.getString(key);
    return isNewUser
        ? _pendingMetric(context, title)
        : _readingMetric(context, title, value, data, unit: unit);
  }

  Widget _pendingMetric(BuildContext context, String title) => Container(
    height: 102.h,
    width: double.infinity,
    padding: EdgeInsets.all(14.w),
    decoration: _cardDecoration(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.cardTitle),
        4.verticalSpace,
        Row(
          children: [
            Text('—', style: AppTypography.metricValue.copyWith(
              color: AppColors.newUserMetricValue,
            )),
            4.horizontalSpace,
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.newUserMetricPlaceholder,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  context.getString('awaiting_first_visit'),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.latestReadings,
                ),
              ),
            ),
          ],
        ),
        8.verticalSpace,
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.newUserMetricChartPlaceholder,
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _readingMetric(
      BuildContext context,
      String title,
      String value,
      List<double> data, {
        String? unit,
      }) =>
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, Routes.waterTest),
        child: Container(
          height: 108.h,
          width: double.infinity,
          padding: EdgeInsets.all(12.w),
          decoration: _cardDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTypography.cardTitle),
              8.verticalSpace,
              Row(
                children: [
                  Text(value, style: AppTypography.metricValue),
                  if (unit != null) ...[
                    2.horizontalSpace,
                    Text(unit, style: AppTypography.unitText),
                  ],
                  8.horizontalSpace,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: unit == null
                          ? AppColors.phStatusBg
                          : AppColors.recurringQuoteBg,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text("Normal", // --> Replace with actual status
                        style: AppTypography.badgeText.copyWith(
                          color: unit == null
                              ? AppColors.inRangeGreen
                              : AppColors.infoBannerText,
                        )),
                  ),
                ],
              ),
              12.verticalSpace,
              Expanded(
                child: CustomPaint(
                  size: Size(double.infinity, 20.h),
                  painter: ReadingTrendPainter(
                    data: data,
                    color: title.contains('pH')
                        ? AppColors.profileActive
                        : AppColors.chlorineChartColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  BoxDecoration _cardDecoration() => BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(16.r),
    boxShadow: [
      BoxShadow(
        color: AppColors.cardShadow,
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  );
}

class ReadingTrendPainter extends CustomPainter {
  final List<double> data;
  final Color color;

  ReadingTrendPainter({required this.data, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (data.length < 2) return;

    final min = data.reduce((a, b) => a < b ? a : b);
    final max = data.reduce((a, b) => a > b ? a : b);
    final range = max == min ? 1.0 : max - min;
    final points = List.generate(
      data.length,
          (i) => Offset(
        i * size.width / (data.length - 1),
        size.height - (data[i] - min) / range * size.height,
      ),
    );

    final path = Path()..moveTo(points.first.dx, points.first.dy);

    for (int i = 0; i < points.length - 1; i++) {
      final a = points[i], b = points[i + 1];
      final prev = i > 0 ? points[i - 1] : a;
      final next = i + 2 < points.length ? points[i + 2] : b;

      path.cubicTo(
        a.dx + (b.dx - prev.dx) / 6,
        a.dy + (b.dy - prev.dy) / 6,
        b.dx - (next.dx - a.dx) / 6,
        b.dy - (next.dy - a.dy) / 6,
        b.dx,
        b.dy,
      );
    }

    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..isAntiAlias = true,
    );
  }

  @override
  bool shouldRepaint(covariant ReadingTrendPainter old) =>
      old.color != color ||
          old.data.length != data.length ||
          !List.generate(data.length, (i) => old.data.length > i &&
              old.data[i] == data[i]).every((same) => same);
}