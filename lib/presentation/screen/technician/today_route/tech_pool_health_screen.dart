import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Screen: "T · Stop detail — Pool health"
/// Shows Pool health score gauge, breakdown metrics (Equipment, Chemistry, Cleanliness, Risk),
/// why this score explanation card, and read-only technician disclaimer.
class TechPoolHealthScreen extends StatelessWidget {
  final int overallScore;
  final int equipmentScore;
  final int chemistryScore;
  final int cleanlinessScore;
  final String riskLevel;
  final String whyThisScore;

  const TechPoolHealthScreen({
    super.key,
    this.overallScore = 92,
    this.equipmentScore = 96,
    this.chemistryScore = 100,
    this.cleanlinessScore = 88,
    this.riskLevel = 'Low',
    this.whyThisScore =
        'Chemistry has been in range for 6 straight visits. Cleanliness dropped after heavy leaf fall on 21 Jul. Salt cell is 14 months old — watch for output drop.',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Header bar with circular back button and "Pool health" title
            _buildHeaderBar(context),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Column(
                  children: [
                    10.verticalSpace,

                    // Big Circular Score Gauge (Green ring with "92" and "out of 100")
                    _buildScoreGauge(),
                    24.verticalSpace,

                    // Metrics Breakdown Card (Equipment, Chemistry, Cleanliness, Risk)
                    _buildMetricsCard(),
                    16.verticalSpace,

                    // "Why this score" Card
                    _buildWhyThisScoreCard(),
                    16.verticalSpace,

                    // Disclaimer text
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                          'Read-only for the technician role.',
                          style: TextStyle(
                            fontFamily: AppTypography.poppinsFont,
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF7D8A99),
                          ),
                        ),
                      ),
                    ),
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
            'Pool health',
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

  Widget _buildScoreGauge() {
    return Center(
      child: SizedBox(
        width: 140.w,
        height: 140.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Circular Progress Indicator
            SizedBox(
              width: 136.w,
              height: 136.w,
              child: CircularProgressIndicator(
                value: overallScore / 100.0,
                strokeWidth: 10.w,
                backgroundColor: const Color(0xFFE2F6EC),
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF13A05D)),
                strokeCap: StrokeCap.round,
              ),
            ),

            // Inner Content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$overallScore',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.darkNavy,
                    height: 1.1,
                  ),
                ),
                2.verticalSpace,
                Text(
                  'out of 100',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF7D8A99),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricsCard() {
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
        children: [
          _buildMetricRow(
            label: 'Equipment',
            trailing: Text(
              '$equipmentScore',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF5D6B7C),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(height: 1, color: Color(0xFFF0F3F7)),
          ),
          _buildMetricRow(
            label: 'Chemistry',
            trailing: Text(
              '$chemistryScore',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF5D6B7C),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(height: 1, color: Color(0xFFF0F3F7)),
          ),
          _buildMetricRow(
            label: 'Cleanliness',
            trailing: Text(
              '$cleanlinessScore',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF5D6B7C),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Divider(height: 1, color: Color(0xFFF0F3F7)),
          ),
          _buildMetricRow(
            label: 'Risk',
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF8F0),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                riskLevel,
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 12.5.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF13A05D),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricRow({
    required String label,
    required Widget trailing,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),
          trailing,
        ],
      ),
    );
  }

  Widget _buildWhyThisScoreCard() {
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
            'Why this score',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 15.5.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),
          10.verticalSpace,
          Text(
            whyThisScore,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF5D6B7C),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}
