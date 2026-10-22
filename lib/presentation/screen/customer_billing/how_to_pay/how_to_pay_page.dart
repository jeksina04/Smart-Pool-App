import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import 'widgets/how_to_pay_actions.dart';
import 'widgets/how_to_pay_info_banner.dart';
import 'widgets/how_to_pay_methods_card.dart';
import 'widgets/how_to_pay_notice_card.dart';
import 'widgets/how_to_pay_summary_card.dart';

class HowToPayPage extends StatefulWidget {
  final Map<String, dynamic> invoice;

  const HowToPayPage({super.key, required this.invoice});

  @override
  State<HowToPayPage> createState() => _HowToPayPage();
}

class _HowToPayPage extends State<HowToPayPage> {
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
                    context.getString('how_to_pay_title'),
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
                    HowToPaySummaryCard(invoice: widget.invoice),
                    16.verticalSpace,
                    Text(
                      context.getString('company_accepts', {'company': 'NSP POOL & SPA'}),
                      style: AppTypography.cardTitle
                    ),
                    16.verticalSpace,
                    const HowToPayMethodsCard(),
                    16.verticalSpace,
                    HowToPayInfoBanner(amount: widget.invoice['amount'] ?? ''),
                    16.verticalSpace,
                    HowToPayNoticeCard(invoiceId: widget.invoice['id'] ?? ''),
                    16.verticalSpace,
                    const HowToPayActions(),
                    16.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ))
    );
  }
}