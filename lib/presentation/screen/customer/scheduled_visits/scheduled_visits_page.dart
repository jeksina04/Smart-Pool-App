import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/scheduled_visits/widgets/coming_up_services.dart';
import 'package:flutter_skeleton/presentation/screen/customer/scheduled_visits/widgets/next_scheduled_visit_card.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';

class ScheduledVisitsPage extends StatefulWidget {
  const ScheduledVisitsPage({super.key});

  @override
  State<ScheduledVisitsPage> createState() => _ScheduledVisitsPageState();
}

class _ScheduledVisitsPageState extends State<ScheduledVisitsPage> {
  // --> Replace with actual data
  /// Raw data list representing the history sections and items
  final List<Map<String, dynamic>> _allData = [
    {
      'items': [
        {
          'date': "Fri 14 Aug · 10:00 AM",
          'desc': "Full clean & balance",
        },
        {
          'date': "Fri 21 Aug · 10:00 AM",
          'desc': "Full clean & balance",
        },
        {
          'date': "Fri 28 Aug · 10:00 AM",
          'desc': "Full clean & balance + filter clean",
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.dashboardBg,
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
              child: SizedBox(
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
                      context.getString('scheduled_visits_title'),
                      style: AppTypography.sectionHeader,
                    ),
                  ],
                ),
              ),
            ),
            8.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        // Next Scheduled Visit Information Card
                        NextScheduledVisitCard(),

                        16.verticalSpace,

                        /// Dynamically rendered history sections
                        ..._data.map((section) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: ComingUpServices(
                              items: section['items'],
                            ),
                          );
                        }).toList(),

                        Container(
                          padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.w, 8.h),
                          decoration: BoxDecoration(
                            color: AppColors.infoBannerBg,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 4.h),
                                child: SvgPicture.asset(
                                  AppAssets.icBell,
                                  height: 10.w,
                                  colorFilter: ColorFilter.mode(
                                      AppColors.infoBannerText, BlendMode.srcIn),
                                ),
                              ),
                              8.horizontalSpace,
                              Expanded(
                                child: Text(
                                    context.getString('visit_notification_message'),
                                    style: AppTypography.stripText),
                              ),
                            ],
                          ),
                        ),

                        16.verticalSpace,
                        // Request a Different Day button
                        _buildRequestDifferentDay(context),
                        8.verticalSpace
                      ])),
            ),
          ],
        )));
  }

  /// Getter that returns data
  List<Map<String, dynamic>> get _data {
    return _allData.map((section) {
      return {
        'items': section['items'],
      };
    }).toList();
  }

  /// Builds a white rounded button for the Request a Different Day action
  Widget _buildRequestDifferentDay(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: InkWell(
        onTap: () {}, // --> Handle different day request logic
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.getString('request_a_different_day'),
                  style: AppTypography.logOut,
                ),
              ],
            ),
        ),
    );
  }
}
