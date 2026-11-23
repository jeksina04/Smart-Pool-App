import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class MessageOfficeDisclaimer extends StatelessWidget {
  final String companyName;
  final String technicianName;

  const MessageOfficeDisclaimer({
    super.key,
    required this.companyName,
    required this.technicianName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      context.getString(
        'technician_message_disclaimer',
        {
          'company': companyName,
          'technician': technicianName,
        },
      ),
      textAlign: TextAlign.center,
      style: AppTypography.dividerText
    );
  }
}