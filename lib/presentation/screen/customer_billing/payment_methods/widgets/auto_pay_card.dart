import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class AutoPayCard extends StatefulWidget {
  const AutoPayCard({super.key});

  @override
  State<AutoPayCard> createState() => _AutoPayCardState();
}

class _AutoPayCardState extends State<AutoPayCard> {
  bool _isAutoPayEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.getString('auto_pay'),
                    style: AppTypography.companyNameText),
                4.verticalSpace,
                Text(context.getString('auto_pay_desc'),
                    style: AppTypography.cardTitle),
              ],
            ),
          ),
          Switch.adaptive(
            value: _isAutoPayEnabled,
            activeColor: Colors.white,
            activeTrackColor: AppColors.primaryBlue,
            onChanged: (value) => setState(() => _isAutoPayEnabled = value),
          ),
        ],
      ),
    );
  }
}
