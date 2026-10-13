import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/service_paused/widgets/company_inactive_info_card.dart';
import 'package:flutter_skeleton/presentation/screen/customer/service_paused/widgets/service_pause_action_item.dart';
import 'package:flutter_skeleton/presentation/screen/customer/service_paused/widgets/service_pause_actions_section.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import '../../../service/navigation.dart';

class ServicePausedPage extends StatefulWidget {
  const ServicePausedPage({super.key});

  @override
  State<ServicePausedPage> createState() => _ServicePausedPageState();
}

class _ServicePausedPageState extends State<ServicePausedPage> {
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
                      context.getString('service_pause_title'),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,

                        Container(
                          padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.w, 8.h),
                          decoration: BoxDecoration(
                            color: AppColors.notificationRed.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 4.h),
                                child: SvgPicture.asset(
                                  AppAssets.icAlert,
                                  height: 10.w,
                                  colorFilter: ColorFilter.mode(
                                      AppColors.notificationAlertText, BlendMode.srcIn),
                                ),
                              ),
                              8.horizontalSpace,
                              Expanded(
                                child: Text(
                                    context.getString('not_active_at_moment', {'company': 'NSP Pool & Spa Services'}),
                                    style: AppTypography.stripText.copyWith(color: AppColors.notificationAlertText)),
                              ),
                            ],
                          ),
                        ),

                        16.verticalSpace,
                        // Company Inactive Info Card
                        const CompanyInactiveInfoCard(),

                        16.verticalSpace,
                        // Service Pause Actions
                        ServicePauseActionsSection(items: [
                          ServicePauseActionItem(
                            icon: AppAssets.icNavHistory,
                            title: context.getString('view_your_service_history'),
                            onTap: () {
                              Navigator.pushNamed(context, Routes.dashboard, arguments: 2);
                            },
                          ),
                          ServicePauseActionItem(
                            icon: AppAssets.icCreditCard,
                            title: context.getString('pay_outstanding_invoice'),
                            badgeText: context.getString('items_due', {'count': '1'}), // --> Replace with user invoice count
                            onTap: () {} // --> Navigate to invoices/billing page
                          ),
                          ServicePauseActionItem(
                            icon: AppAssets.icPhone,
                            title: context.getString('contact_company', {'company': 'NSP Pool & Spa Services'}), // --> Replace with company name
                            onTap: () {
                              Navigator.pushNamed(context, Routes.serviceCompany);
                            },
                          ),
                        ]),

                      ])),
            ),
          ],
        )));
  }
}
