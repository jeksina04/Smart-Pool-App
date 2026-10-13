import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
              color: AppColors.messageShadow,
              blurRadius: 28,
              offset: const Offset(0, 8))
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.icAdd, width: 22.w, height: 22.h, colorFilter: ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),),
          12.horizontalSpace,
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: context.getString('message_hint'),
                hintStyle: AppTypography.notesHint,
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          Container(
            height: 44.w,
            width: 44.w,
            decoration: const BoxDecoration(
                color: AppColors.dividerColor, shape: BoxShape.circle),
            child: Center(child: SvgPicture.asset(AppAssets.icSend,))
          )
        ],
      ),
    );
  }
}
