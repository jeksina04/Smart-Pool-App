import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class BeforeAfterPhotos extends StatelessWidget {
  final List<Map<String, dynamic>> photos;
  final Function(int) onPhotoTap;

  const BeforeAfterPhotos({
    super.key,
    required this.photos,
    required this.onPhotoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(photos.length, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index == photos.length - 1 ? 0 : 12.w,
            ),
            child: GestureDetector(
              onTap: () => onPhotoTap(index),
              child: _buildItem(photos[index]['label'] ?? ""),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildItem(String label) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primaryBlue.withOpacity(0.2),
            AppColors.primaryBlue.withOpacity(0.5),
          ],
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: AppTypography.cardValueLarge.copyWith(
            fontSize: 13.sp,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}