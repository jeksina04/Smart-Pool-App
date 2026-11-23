import 'package:dotted_border/dotted_border.dart';
import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class QuotePhotoUploadSection extends StatelessWidget {
  const QuotePhotoUploadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: AppTypography.inputLabel,
            children: [
              TextSpan(text: context.getString('photos_required_for_quote')),
              TextSpan(
                text: context.getString('required_photos'),
                style: AppTypography.inputLabel.copyWith(
                  color: AppColors.notificationAlertText,
                ),
              ),
            ],
          ),
        ),
        10.verticalSpace,
        Row(
          children: [
            Container(
              width: 88.w,
              height: 88.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryBlue.withOpacity(0.3),
                    AppColors.primaryBlue.withOpacity(0.6),
                  ],
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                "photo 1",
                style: AppTypography.photoViewerBtn.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                ),
              ),
            ),
            12.horizontalSpace,

            Container(
              width: 88.w,
              height: 88.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryBlue.withOpacity(0.3),
                    AppColors.primaryBlue.withOpacity(0.6),
                  ],
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                "photo 2",
                style: AppTypography.photoViewerBtn.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                ),
              ),
            ),
            12.horizontalSpace,

            GestureDetector(
              onTap: () {},
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  color: AppColors.photoUploadBorderColor,
                  strokeWidth: 1.2,
                  dashPattern: [4, 3],
                  radius: Radius.circular(16.r),
                  padding: EdgeInsets.zero,
                ),
                child: SizedBox(
                  width: 88.w,
                  height: 88.w,
                  child: Center(
                    child: SvgPicture.asset(AppAssets.icCamera),
                  ),
                ),
              ),
            ),
          ],
        ),
        8.verticalSpace,
        Text(
          context.getString('pool_photo_guidelines'),
          style: AppTypography.verifyNoticeText,
        ),
      ],
    );
  }
}