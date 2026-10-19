import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class InvoiceAttachment extends StatelessWidget {
  final String invoiceId;
  final String amount;
  final String date;

  const InvoiceAttachment({
      super.key,
      required this.invoiceId,
      required this.amount,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 0.9.sw,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.recurringQuoteBg,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(10.r)),
              child: SvgPicture.asset(
                  AppAssets.icDocument,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)
              ),
            ),
            12.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("# $invoiceId • $amount",
                    style: AppTypography.skipButton),
                Text("Duplicate charge • $date",
                    style: AppTypography.dayTitle),
              ],
            )
          ],
        ),
      ),
    );
  }
}
