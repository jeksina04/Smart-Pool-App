import "package:ez_localization/ez_localization.dart";
import "package:flutter/cupertino.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

import "../../../../../util/app_assets.dart";
import "../../../../../util/app_colors.dart";
import "../../../../../util/app_typography.dart";

class UnpaidBalanceNotice extends StatelessWidget {
  const UnpaidBalanceNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.w, 8.h),
      decoration: BoxDecoration(
        color: AppColors.statusHighBg,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: SvgPicture.asset(
              AppAssets.icAlert,
              height: 10.w,
              colorFilter:
                  ColorFilter.mode(AppColors.statusHighText, BlendMode.srcIn),
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: Text(context.getString('settle_invoices_before_deleting'),
                style: AppTypography.stripText
                    .copyWith(color: AppColors.statusHighText)),
          )
        ],
      ),
    );
  }
}
