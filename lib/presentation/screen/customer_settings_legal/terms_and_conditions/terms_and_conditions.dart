import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer_settings_legal/terms_and_conditions/widgets/download_pdf_button.dart';
import 'package:flutter_skeleton/presentation/screen/customer_settings_legal/terms_and_conditions/widgets/legal_section_card.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_typography.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({super.key});

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
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
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.cardShadow,
                                blurRadius: 8,
                                offset: Offset(0, 2))
                          ]),
                      padding: EdgeInsets.all(10.w),
                      child: SvgPicture.asset(AppAssets.icBack),
                    ),
                  ),
                ),
                Text(
                  context.getString('terms_and_conditions_title'),
                  style: AppTypography.sectionHeader,
                ),
              ],
            ),
          ),
          8.verticalSpace,
          Expanded(
              child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(children: [
                    // --> Replace with legal document content
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context.getString(
                              'last_updated', {'date': '2 Aug 2026'}),
                          style: AppTypography.dayTitle,
                        )),
                    8.verticalSpace,
                    LegalSectionCard(
                      index: '1',
                      title: 'The service',
                      content:
                          'Smart Pool schedules, records and bills pool maintenance visits, and stores the readings and photographs captured during them.',
                    ),
                    LegalSectionCard(
                      index: '2',
                      title: 'Your account',
                      content:
                          'You are responsible for keeping your sign-in details secure and for activity carried out under your account.',
                    ),
                    LegalSectionCard(
                      index: '3',
                      title: 'AI recommendations',
                      content:
                          'Chemical dosage guidance produced by the application is advisory. See the AI advisory disclaimer.',
                    ),
                    LegalSectionCard(
                      index: '4',
                      title: 'Billing',
                      content:
                          'Subscription fees and per-visit charges are billed to the payment method on file. Failed payments may suspend service.',
                    ),
                    LegalSectionCard(
                      index: '5',
                      title: 'Cancellation',
                      content:
                          'You may cancel at any time. Visits already completed remain payable.',
                    ),

                    16.verticalSpace,

                    DownloadPDFButton(
                      onTap: () {}, // --> Trigger download logic
                    ),

                    8.verticalSpace
                  ])))
        ])));
  }
}
