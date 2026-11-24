import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../util/app_assets.dart';
import '../../../../../../util/app_colors.dart';
import '../../../../../../util/app_typography.dart';

class PayInvoiceHeader extends StatelessWidget {
  final String invoiceId;

  const PayInvoiceHeader({super.key, required this.invoiceId});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.getString('pay_invoice_id', {'id': invoiceId}),
              style: AppTypography.poolCareSupport,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 36.w,
                  height: 36.w,
                  padding: EdgeInsets.all(12.w),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.cardShadow,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    AppAssets.icClose,
                  ),
                ),
              ),
            ),
          ],
        ),
        8.verticalSpace,
        Text(
          context.getString('choose_how_to_pay'),
          style: AppTypography.infoLabel,
        ),
      ],
    );
  }
}