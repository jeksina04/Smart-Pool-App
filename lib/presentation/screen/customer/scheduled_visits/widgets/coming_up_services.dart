import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import 'coming_up_service_item.dart';

class ComingUpServices extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const ComingUpServices({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            context.getString('coming_up'),
            style: AppTypography.quickActionsHeading,
          ),
        16.verticalSpace,
        Container(
        decoration: BoxDecoration(
          color: AppColors.white,
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
          children: List.generate(items.length, (index) {
            final item = items[index];
            return Column(
              children: [
                ComingUpServiceItem(
                  date: item['date'],
                  description: item['desc'],
                ),
                if (index != items.length - 1)
                  const Divider(height: 1, color: AppColors.dividerColor),
              ],
            );
          }),
        ),
                )],
    );
  }
}