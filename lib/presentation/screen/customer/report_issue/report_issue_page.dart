import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/report_issue/widgets/report_issue_form.dart';
import 'package:flutter_skeleton/presentation/screen/customer/request_service/widgets/service_request_form.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';

class ReportIssuePage extends StatefulWidget {
  const ReportIssuePage({super.key});

  @override
  State<ReportIssuePage> createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportIssuePage> {
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
                          context.getString('report_an_issue'),
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

                          /// Report an Issue Form
                          const ReportIssueForm(),

                          8.verticalSpace,
                        ],
                      )),
                )
              ],
            )));
  }
}