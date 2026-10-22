import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import 'widgets/current_plan_card.dart';
import 'widgets/plan_fee_disclaimer.dart';
import 'widgets/plan_list_item.dart';

class MyPlanPage extends StatefulWidget {
  const MyPlanPage({super.key});

  @override
  State<MyPlanPage> createState() => _MyPlanPageState();
}

class _MyPlanPageState extends State<MyPlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: SafeArea(
        child: Column(children: [
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
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppAssets.icBack,
                          width: 20.w,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  context.getString('my_plan_title'),
                  style: AppTypography.sectionHeader,
                ),
              ],
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
                  const CurrentPlanCard(),
                  16.verticalSpace,
                  Text(
                    context.getString('change_plan'),
                    style: AppTypography.quickActionsHeading,
                  ),
                  8.verticalSpace,
                  _buildPlanList(context),
                  16.verticalSpace,
                  const PlanFeeDisclaimer(),
                  16.verticalSpace,
                  Center(
                    child: TextButton(
                      onPressed: () {}, // --> Handle Tap
                      child: Text(
                        context.getString('change_plan'),
                        style: AppTypography.requestTestText,
                      ),
                    ),
                  ),
                  16.verticalSpace,
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildPlanList(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8.r,
                offset: Offset(0, 2))
          ]),
      child: Column(
        children: [
          PlanListItem(
            name: context.getString('basic'),
            description: context.getString('basic_plan'),
            price: "\$55/mo",
            onTap: () {},
          ),
          const Divider(height: 1, color: AppColors.dividerColor),
          PlanListItem(
            name: context.getString('standard'),
            description: context.getString('standard_plan'),
            isCurrent: true,
            onTap: () {},
          ),
          const Divider(height: 1, color: AppColors.dividerColor),
          PlanListItem(
            name: context.getString('premium'),
            description: context.getString('premium_plan'),
            price: "\$125/mo",
            onTap: () {},
          ),
          const Divider(height: 1, color: AppColors.dividerColor),
          PlanListItem(
            name: context.getString('full_service'),
            description: context.getString('full_service_plan'),
            price: "\$180/mo",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
