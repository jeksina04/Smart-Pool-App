import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_colors.dart';
import 'profile_list_item.dart';

/// A wrapper card that groups multiple [ProfileListItem] widgets together
class ProfileListSection extends StatelessWidget {
  final List<ProfileListItem> items;

  const ProfileListSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          return Column(
            children: [
              items[index],
              /// Add a divider between items except for the last one
              if (index != items.length - 1)
                const Divider(height: 1, color: AppColors.dividerColor),
            ],
          );
        }),
      ),
    );
  }
}