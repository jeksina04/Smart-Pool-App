import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/help_and_change_password/help_and_support/widgets/faq_list.dart';
import 'package:flutter_skeleton/presentation/screen/help_and_change_password/help_and_support/widgets/primary_support_button.dart';
import 'package:flutter_skeleton/presentation/screen/help_and_change_password/help_and_support/widgets/secondary_support_button.dart';
import 'package:flutter_skeleton/presentation/screen/help_and_change_password/help_and_support/widgets/stuck_footer.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_typography.dart';

class HelpAndSupportPage extends StatefulWidget {
  const HelpAndSupportPage({super.key});

  @override
  State<HelpAndSupportPage> createState() => _HelpAndSupportPageState();
}

class _HelpAndSupportPageState extends State<HelpAndSupportPage> {
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
                  context.getString('help_support_title'),
                  style: AppTypography.sectionHeader,
                ),
              ],
            ),
          ),
          8.verticalSpace,
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  const PrimarySupportButton(),
                  16.verticalSpace,
                  const SecondarySupportButtons(),
                  16.verticalSpace,
                  Text(context.getString('common_questions'),
                      style: AppTypography.quickActionsHeading),
                  8.verticalSpace,
                  const FAQList(),
                  16.verticalSpace,
                  const StuckFooter(),
                  16.verticalSpace,
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
