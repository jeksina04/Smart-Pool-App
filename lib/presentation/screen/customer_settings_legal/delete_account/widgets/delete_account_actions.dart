import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class DeleteAccountActions extends StatelessWidget{
  const DeleteAccountActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 56.h,
          decoration: BoxDecoration(
            color: AppColors.deleteAccountBg,
            borderRadius: BorderRadius.circular(28.r),
          ),
          child: InkWell(
            onTap: () {}, // --> Handle Delete My Account button logic
            borderRadius: BorderRadius.circular(28.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.getString('delete_my_account'),
                  style: AppTypography.signInButton,
                ),
              ],
            ),
          ),
        ),

        16.verticalSpace,

        Container(
          width: double.infinity,
          height: 56.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8, offset: const Offset(0, 2))]
          ),
          child: InkWell(
            onTap: () {}, // --> Handle Keep My Account button logic
            borderRadius: BorderRadius.circular(28.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.getString('keep_my_account'),
                  style: AppTypography.logOut,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}