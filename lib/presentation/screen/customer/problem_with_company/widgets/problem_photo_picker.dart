import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';

class ProblemPhotoPicker extends StatelessWidget {
  final List<String> photoPaths;
  final VoidCallback onAddPhoto;
  final ValueChanged<int>? onRemovePhoto;

  const ProblemPhotoPicker({
    super.key,
    this.photoPaths = const [],
    required this.onAddPhoto,
    this.onRemovePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return // The Add Photo Button
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
      );
  }
}