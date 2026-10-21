import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class HowToPayInfoBanner extends StatelessWidget {
  final String amount;

  const HowToPayInfoBanner({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.w, 8.h),
      decoration: BoxDecoration(
        color: AppColors.phStatusBg,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: SvgPicture.asset(
                AppAssets.icCheck,
                height: 8.w,
                colorFilter: ColorFilter.mode(AppColors.inRangeGreen, BlendMode.srcIn),
              )),
          8.horizontalSpace,
          // --> Replace with actual company name

          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${context.getString('no_card_fee_title')} ',
                    style: AppTypography.howToPayInfoBannerBoldText,
                  ),
                  TextSpan(
                    text: context.getString('no_card_fee_desc', {
                      'amount': '',
                      'cardFee': ' 2.99% (\$4.62) ',
                      'bankFee': ' 1% (\$1.54) ',
                    }).split(' — the invoice total.').first,
                    style: AppTypography.howToPayInfoBannerText,
                  ),
                  TextSpan(
                    text: amount,
                    style: AppTypography.howToPayInfoBannerBoldText,
                  ),
                  TextSpan(
                    text: context.getString('no_card_fee_desc', {
                      'amount': '',
                      'cardFee': ' 2.99% (\$4.62) ',
                      'bankFee': ' 1% (\$1.54) ',
                    }).split(' — the invoice total.').last
                        .replaceFirst('', ' — the invoice total.'),
                    style: AppTypography.howToPayInfoBannerText,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}