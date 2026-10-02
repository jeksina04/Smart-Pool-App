import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/services/widgets/add_ons_section.dart';
import 'package:flutter_skeleton/presentation/screen/customer/services/widgets/service_list_card.dart';
import 'package:flutter_skeleton/util/app_typography.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.dashboardBg,
        body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
                  child: Text(
                    context.getString('services_title'),
                    style: AppTypography.sectionHeader,
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

                            /// Request a Service Action button
                            SizedBox(
                                width: double.infinity,
                                height: 56.h,
                                child: ElevatedButton(
                                    onPressed: () {}, // --> Request a service
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryBlue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(28.r),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(AppAssets.icAdd),
                                          8.horizontalSpace,
                                          Text(
                                            context.getString('request_service'),
                                            style: AppTypography.signInButton,
                                          )
                                        ])
                                )
                            ),

                            16.verticalSpace,
                            const ServiceListCard(),

                            16.verticalSpace,
                            const AddOnsSection(),

                            16.verticalSpace
                          ])
                  )
                )
              ],
            )
        ),
    );
  }
}
