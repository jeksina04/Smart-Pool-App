import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class PhotoViewerHeader extends StatelessWidget {
  final int currentIndex;
  final int totalPhotos;
  final VoidCallback onBack;

  const PhotoViewerHeader({
    super.key,
    required this.currentIndex,
    required this.totalPhotos,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBack,
            child: _circleIcon(AppAssets.icChevronLeft),
          ),
          Text(
            context.getString('photos',
                {'currentId': '$currentIndex', 'totalPhotos': totalPhotos}),
            style: AppTypography.photosHeader
          ),
          _circleIcon(AppAssets.icDocument),
        ],
      ),
    );
  }

  Widget _circleIcon(String asset) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: Offset(0, 2))
          ]),
      child: SvgPicture.asset(
        asset,
        width: 18.w,
        colorFilter:
            const ColorFilter.mode(AppColors.darkNavy, BlendMode.srcIn),
      ),
    );
  }
}
