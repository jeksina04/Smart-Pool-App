import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class PlanFeeDisclaimer extends StatelessWidget {
  const PlanFeeDisclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTypography.dayTitle,
        children: [
          TextSpan(
              text: context
                  .getString('my_plan_notice')
                  .split('{cardFee}')[0]),
          const TextSpan(
            text: "2.99%",
            style: TextStyle(fontWeight: FontWeight.w700,),
          ),
          TextSpan(
              text: context
                  .getString('my_plan_notice')
                  .split('{cardFee}')[1]
                  .split('{bankFee}')[0]),
          const TextSpan(
            text: "1%",
            style: TextStyle(fontWeight: FontWeight.w700,),
          ),
          TextSpan(
              text: context
                  .getString('my_plan_notice')
                  .split('{bankFee}')[1]),
        ],
      ),
    );
  }
}