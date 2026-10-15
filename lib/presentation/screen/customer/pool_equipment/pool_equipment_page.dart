import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import 'widgets/equipment_list_card.dart';
import 'widgets/pool_details_card.dart';
import 'widgets/report_problem_button.dart';
import 'widgets/warranty_info_banner.dart';

class MyPoolEquipmentPage extends StatefulWidget {
  const MyPoolEquipmentPage({super.key});

  @override
  State<MyPoolEquipmentPage> createState() => _MyPoolEquipmentPageState();
}

class _MyPoolEquipmentPageState extends State<MyPoolEquipmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
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
                          boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8, offset: Offset(0,2))]
                        ),
                        padding: EdgeInsets.all(10.w),
                        child: SvgPicture.asset(AppAssets.icBack),
                      ),
                    ),
                  ),
                  Text(
                    context.getString('my_pool_equipment_title'),
                    style: AppTypography.sectionHeader,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    const PoolDetailsCard(),
                    16.verticalSpace,
                    Text(
                      context.getString('equipment'),
                      style: AppTypography.quickActionsHeading,
                    ),
                    16.verticalSpace,
                    const EquipmentListCard(),
                    16.verticalSpace,
                    const WarrantyInfoBanner(),
                    24.verticalSpace,
                    const ReportProblemButton(),
                    8.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}