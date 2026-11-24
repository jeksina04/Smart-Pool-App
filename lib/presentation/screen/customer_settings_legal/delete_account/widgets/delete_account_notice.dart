import "package:ez_localization/ez_localization.dart";
import "package:flutter/cupertino.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

import "../../../../../util/app_assets.dart";
import "../../../../../util/app_colors.dart";
import "../../../../../util/app_typography.dart";

class DeleteAccountNotice extends StatelessWidget{
  const DeleteAccountNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.w, 8.h),
      decoration: BoxDecoration(
        color: AppColors.notificationRed.withOpacity(0.1),
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
              colorFilter: ColorFilter.mode(
                  AppColors.notificationAlertText, BlendMode.srcIn),
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: context.getString('this_cannot_be_undone'),
                      style: AppTypography.statusText.copyWith(
                          color: AppColors.notificationAlertText)),
                  TextSpan(
                      text: context
                          .getString('deleting_removes_everything'),
                      style: AppTypography.stripText.copyWith(
                          color: AppColors.notificationAlertText)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}