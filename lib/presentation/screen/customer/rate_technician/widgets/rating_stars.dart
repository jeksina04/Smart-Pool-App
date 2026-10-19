import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  final Function(int) onRatingChanged;

  const RatingStars({
    super.key,
    required this.rating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final starIndex = index + 1;
        final isFilled = starIndex <= rating;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: GestureDetector(
            onTap: () => onRatingChanged(starIndex),
            child: SizedBox(
            width: 33.w,
            height: 34.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Filled star for both selected and unselected states
                Icon(
                  Icons.star,
                  size: 33.w,
                  color: isFilled
                      ? const Color(0xFFFFB400)
                      : AppColors.rateTechnicianStar,
                ),

                // Original SVG outline
                SvgPicture.asset(
                  AppAssets.icStar,
                  width: 33.w,
                  height: 34.w,
                  colorFilter: ColorFilter.mode(
                    isFilled
                        ? const Color(0xFFFFB400)
                        : AppColors.rateTechnicianStar,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
          ),
        );
      }),
    );
  }
}