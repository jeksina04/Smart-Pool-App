import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Screen: "T · Stop detail — Water readings"
/// Displays pool water readings categorized by Sanitiser, Balance, Minerals, Equipment,
/// with alert banner, temperature note banner, and "Get AI Recommendation" button.
class TechWaterReadingsScreen extends StatefulWidget {
  const TechWaterReadingsScreen({super.key});

  @override
  State<TechWaterReadingsScreen> createState() =>
      _TechWaterReadingsScreenState();
}

class _TechWaterReadingsScreenState extends State<TechWaterReadingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Bar
            _buildHeaderBar(),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subtitle: "Last visit shown in grey — tap a value to edit."
                    Text(
                      'Last visit shown in grey — tap a value to edit.',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF7D8A99),
                      ),
                    ),
                    18.verticalSpace,

                    // Section 1: Sanitiser
                    _buildSectionTitle('Sanitiser'),
                    10.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: _buildReadingCard(
                            label: 'Free chlorine',
                            value: '0.6',
                            target: 'ppm · target 2–4',
                            badgeText: 'Low',
                            badgeColor: const Color(0xFFFDE8E8),
                            badgeTextColor: const Color(0xFFE53935),
                            valueColor: const Color(0xFFC62828),
                          ),
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: _buildReadingCard(
                            label: 'Total chlorine',
                            value: '1.1',
                            target: 'ppm · target 2–4',
                            badgeText: 'Low',
                            badgeColor: const Color(0xFFFDE8E8),
                            badgeTextColor: const Color(0xFFE53935),
                            valueColor: const Color(0xFFC62828),
                          ),
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: _buildReadingCard(
                            label: 'Bromine',
                            value: '—',
                            target: 'ppm · target 3–5',
                            badgeText: '—',
                            badgeColor: const Color(0xFFEBF1F8),
                            badgeTextColor: const Color(0xFF7D8A99),
                            valueColor: const Color(0xFF7D8A99),
                          ),
                        ),
                        12.horizontalSpace,
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    22.verticalSpace,

                    // Section 2: Balance
                    _buildSectionTitle('Balance'),
                    10.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: _buildReadingCard(
                            label: 'pH',
                            value: '7.2',
                            target: '· target 7.2–7.6',
                            badgeText: 'OK',
                            badgeColor: const Color(0xFFE2F6EC),
                            badgeTextColor: const Color(0xFF0F7645),
                          ),
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: _buildReadingCard(
                            label: 'Total alkalinity',
                            value: '90',
                            target: 'ppm · target 80–120',
                            badgeText: 'OK',
                            badgeColor: const Color(0xFFE2F6EC),
                            badgeTextColor: const Color(0xFF0F7645),
                          ),
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: _buildReadingCard(
                            label: 'Calcium\nhardness',
                            value: '240',
                            target: 'ppm · target 200–400',
                            badgeText: 'OK',
                            badgeColor: const Color(0xFFE2F6EC),
                            badgeTextColor: const Color(0xFF0F7645),
                          ),
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: _buildReadingCard(
                            label: 'Cyanuric acid\n',
                            value: '45',
                            target: 'ppm · target 30–50',
                            badgeText: 'OK',
                            badgeColor: const Color(0xFFE2F6EC),
                            badgeTextColor: const Color(0xFF0F7645),
                          ),
                        ),
                      ],
                    ),
                    22.verticalSpace,

                    // Section 3: Minerals
                    _buildSectionTitle('Minerals'),
                    10.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: _buildReadingCard(
                            label: 'Salt',
                            value: '3200',
                            target: 'ppm · target 2700–3400',
                            badgeText: 'OK',
                            badgeColor: const Color(0xFFE2F6EC),
                            badgeTextColor: const Color(0xFF0F7645),
                          ),
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: _buildReadingCard(
                            label: 'Phosphates',
                            value: '180',
                            target: 'ppb · target < 300',
                            badgeText: 'OK',
                            badgeColor: const Color(0xFFE2F6EC),
                            badgeTextColor: const Color(0xFF0F7645),
                          ),
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: _buildReadingCard(
                            label: 'TDS',
                            value: '1450',
                            target: 'ppm · target < 2000',
                            badgeText: 'OK',
                            badgeColor: const Color(0xFFE2F6EC),
                            badgeTextColor: const Color(0xFF0F7645),
                          ),
                        ),
                        12.horizontalSpace,
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    22.verticalSpace,

                    // Section 4: Equipment
                    _buildSectionTitle('Equipment'),
                    10.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: _buildReadingCard(
                            label: 'Filter pressure',
                            value: '18',
                            target: 'psi · target 8–20',
                            badgeText: 'OK',
                            badgeColor: const Color(0xFFE2F6EC),
                            badgeTextColor: const Color(0xFF0F7645),
                          ),
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: _buildReadingCard(
                            label: 'Water temp',
                            value: '84',
                            target: '°F · target 78–86',
                            badgeText: '—',
                            badgeColor: const Color(0xFFEBF1F8),
                            badgeTextColor: const Color(0xFF7D8A99),
                          ),
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: _buildReadingCard(
                            label: 'Flow rate',
                            value: '62',
                            target: 'GPM · target 50–80',
                            badgeText: '—',
                            badgeColor: const Color(0xFFEBF1F8),
                            badgeTextColor: const Color(0xFF7D8A99),
                          ),
                        ),
                        12.horizontalSpace,
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    20.verticalSpace,

                    // Alert: Free chlorine is below target
                    _buildWarningBanner(),
                    12.verticalSpace,

                    // Temperature and flow rate explanation banner
                    _buildTemperatureNoticeBanner(),
                    20.verticalSpace,

                    // "Get AI Recommendation" Button
                    _buildAiRecommendationButton(),
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
            'Water readings',
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: AppTypography.poppinsFont,
        fontSize: 17.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.darkNavy,
      ),
    );
  }

  Widget _buildReadingCard({
    required String label,
    required String value,
    required String target,
    required String badgeText,
    required Color badgeColor,
    required Color badgeTextColor,
    Color? valueColor,
  }) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08102A50),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: label + badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  label,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.5.sp,
                    color: const Color(0xFF7D8A99),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              4.horizontalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  badgeText,
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                    color: badgeTextColor,
                  ),
                ),
              ),
            ],
          ),
          8.verticalSpace,

          // Big Value
          Text(
            value,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 24.sp,
              fontWeight: FontWeight.w800,
              color: valueColor ?? AppColors.darkNavy,
              height: 1.1,
            ),
          ),
          6.verticalSpace,

          // Target description
          Text(
            target,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 11.sp,
              color: const Color(0xFF9AA5B5),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF2F2),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFFFDEDE), width: 1),
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
                Color(0xFFE53935),
                BlendMode.srcIn,
              ),
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: Text(
              'Free chlorine is below target — dosage needed.',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 12.5.sp,
                color: const Color(0xFFB71C1C),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTemperatureNoticeBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF4FF),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Icon(
              Icons.info_outline_rounded,
              size: 15.w,
              color: AppColors.primaryBlue,
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 12.sp,
                  color: AppColors.primaryBlue,
                  height: 1.45,
                ),
                children: const [
                  TextSpan(
                    text:
                        'Temperature and flow rate are read off the equipment and typed in. ',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text:
                        'Temperature changes the dose — a warm pool burns chlorine faster — so it is worth getting right.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAiRecommendationButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.techAiRecommendation);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.icAiRecommendation,
              width: 20.w,
              height: 20.w,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
            10.horizontalSpace,
            Text(
              'Get AI Recommendation',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 15.5.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
