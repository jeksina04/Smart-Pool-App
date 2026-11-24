import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class PaymentMethodTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isDefault;
  final bool showChevron;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.isDefault = false,
    this.showChevron = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.recurringQuoteBg,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SvgPicture.asset(
                AppAssets.icCreditCard,
                width: 20.w,
                colorFilter: const ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTypography.sectionHeader),
                  4.verticalSpace,
                  Text(subtitle, style: AppTypography.cardTitle),
                ],
              ),
            ),
            if (isDefault)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.recurringQuoteBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  context.getString('default'),
                  style: AppTypography.defaultText,
                ),
              ),
            if (showChevron)
              SvgPicture.asset(AppAssets.icChevronRight,),
          ],
        ),
      ),
    );
  }
}