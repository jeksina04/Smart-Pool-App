import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import 'company_list_item.dart';

class OtherProvidersSection extends StatelessWidget {
  const OtherProvidersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8)],
          ),
          child: Column(
            children: [
              CompanyListItem(
                icon: AppAssets.icSwitch,
                title: context.getString('switch_company'),
                subtitle: context.getString('switch_company_subtitle'),
              ),
              // --> Replace with actual company name and data
              CompanyListItem(
                icon: AppAssets.icNavHistory,
                title: "Blue Wave Pools",
                subtitle: "Previous · Jun 2025 – Feb 2026 · 34 visits",
                onTap: () {
                  Navigator.pop(context, 2);
                },
              ),
            ],
          ),
        ),
        16.verticalSpace,
        // Warning/Notice Banner
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.providersStripBg,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SvgPicture.asset(
              AppAssets.icLock,
            ),
            8.horizontalSpace,
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: context.getString('proposed_not_agreed_yet'),
                        style: AppTypography.statusText),
                    TextSpan(
                      text: context.getString('visit_history_before_not'),
                      style: AppTypography.stripText
                          .copyWith(color: AppColors.statusHighText),
                    ),
                    TextSpan(
                        text: context.getString('visit_history_not'),
                        style: AppTypography.statusText),
                    TextSpan(
                      text: context.getString('visit_history_after_not'),
                      style: AppTypography.stripText
                          .copyWith(color: AppColors.statusHighText),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
