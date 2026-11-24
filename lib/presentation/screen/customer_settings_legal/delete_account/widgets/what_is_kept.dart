import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import 'delete_account_list_item.dart';

class WhatIsKept extends StatelessWidget {
  const WhatIsKept({super.key});

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
              icon: AppAssets.icDocument,
              title: context.getString('paid_invoices'),
              subtitle: context.getString('invoice_retention_notice'),
              isLast: true,
            ),
          ],
        ),
      ),
    ]);
  }
}
