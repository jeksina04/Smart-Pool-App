import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import '../../../../service/navigation.dart';

class DeleteAccountCard extends StatelessWidget {
  const DeleteAccountCard({super.key});

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
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, Routes.deleteAccount);
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              leading: Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.deleteAccountIconBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: SvgPicture.asset(
                  AppAssets.icDelete,
                ),
              ),
              title: Text(context.getString('delete_account_title'), style: AppTypography.sectionHeader),
              trailing: SvgPicture.asset(AppAssets.icChevronRight),
            ),
          ],
        ),
      ),
    ]);
  }
}
