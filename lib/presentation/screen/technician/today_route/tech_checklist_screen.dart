import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

/// Screen: "T · Stop detail — Checklist (Water & surfaces, Baskets, Safety)"
/// Displays:
/// - Header Bar: Circular back button and "Checklist" title
/// - Top subtitle: "Swipe or tap · *required · 📷 photo required" with "1 / 6 required" pill
/// - Section 1: "Water & surfaces 0/4"
///   - Pool / spa surface skim (*required)
///   - Brush walls and steps (*required)
///   - Vacuum
///   - Water level check (*required)
/// - Section 2: "Baskets, filter & equipment 1/5"
///   - Empty skimmer basket(s) (*required, checked with strikethrough)
///   - Empty pump basket
///   - Filtration system inspection (*required, camera icon)
///   - Backwash DE / sand filter
///   - Empty automatic cleaner bag
/// - Section 3: "Safety 0/1"
///   - Gate secure and locked (*required, camera icon)
/// - Bottom disabled/enabled button: "Next → Readings"
/// - Footnote: "Complete the required tasks — some need a photo to continue"
class TechChecklistScreen extends StatefulWidget {
  final String title;

  const TechChecklistScreen({
    super.key,
    this.title = 'Checklist',
  });

  @override
  State<TechChecklistScreen> createState() => _TechChecklistScreenState();
}

class _TechChecklistScreenState extends State<TechChecklistScreen> {
  // Track checked states
  final Map<String, bool> _checkedItems = {
    'Pool / spa surface skim': false,
    'Brush walls and steps': false,
    'Vacuum': false,
    'Water level check': false,
    'Empty skimmer basket(s)': true,
    'Empty pump basket': false,
    'Filtration system inspection': false,
    'Backwash DE / sand filter': false,
    'Empty automatic cleaner bag': false,
    'Gate secure and locked': false,
  };

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
                    // Subtitle row: instructions + "1 / 6 required" badge
                    _buildSubHeader(),
                    20.verticalSpace,

                    // Section 1: Water & surfaces 0/4
                    _buildSectionHeader('Water & surfaces', '0/4'),
                    10.verticalSpace,
                    _buildWaterAndSurfacesCard(),
                    20.verticalSpace,

                    // Section 2: Baskets, filter & equipment 1/5
                    _buildSectionHeader('Baskets, filter & equipment', '1/5'),
                    10.verticalSpace,
                    _buildBasketsAndEquipmentCard(),
                    20.verticalSpace,

                    // Section 3: Safety 0/1
                    _buildSectionHeader('Safety', '0/1'),
                    10.verticalSpace,
                    _buildSafetyCard(),
                    24.verticalSpace,

                    // Button: Next → Readings
                    _buildNextButton(),
                    14.verticalSpace,

                    // Footnote
                    Center(
                      child: Text(
                        'Complete the required tasks — some need a photo to continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppTypography.poppinsFont,
                          fontSize: 12.sp,
                          color: const Color(0xFF7D8A99),
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
            widget.title,
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

  Widget _buildSubHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 13.sp,
                color: const Color(0xFF7D8A99),
                height: 1.4,
              ),
              children: [
                const TextSpan(text: 'Swipe or tap · *required · '),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 14.w,
                    color: const Color(0xFF7D8A99),
                  ),
                ),
                const TextSpan(text: 'photo\nrequired'),
              ],
            ),
          ),
        ),
        10.horizontalSpace,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: const Color(0xFFEDF4FE),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Text(
            '1 / 6 required',
            style: TextStyle(
              fontFamily: AppTypography.poppinsFont,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryBlue,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, String count) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: AppTypography.poppinsFont,
          fontSize: 16.5.sp,
          fontWeight: FontWeight.w800,
          color: AppColors.darkNavy,
        ),
        children: [
          TextSpan(text: title),
          TextSpan(
            text: ' $count',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: const Color(0xFF9AA5B5),
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterAndSurfacesCard() {
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
          _buildChecklistItem(
            title: 'Pool / spa surface skim',
            isRequired: true,
            isTopRounded: true,
          ),
          _buildDivider(),
          _buildChecklistItem(
            title: 'Brush walls and steps',
            isRequired: true,
          ),
          _buildDivider(),
          _buildChecklistItem(
            title: 'Vacuum',
            isRequired: false,
          ),
          _buildDivider(),
          _buildChecklistItem(
            title: 'Water level check',
            isRequired: true,
            isBottomRounded: true,
          ),
        ],
      ),
    );
  }

  Widget _buildBasketsAndEquipmentCard() {
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
          _buildChecklistItem(
            title: 'Empty skimmer basket(s)',
            isRequired: true,
            isTopRounded: true,
          ),
          _buildDivider(),
          _buildChecklistItem(
            title: 'Empty pump basket',
            isRequired: false,
          ),
          _buildDivider(),
          _buildChecklistItem(
            title: 'Filtration system inspection',
            isRequired: true,
            hasCamera: true,
          ),
          _buildDivider(),
          _buildChecklistItem(
            title: 'Backwash DE / sand filter',
            isRequired: false,
          ),
          _buildDivider(),
          _buildChecklistItem(
            title: 'Empty automatic cleaner bag',
            isRequired: false,
            isBottomRounded: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyCard() {
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
          _buildChecklistItem(
            title: 'Gate secure and locked',
            isRequired: true,
            hasCamera: true,
            isTopRounded: true,
            isBottomRounded: true,
          ),
        ],
      ),
    );
  }

  Widget _buildChecklistItem({
    required String title,
    required bool isRequired,
    bool hasCamera = false,
    bool isTopRounded = false,
    bool isBottomRounded = false,
  }) {
    final isChecked = _checkedItems[title] ?? false;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            _checkedItems[title] = !isChecked;
          });
        },
        borderRadius: BorderRadius.vertical(
          top: isTopRounded ? Radius.circular(16.r) : Radius.zero,
          bottom: isBottomRounded ? Radius.circular(16.r) : Radius.zero,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          child: Row(
            children: [
              // Checkbox container
              Container(
                width: 26.w,
                height: 26.w,
                decoration: BoxDecoration(
                  color: isChecked
                      ? const Color(0xFF13A05D)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: isChecked
                        ? const Color(0xFF13A05D)
                        : const Color(0xFF9AA5B5),
                    width: 1.6,
                  ),
                ),
                child: isChecked
                    ? Icon(
                        Icons.check_rounded,
                        size: 18.w,
                        color: AppColors.white,
                      )
                    : null,
              ),
              14.horizontalSpace,

              // Title with red asterisk if required
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: AppTypography.poppinsFont,
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w700,
                      color: isChecked
                          ? const Color(0xFF7D8A99)
                          : AppColors.darkNavy,
                      decoration: isChecked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                    children: [
                      if (isRequired)
                        TextSpan(
                          text: '* ',
                          style: TextStyle(
                            color: isChecked
                                ? const Color(0xFF7D8A99)
                                : const Color(0xFFE53935),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      TextSpan(text: title),
                    ],
                  ),
                ),
              ),

              // Camera icon if required
              if (hasCamera) ...[
                Icon(
                  Icons.camera_alt_outlined,
                  size: 20.w,
                  color: const Color(0xFFE53935), // Red camera outline
                ),
              ],
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

  Widget _buildNextButton() {
    return Container(
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        color: const Color(0xFFD4DFEC), // Soft greyed-blue pill
        borderRadius: BorderRadius.circular(26.r),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.techWaterReadings);
          },
          borderRadius: BorderRadius.circular(26.r),
          child: Center(
            child: Text(
              'Next → Readings',
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 15.5.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF4A6585),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
