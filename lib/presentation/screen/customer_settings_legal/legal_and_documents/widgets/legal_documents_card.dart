import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer_settings_legal/legal_and_documents/widgets/legal_document_list_item.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../service/navigation.dart';

class LegalDocumentsCard extends StatelessWidget {
  const LegalDocumentsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
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
          children: [
            LegalDocumentListItem(
              icon: AppAssets.icLegalDocuments,
              title: context.getString('terms_and_conditions_title'),
              onTap: () {
                Navigator.pushNamed(context, Routes.termsAndConditions);
              },
            ),
            LegalDocumentListItem(
              icon: AppAssets.icAlert,
              title: context.getString('ai_advisory_disclaimer'),
              subtitle: context.getString('recommendations_are_advisory_only'),
            ),
            LegalDocumentListItem(
              icon: AppAssets.icPrivacyPolicy,
              title: context.getString('privacy_policy'),
              subtitle: context.getString('what_we_collect_and_why'),
            ),
            LegalDocumentListItem(
              icon: AppAssets.icDocument,
              title: context.getString('service_agreement'),
            ),
            LegalDocumentListItem(
              icon: AppAssets.icLicense,
              title: context.getString('warranty_info'),
              isLast: true,
            ),
          ],
        ),
      ),
    ]);
  }
}
