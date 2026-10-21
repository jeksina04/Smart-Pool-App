import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import '../../../../service/navigation.dart';

class InvoiceDetailPaymentSection extends StatelessWidget {
  final Map<String, dynamic> invoice;

  const InvoiceDetailPaymentSection({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: const Offset(0, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.ifYouPayOnlineBg,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            ),
            child: Row(
              children: [
                Text(
                  context.getString('if_you_pay_online'),
                  style: AppTypography.inputLabel,
                ),
                8.horizontalSpace,
                Expanded(
                    child: Text(
                        context.getString('fee_added_by',
                            {'company': 'NSP Pool & Spa Services'}),
                        style: AppTypography.infoLabel)),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.dividerColor,),
          _buildMethod(
              context,
              AppAssets.icTransfer,
              context.getString('bank_transfer_ach'),
              "1% fee · \$1.54",
              "\$156.03",
              badge: "cheapest"),
          const Divider(height: 1, color: AppColors.dividerColor,),
          _buildMethod(
              context,
              AppAssets.icCreditCard,
              context.getString('card'),
              "2.99% fee · \$4.62",
              "\$159.11"),
          const Divider(height: 1, color: AppColors.dividerColor,),
          _buildMethod(
              context,
              AppAssets.icDocument,
              context.getString('cheques_zelle_or_cash'),
              '${context.getString('no_fee')} — ${context.getString('how_to_pay')}',
              "\$154.49",
              isLink: true),
          const Divider(height: 1, color: AppColors.dividerColor,),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Text(
              context.getString('payment_fee_disclaimer', {'company': 'NSP Pool & Spa Services'}), // --> Replace with actual company name
              style: AppTypography.infoLabel,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMethod(
      BuildContext context, String icon, String title, String sub, String price,
      {String? badge, bool isLink = false}) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  color: AppColors.recurringQuoteBg,
                  borderRadius: BorderRadius.circular(12.r)),
              child: SizedBox(
                height: 18.w,
                  width: 18.w,
                  child: SvgPicture.asset(
                    icon,
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryBlue,
                      BlendMode.srcIn,
                    ),
                  ))),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.skipButton),
                RichText(
                  text: TextSpan(
                    style: AppTypography.infoLabel,
                    children: [
                      TextSpan(
                        text: isLink
                            ? '${sub.split('—').first} — '
                            : sub,
                      ),
                      if (isLink && sub.contains('—'))
                        TextSpan(
                          text: sub.split('—').last.trim(),
                          style: AppTypography.bottomTextHighlight,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                context,
                                Routes.howToPay,
                                arguments: invoice,
                              );
                            },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: AppTypography.skipButton),
              if (badge != null)
                Text(badge, style: AppTypography.cheapestText),
            ],
          ),
        ],
      ),
    );
  }
}