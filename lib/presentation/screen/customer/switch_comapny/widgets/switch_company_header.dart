import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../util/app_typography.dart';

class SwitchCompanyHeader extends StatelessWidget {
  const SwitchCompanyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTypography.infoLabel,
        children: [
          TextSpan(
            text: context.getString('pool_data_notice'),
          ),
          TextSpan(
            text: context.getString('company_data_notice'),
            style: AppTypography.poolHealthScore
          ),
        ],
      ),
    );
  }
}