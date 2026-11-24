import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Screen: "T · Stop detail — AI recommendation"
/// Displays:
/// - Header Bar: Back button and "AI recommendation" title
/// - Top Card: Recommended dose (3.0 oz, Cal-Hypo 65% granular, Confidence 91%)
/// - Chemical List Card (Chlorine tabs, Soda ash, Liquid chlorine, Salt 40lb bag) with ic_drop icons
/// - US units (lb/gal/oz) info banner
/// - Advisory only warning banner
/// - Actually added section: Stepper card (- 3.0 oz +)
/// - Bottom Buttons: Override (white pill) & Confirm (blue pill)
class TechAiRecommendationScreen extends StatefulWidget {
  const TechAiRecommendationScreen({super.key});

  @override
  State<TechAiRecommendationScreen> createState() =>
      _TechAiRecommendationScreenState();
}

class _TechAiRecommendationScreenState
    extends State<TechAiRecommendationScreen> {
  double _addedAmount = 3.0;

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
                    // Recommended Dose Main Card
                    _buildRecommendedDoseCard(),
                    16.verticalSpace,

                    // Chemical Items Card (with icDrop icons)
                    _buildChemicalsListCard(),
                    14.verticalSpace,

                    // Info Banner: US units (lb / gal / oz)
                    _buildUnitsInfoBanner(),
                    12.verticalSpace,

                    // Warning Banner: Advisory only
                    _buildAdvisoryBanner(),
                    20.verticalSpace,

                    // "Actually added" section title
                    Text(
                      'Actually added',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 17.5.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.darkNavy,
                      ),
                    ),
                    12.verticalSpace,

                    // Actually added stepper card
                    _buildActuallyAddedCard(),
                    24.verticalSpace,

                    // Override & Confirm buttons
                    _buildBottomButtonsRow(),
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
            'AI recommendation',
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

  Widget _buildRecommendedDoseCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
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
          // Header: "Recommended dose" + "Confidence 91%"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommended dose',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 14.5.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF7D8A99),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF4FF),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  'Confidence 91%',
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
          8.verticalSpace,

          // Large Dosage: "3.0 oz"
          Text(
            '3.0 oz',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 32.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.darkNavy,
            ),
          ),
          6.verticalSpace,

          // Chemical name: "Cal-Hypo 65% granular"
          Text(
            'Cal-Hypo 65% granular',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),
          6.verticalSpace,

          // Target details
          Text(
            'Free chlorine 0.6 ppm → target 2.0 ppm across 10,000 gal at 84°F.',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 12.5.sp,
              color: const Color(0xFF7D8A99),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChemicalsListCard() {
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
          // 1. Chlorine tabs (drop icon)
          _buildChemicalRow(
            icon: SvgPicture.asset(
              AppAssets.icDrop,
              width: 18.w,
              height: 18.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
            title: 'Chlorine tabs',
            subtitle: 'count · whole tablets',
            trailing: '3',
            isTopRounded: true,
          ),
          _buildDivider(),

          // 2. Soda ash (drop icon)
          _buildChemicalRow(
            icon: SvgPicture.asset(
              AppAssets.icDrop,
              width: 18.w,
              height: 18.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
            title: 'Soda ash',
            subtitle: 'weight',
            trailing: '2 lb',
          ),
          _buildDivider(),

          // 3. Liquid chlorine (drop icon)
          _buildChemicalRow(
            icon: SvgPicture.asset(
              AppAssets.icDrop,
              width: 18.w,
              height: 18.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
            title: 'Liquid chlorine',
            subtitle: 'volume',
            trailing: '1.5 gal',
          ),
          _buildDivider(),

          // 4. Salt 40lb bag (shopping bag icon)
          _buildChemicalRow(
            icon: SvgPicture.asset(
              AppAssets.icShoppingBag,
              width: 18.w,
              height: 18.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
            title: 'Salt 40lb bag',
            subtitle: 'count · whole bags',
            trailing: '×1',
            isBottomRounded: true,
          ),
        ],
      ),
    );
  }

  Widget _buildChemicalRow({
    required Widget icon,
    required String title,
    required String subtitle,
    required String trailing,
    bool isTopRounded = false,
    bool isBottomRounded = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Row(
        children: [
          // Icon in soft blue container
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

          // Title & Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkNavy,
                  ),
                ),
                3.verticalSpace,
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: AppTypography.poppinsFont,
                    fontSize: 12.5.sp,
                    color: const Color(0xFF7D8A99),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Trailing value
          Text(
            trailing,
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 14.5.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.darkNavy,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const Divider(height: 1, color: Color(0xFFF0F3F7)),
    );
  }

  Widget _buildUnitsInfoBanner() {
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
            child: SvgPicture.asset(
              AppAssets.icAiRecommendation,
              width: 15.w,
              height: 15.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
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
                    text: 'US units (lb / gal / oz). ',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text:
                        'Tablets and bags are counted, never converted. The unit system is a company setting — switching it re-labels weights and volumes and leaves counts alone.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvisoryBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
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
                Color(0xFF8B5A10),
                BlendMode.srcIn,
              ),
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 12.sp,
                  color: const Color(0xFF7A4D05),
                  height: 1.45,
                ),
                children: const [
                  TextSpan(
                    text: 'Advisory only. ',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text:
                        'You are responsible for what you add. Verify against the label before dosing.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActuallyAddedCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
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
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Cal-Hypo 65%',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.darkNavy,
              ),
            ),
          ),

          // Stepper: [-]  3.0 oz  [+]
          Row(
            children: [
              InkWell(
                onTap: () {
                  if (_addedAmount > 0.5) {
                    setState(() => _addedAmount -= 0.5);
                  }
                },
                borderRadius: BorderRadius.circular(18.r),
                child: Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7FAFC),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.remove_rounded,
                      size: 18.w,
                      color: AppColors.darkNavy,
                    ),
                  ),
                ),
              ),
              12.horizontalSpace,
              Text(
                '${_addedAmount.toStringAsFixed(1)} oz',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 15.5.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.darkNavy,
                ),
              ),
              12.horizontalSpace,
              InkWell(
                onTap: () {
                  setState(() => _addedAmount += 0.5);
                },
                borderRadius: BorderRadius.circular(18.r),
                child: Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7FAFC),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add_rounded,
                      size: 18.w,
                      color: AppColors.darkNavy,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtonsRow() {
    return Row(
      children: [
        // Override button (white pill)
        Expanded(
          child: Container(
            height: 52.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(26.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x08102A50),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.of(context).maybePop(),
                borderRadius: BorderRadius.circular(26.r),
                child: Center(
                  child: Text(
                    'Override',
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkNavy,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        14.horizontalSpace,

        // Confirm button (primary blue pill)
        Expanded(
          child: SizedBox(
            height: 52.h,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.techPhotosVideo);
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
                'Confirm',
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 15.5.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
