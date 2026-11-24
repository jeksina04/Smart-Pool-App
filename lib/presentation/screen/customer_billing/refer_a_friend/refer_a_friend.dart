import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import 'widgets/how_it_works_section.dart';
import 'widgets/referral_code_card.dart';
import 'widgets/your_referrals_section.dart';

class ReferAFriendPage extends StatefulWidget {
  const ReferAFriendPage({super.key});

  @override
  State<ReferAFriendPage> createState() => _ReferAFriendPageState();
}

class _ReferAFriendPageState extends State<ReferAFriendPage> {
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
                  context.getString('refer_a_friend_title'),
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
                  // --> Replace with actual data
                  10.verticalSpace,
                  const ReferralCodeCard(referralCode: "RENEE-4471"),
                  16.verticalSpace,
                  const HowItWorksSection(),
                  16.verticalSpace,
                  const YourReferralsSection(),
                  16.verticalSpace,
                  Text(
                    context.getString('referral_disclaimer',
                        {'company': 'NSP Pool & Spa Services'}),
                    style: AppTypography.dayTitle,
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
}
