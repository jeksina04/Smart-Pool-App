import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/pool_health/widgets/latest_readings_card.dart';
import 'package:flutter_skeleton/presentation/screen/customer/pool_health/widgets/pool_metrics_list.dart';
import 'package:flutter_skeleton/presentation/screen/customer/pool_health/widgets/pool_score_chart.dart';
import 'package:flutter_skeleton/presentation/screen/customer/pool_health/widgets/what_this_means_card.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';

class PoolHealthPage extends StatefulWidget {
  const PoolHealthPage({super.key});

  @override
  State<PoolHealthPage> createState() => _PoolHealthPageState();
}

class _PoolHealthPageState extends State<PoolHealthPage> {
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
                      context.getString('pool_health_title'),
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

                      /// Circular Score Chart
                      const PoolScoreChart(score: 92), // --> Replace with actual pool score

                      16.verticalSpace,

                      /// Status Banner
                      _buildStatusBanner(context),

                      16.verticalSpace,

                      /// Metrics Breakdown (Equipment, Chemistry, etc.)
                      const PoolMetricsList(),

                      16.verticalSpace,

                      /// Latest Readings Chips
                      const LatestReadingsCard(),

                      16.verticalSpace,

                      /// Educational Explanation
                      const WhatThisMeansCard(),

                      8.verticalSpace,
                    ],
                  )),
            )
          ],
        )));
  }

  Widget _buildStatusBanner(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.statusGreenBg,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.icCheck,
            width: 16.w,
            height: 16.w,
            colorFilter:
                ColorFilter.mode(AppColors.inRangeGreen, BlendMode.srcIn),
          ),
          8.horizontalSpace,
          Text(
            context.getString('everything_in_range'),
            style: AppTypography.badgeText
                .copyWith(fontSize: 12.5.sp, color: AppColors.inRangeGreen),
          ),
        ],
      ),
    );
  }
}
