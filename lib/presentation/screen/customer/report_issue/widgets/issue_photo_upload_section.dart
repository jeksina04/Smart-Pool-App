import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';

class IssuePhotoUploadSection extends StatelessWidget {
  const IssuePhotoUploadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Placeholder for an uploaded photo
        Container(
          width: 88.w,
          height: 88.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            gradient: LinearGradient(
              colors: [
                AppColors.primaryBlue.withOpacity(0.3),
                AppColors.primaryBlue.withOpacity(0.6)
              ],
            ),
          ),
          alignment: Alignment.center,
          child: const Text("pool", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        12.horizontalSpace,

        // The Add Photo Button
        GestureDetector(
          onTap: () => {}, // --> Handle photo upload
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
                child: SvgPicture.asset(AppAssets.icCamera)
              ),
            ),
          ),
        ),
      ],
    );
  }
}
