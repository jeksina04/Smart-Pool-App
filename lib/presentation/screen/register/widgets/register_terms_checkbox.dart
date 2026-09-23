import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';

/// Terms acceptance checkbox for registration screen including AI dosage advisory notice.
class RegisterTermsCheckbox extends StatelessWidget {
  final bool isAccepted;
  final ValueChanged<bool> onChanged;
  final VoidCallback? onPrivacyPolicyTap;
  final VoidCallback? onTermsOfServiceTap;

  const RegisterTermsCheckbox({
    super.key,
    required this.isAccepted,
    required this.onChanged,
    this.onPrivacyPolicyTap,
    this.onTermsOfServiceTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => onChanged(!isAccepted),
          child: Container(
            width: 20.w,
            height: 20.w,
            margin: EdgeInsets.only(top: 2.h),
            decoration: BoxDecoration(
              color: isAccepted ? AppColors.primaryBlue : AppColors.white,
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                color: isAccepted ? AppColors.primaryBlue : AppColors.dividerColor,
                width: 1.5,
              ),
            ),
            child: isAccepted
                ? Icon(
                    Icons.check,
                    size: 14.w,
                    color: AppColors.white,
                  )
                : null,
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(!isAccepted),
            child: Text.rich(
              TextSpan(
                text: context.getString('register_terms_start'),
                style: AppTypography.termsNormal,
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: GestureDetector(
                      onTap: onPrivacyPolicyTap,
                      child: Text(
                        context.getString('privacy_policy'),
                        style: AppTypography.termsHighlight,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: context.getString('and_text'),
                    style: AppTypography.termsNormal,
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: GestureDetector(
                      onTap: onTermsOfServiceTap,
                      child: Text(
                        context.getString('terms_of_service'),
                        style: AppTypography.termsHighlight,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: context.getString('register_terms_end'),
                    style: AppTypography.termsNormal,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
