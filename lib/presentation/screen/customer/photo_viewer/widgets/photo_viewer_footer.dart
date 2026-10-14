import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';

import '../../../../../util/app_typography.dart';

class PhotoViewerFooter extends StatelessWidget {
  final Map<String, dynamic> photoData;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  const PhotoViewerFooter(
      {super.key, required this.photoData, this.onPrev, this.onNext});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${photoData['label']} · ${photoData['time']}",
          style: AppTypography.photoViewerLabel,
        ),
        4.verticalSpace,
        Text(
          "${photoData['date']} · geotagged",
          style: AppTypography.photoInfo
        ),
        30.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _navButton(context.getString('prev'), onPrev),
            16.horizontalSpace,
            _navButton(context.getString('next'), onNext),
          ],
        ),
      ],
    );
  }

  Widget _navButton(String label, VoidCallback? onTap) {
    return Opacity(
      opacity: onTap == null ? 0.5 : 1.0,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(22.r),
            boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8, offset: Offset(0, 2))]
          ),
          child: Text(label, style: AppTypography.photoViewerBtn),
        ),
      ),
    );
  }
}
