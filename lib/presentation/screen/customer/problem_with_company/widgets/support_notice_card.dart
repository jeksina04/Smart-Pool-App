import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class SupportNoticeCard extends StatelessWidget {
  final String companyName;

  const SupportNoticeCard({
    super.key,
    required this.companyName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: RichText(
        text: TextSpan(
          style: AppTypography.infoLabel,
          children: [
            TextSpan(text: context.getString('this_goes_to')),
            TextSpan(
              text: context.getString('smart_pool_support'),
              style: AppTypography.priceText
            ),
            TextSpan(
              text: context.getString('support_notice_part', {'company': companyName}),
            ),
          ],
        ),
      ),
    );
  }
}