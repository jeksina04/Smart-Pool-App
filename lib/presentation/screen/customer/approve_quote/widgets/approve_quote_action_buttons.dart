import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class ApproveQuoteActionButtons extends StatelessWidget {
  final String total;
  final bool isRecurring;
  final VoidCallback onApprove;

  const ApproveQuoteActionButtons({
    super.key,
    required this.total,
    required this.isRecurring,
    required this.onApprove,
  });

  @override
  Widget build(BuildContext context) {
    String approveKey = isRecurring ? 'approve_recurring_amount' : 'approve_amount';
    String approveText = context.getString(approveKey, {'amount': total});

    return Column(
      children: [
        // Approve Button
        SizedBox(
          width: double.infinity,
          height: 54.h,
          child: ElevatedButton(
            onPressed: onApprove,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
              elevation: 0,
            ),
            child: Text(approveText, style: AppTypography.buttonText),
          ),
        ),
        16.verticalSpace,

        // Decline Button
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SizedBox(
            width: double.infinity,
            height: 54.h,
            child: ElevatedButton(
              onPressed: () {}, // --> Handle decline button press
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
              ),
              child: Text(
                context.getString('decline'),
                style: AppTypography.nextButton,
              ),
            ),
          ),
        ),
        16.verticalSpace,

        // Ask Question
        InkWell(
          onTap: () {}, // --> Handle ask question button press
          borderRadius: BorderRadius.circular(28.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.getString('ask_question_first'),
                style: AppTypography.requestTestText,
              ),
            ],
          ),
        )
      ],
    );
  }
}
