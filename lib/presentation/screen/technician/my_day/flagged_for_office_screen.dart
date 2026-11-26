import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

import 'widgets/my_day_header_bar.dart';

/// Screen: "Flagged for the office"
/// Displays issues flagged during technician stops to notify the office.
class FlaggedForOfficeScreen extends StatelessWidget {
  const FlaggedForOfficeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Bar with circular back button & title "Flagged for the office"
            MyDayHeaderBar(
              title: 'Flagged for the office',
              onBack: () => Navigator.of(context).maybePop(),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date & Flag count subtitle
                    Text(
                      'Monday 4 August · 1 flag',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGrey,
                      ),
                    ),
                    14.verticalSpace,

                    // Flagged Item Card
                    _buildFlaggedCard(context),
                    18.verticalSpace,

                    // Bottom info text
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        'The office sees every flag as soon as your phone syncs.',
                        style: TextStyle(
                          fontFamily: AppTypography.poppinsFont,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textGrey,
                          height: 1.4,
                        ),
                      ),
                    ),
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlaggedCard(BuildContext context) {
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
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.r),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              Routes.techCustomerDetail,
              arguments: {
                'name': 'Kaiden Roth',
                'address': '14 Oak Lane',
                'frequency': 'weekly',
                'healthScore': 88,
                'nextVisit': 'Mon',
                'workOrdersCount': 1,
                'shoppingItemsCount': 1,
              },
            );
          },
          borderRadius: BorderRadius.circular(20.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row: Customer Name & Address + "Flagged" pill badge
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kaiden Roth',
                            style: TextStyle(
                              fontFamily: AppTypography.poppinsFont,
                              fontSize: 15.5.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkNavy,
                            ),
                          ),
                          3.verticalSpace,
                          Text(
                            '8:00 am · 14 Oak Lane',
                            style: TextStyle(
                              fontFamily: AppTypography.poppinsFont,
                              fontSize: 12.5.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.horizontalSpace,

                    // Flagged Badge (Light orange/amber pill)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF3E2),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        'Flagged',
                        style: TextStyle(
                          fontFamily: AppTypography.poppinsFont,
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFB57008),
                        ),
                      ),
                    ),
                  ],
                ),
                14.verticalSpace,

                // Photo Preview Container with Blue Gradient
                Container(
                  width: double.infinity,
                  height: 140.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    gradient: const RadialGradient(
                      center: Alignment.center,
                      radius: 0.9,
                      colors: [
                        Color(0xFF90B9EA),
                        Color(0xFF6B9ED9),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'photo',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                14.verticalSpace,

          // Issue Description with bold leading text
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 13.sp,
                color: AppColors.darkNavy,
                height: 1.45,
              ),
              children: const [
                TextSpan(
                  text: 'Pump seal weeping. ',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text:
                      'Water pooling under the pump. Needs a seal replacement on the next visit.',
                  style: TextStyle(color: Color(0xFF5F6C7A)),
                ),
              ],
            ),
          ),
        ],
      ),
    ))));
  }
}
