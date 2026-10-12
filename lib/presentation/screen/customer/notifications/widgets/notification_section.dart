import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import 'notification_item.dart';

class NotificationSection extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> items;
  final Function(Map<String, dynamic>) onItemTap;

  const NotificationSection(
      {super.key,
      required this.title,
      required this.items,
      required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.dayTitle),
        8.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                  color: AppColors.cardShadow,
                  blurRadius: 8,
                  offset: const Offset(0, 2))
            ],
          ),
          child: Column(
            children: List.generate(items.length, (index) {
              final isLast = index == items.length - 1;
              final item = items[index];
              return Column(
                children: [
                  NotificationItemTile(
                    data: item,
                    onTap: () => onItemTap(item),
                  ),
                  if (!isLast)
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
