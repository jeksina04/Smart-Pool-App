import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import 'history_card_item.dart';

class HistorySection extends StatelessWidget {
  final String header;
  final List<Map<String, dynamic>> items;

  const HistorySection({
    super.key,
    required this.header,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: Text(
            header,
            style: AppTypography.dashboardHeading.copyWith(fontSize: 18.sp),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: const [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Column(
            children: List.generate(items.length, (index) {
              final item = items[index];
              return Column(
                children: [
                  HistoryCardItem(
                    date: item['date'],
                    description: item['desc'],
                    isRepair: item['isRepair'] ?? false,
                  ),
                  if (index != items.length - 1)
                    const Divider(height: 1, color: AppColors.dividerColor),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}