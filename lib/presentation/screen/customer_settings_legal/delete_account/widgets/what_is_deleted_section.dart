import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import 'delete_account_list_item.dart';

class WhatIsDeletedSection extends StatelessWidget {
  const WhatIsDeletedSection({super.key});

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
            DeleteAccountListItem(
              icon: AppAssets.icNavProfile,
              title: context.getString('your_profile_and_sign_in'),
            ),
            DeleteAccountListItem(
              icon: AppAssets.icCamera,
              title: context.getString('service_history_and_photographs'),
              subtitle: context.getString('including_images_of_every_visit'),
            ),
            DeleteAccountListItem(
              icon: AppAssets.icCreditCard,
              title: context.getString('saved_payment_methods'),
            ),
            DeleteAccountListItem(
              icon: AppAssets.icDocument,
              title: context.getString('support_conversations'),
              isLast: true,
            ),
          ],
        ),
      ),
    ]);
  }
}
