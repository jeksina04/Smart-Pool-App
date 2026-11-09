import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class NotificationToggleItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationToggleItem({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: AppTypography.sectionHeader),
                if (subtitle != null) ...[
                  Text(subtitle!, style: AppTypography.infoLabel),
                ],
              ],
            ),
          ),
          Switch.adaptive(
            value: value,
            activeColor: Colors.white,
            activeTrackColor: AppColors.primaryBlue,
            onChanged: onChanged),
        ],
      ),
    );
  }
}
