import 'package:flutter/material.dart';import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final String? time;

  const ChatBubble({super.key, required this.message, required this.isUser, this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Align(
          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            constraints: BoxConstraints(maxWidth: 0.75.sw),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: isUser ? AppColors.primaryBlue : AppColors.recurringQuoteBg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
                bottomLeft: Radius.circular(isUser ? 20.r : 6.r),
                bottomRight: Radius.circular(isUser ? 6.r : 20.r),
              ),
            ),
            child: Text(
              message,
              style: isUser
                  ? AppTypography.onboardingSubtitle.copyWith(color: AppColors.white)
                  : AppTypography.onboardingSubtitle,
            ),
          ),
        ),
        if (time != null) ...[
          6.verticalSpace,
          Text(time!, style: AppTypography.dayTitle),
        ]
      ],
    );
  }
}