import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class InvoiceItemTile extends StatelessWidget {
  final String invoiceNo;
  final String description;
  final String price;
  final bool isDue;
  final VoidCallback? onTap;

  const InvoiceItemTile({
    super.key,
    required this.invoiceNo,
    required this.description,
    required this.price,
    this.isDue = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left Icon Container
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.recurringQuoteBg,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SvgPicture.asset(
                AppAssets.icDocument,
                width: 20.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.primaryBlue,
                  BlendMode.srcIn,
                ),
              ),
            ),
            8.horizontalSpace,
            // Middle Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    invoiceNo,
                    style: AppTypography.sectionHeader,
                  ),
                  2.verticalSpace,
                  Text(
                    description,
                    style: AppTypography.infoLabel,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            8.horizontalSpace,
            // Status & Chevron
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isDue)
                // Red text for Due (No background)
                  Text('$price due', style: AppTypography.paymentDue)
                else
                // Green Pill for Paid
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AppColors.phStatusBg,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text('$price paid', style: AppTypography.badgeText,),
                  ),
                8.horizontalSpace,
                SvgPicture.asset(AppAssets.icChevronRight,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}