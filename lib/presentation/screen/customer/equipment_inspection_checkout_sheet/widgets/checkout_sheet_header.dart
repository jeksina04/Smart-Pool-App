import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class CheckoutSheetHeader extends StatelessWidget {
  final VoidCallback onClose;

  const CheckoutSheetHeader({
    super.key,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 36.w,
          height: 4.h,
          decoration: BoxDecoration(
            color: AppColors.dividerColor,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        8.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.getString('confirm_and_pay'),
              style: AppTypography.poolCareSupport,
            ),
            GestureDetector(
              onTap: onClose,
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
                child: SvgPicture.asset(AppAssets.icClose),
              ),
            ),
          ],
        ),
      ],
    );
  }
}