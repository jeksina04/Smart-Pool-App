import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/water_test/widgets/latest_reading_summary_card.dart';
import 'package:flutter_skeleton/presentation/screen/customer/water_test/widgets/reading_chart_card.dart';
import 'package:flutter_skeleton/presentation/screen/customer/water_test/widgets/test_history_list.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';

class WaterTestPage extends StatefulWidget {
  const WaterTestPage({super.key});

  @override
  State<WaterTestPage> createState() => _WaterTestPageState();
}

class _WaterTestPageState extends State<WaterTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.dashboardBg,
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12.w, 16.h, 12.w, 0),
              child: SizedBox(
                height: 40.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 36.w,
                          height: 36.w,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(10.w),
                          child: SvgPicture.asset(
                            AppAssets.icBack,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      context.getString('water_test_title'),
                      style: AppTypography.sectionHeader,
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      10.verticalSpace,

                      /// Latest Readings Chips
                      const LatestReadingSummaryCard(),

                      8.verticalSpace,

                      /// pH History Chart
                      ReadingChartCard(
                        title: context.getString('ph_last_8_weeks'),
                        lineColor: AppColors.statusGreen,
                        // --> Replace with actual pH data
                        dataPoints: const [7.2, 7.4, 7.3, 7.6, 7.5, 7.2, 7.1, 7.2],
                      ),

                      8.verticalSpace,

                      /// Chlorine History Chart
                      ReadingChartCard(
                        title: context.getString('chlorine_last_8_weeks'),
                        lineColor: AppColors.primaryBlue,
                        // --> Replace with actual chlorine data
                        dataPoints: const [1.5, 1.2, 1.8, 2.0, 1.5, 1.4, 1.6, 1.5],
                      ),

                      16.verticalSpace,

                      /// Test History List Section
                      const TestHistoryList(),

                      16.verticalSpace,

                      /// Request Test Button
                      _buildRequestTestButton(context),

                      8.verticalSpace,
                    ],
                  )),
            )
          ],
        )));
  }

  /// Builds a white rounded button for the Log Out action
  Widget _buildRequestTestButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: InkWell(
        onTap: () {}, // --> Trigger request test
        borderRadius: BorderRadius.circular(30.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.getString('request_a_test'),
              style: AppTypography.requestTestText,
            ),
          ],
        ),
      ),
    );
  }
}
