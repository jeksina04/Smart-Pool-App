import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_typography.dart';

class PhotoDisplayCard extends StatelessWidget {
  final Map<String, dynamic> photoData;

  const PhotoDisplayCard({super.key, required this.photoData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      width: 369.w,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          // Gradient placeholder representing the image with overlay text
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade200, Colors.blue.shade400],
          ),
        ),
        child: Center(
          child: Text(
            "${photoData['label']} · ${photoData['time']}",
            style: AppTypography.cardValueLarge.copyWith(fontSize: 20.sp),
          ),
        ),
      ),
    );
  }
}