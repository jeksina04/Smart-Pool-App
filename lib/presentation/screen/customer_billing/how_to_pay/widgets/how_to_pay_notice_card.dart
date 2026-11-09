import 'package:ez_localization/ez_localization.dart';import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class HowToPayNoticeCard extends StatelessWidget {
  final String invoiceId;

  const HowToPayNoticeCard({super.key, required this.invoiceId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: const Offset(0, 2))
          ]),
      child: RichText(
        text: TextSpan(
          style: AppTypography.inputText,
          children: [
            TextSpan(text: context.getString('quote_invoice_start')),
            TextSpan(
              text: ' ${context.getString('invoice_number', {'id': invoiceId})} ',
              style: AppTypography.quoteDetailInfo,
            ),
            TextSpan(text: context.getString('quote_invoice_end')),
          ],
        ),
      ),
    );
  }
}