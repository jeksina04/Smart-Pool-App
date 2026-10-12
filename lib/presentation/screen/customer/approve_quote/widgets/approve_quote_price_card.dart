import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class ApproveQuotePriceCard extends StatelessWidget {
  final Map<String, dynamic> quote;
  const ApproveQuotePriceCard({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Column(
            children: quote['prices'].asMap().entries.map<Widget>((entry) {
              final index = entry.key;
              final price = entry.value;
              final isLast = index == quote['prices'].length - 1;

              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Row(
                      children: [
                        Text(
                          price['label'],
                          style: AppTypography.sectionHeader,
                        ),
                        const Spacer(),
                        Text(
                          price['value'],
                          style: AppTypography.infoLabel,
                        ),
                      ],
                    ),
                  ),
                  if (!isLast)
                    const Divider(
                      height: 1,
                      color: AppColors.dividerColor,
                    ),
                ],
              );
            }).toList(),
          ),
        ),

        // Recurring Quote Section
        if (quote['isRecurring']) ...[
          16.verticalSpace,
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.recurringQuoteBg,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.cardShadow,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      quote['recurringDetail'],
                      style: AppTypography.quoteDetailValue,
                    ),
                    Text(
                      quote['total'],
                      style: AppTypography.quickActionsHeading,
                    ),
                  ],
                ),
                4.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.getString('recurring_over_months', {'months': '12'}),
                      style: AppTypography.infoLabel,
                    ),
                    Text(
                      quote['annualTotal'],
                      style: AppTypography.quoteDetailInfo,
                    ),
                  ],
                ),
                8.verticalSpace,
                Text(
                  quote['disclaimer'],
                  style: AppTypography.disclaimerText.copyWith(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ]
      ],
    );
  }
}