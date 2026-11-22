import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class QuoteNotesSection extends StatelessWidget {
  const QuoteNotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.getString('notes_label'), style: AppTypography.inputLabel),
        8.verticalSpace,
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: const [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: context.getString('pool_condition_hint'),
              hintStyle: AppTypography.notesHint,
              border: InputBorder.none,
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}