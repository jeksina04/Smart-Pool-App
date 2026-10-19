import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/service_paused/widgets/service_pause_action_item.dart';
import '../../../../../util/app_colors.dart';


/// A wrapper card that groups multiple action items
class ServicePauseActionsSection extends StatelessWidget {
  final List<ServicePauseActionItem> items;

  const ServicePauseActionsSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
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