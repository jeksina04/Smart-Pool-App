import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/service_company/widgets/account_details_section.dart';
import 'package:flutter_skeleton/presentation/screen/customer/service_company/widgets/company_info_card.dart';
import 'package:flutter_skeleton/presentation/screen/customer/service_company/widgets/contact_section.dart';
import 'package:flutter_skeleton/presentation/screen/customer/service_company/widgets/other_providers_section.dart';
import 'package:flutter_skeleton/presentation/screen/customer/service_company/widgets/technicians_section.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';

class ServiceCompanyPage extends StatefulWidget {
  const ServiceCompanyPage({super.key});

  @override
  State<ServiceCompanyPage> createState() => _ServiceCompanyPageState();
}

class _ServiceCompanyPageState extends State<ServiceCompanyPage> {
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
                      context.getString('service_company'),
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
                      const CompanyInfoCard(),
                      16.verticalSpace,
                      Text(context.getString('contact'),
                          style: AppTypography.dashboardHeading
                              .copyWith(fontSize: 18.sp)),
                      12.verticalSpace,
                      const ContactSection(),
                      16.verticalSpace,
                      Text(context.getString('your_technicians'),
                          style: AppTypography.dashboardHeading
                              .copyWith(fontSize: 18.sp)),
                      16.verticalSpace,
                      const TechniciansSection(),
                      16.verticalSpace,
                      Text(context.getString('your_account_with_them'),
                          style: AppTypography.dashboardHeading
                              .copyWith(fontSize: 18.sp)),
                      16.verticalSpace,
                      const AccountDetailsSection(),
                      16.verticalSpace,
                      Text(context.getString('other_providers'),
                          style: AppTypography.dashboardHeading
                              .copyWith(fontSize: 18.sp)),
                      16.verticalSpace,
                      OtherProvidersSection(),
                      16.verticalSpace,
                      _buildProblemButton(context),
                      8.verticalSpace,
                    ],
                  )),
            )
          ],
        )));
  }

  Widget _buildProblemButton(BuildContext context) {
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
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: InkWell(
        onTap: () {}, // --> Trigger Problem with this Company? button logic
        borderRadius: BorderRadius.circular(28.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.icAlert,
              width: 20.w,
              colorFilter:
                  ColorFilter.mode(AppColors.darkNavy, BlendMode.srcIn),
            ),
            12.horizontalSpace,
            Text(
              context.getString('problem_with_company'),
              style: AppTypography.dashboardHeading.copyWith(fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
