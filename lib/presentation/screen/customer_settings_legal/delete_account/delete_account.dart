import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer_settings_legal/delete_account/widgets/delete_account_actions.dart';
import 'package:flutter_skeleton/presentation/screen/customer_settings_legal/delete_account/widgets/delete_account_notice.dart';
import 'package:flutter_skeleton/presentation/screen/customer_settings_legal/delete_account/widgets/unpaid_balance_notice.dart';
import 'package:flutter_skeleton/presentation/screen/customer_settings_legal/delete_account/widgets/what_is_deleted_section.dart';
import 'package:flutter_skeleton/presentation/screen/customer_settings_legal/delete_account/widgets/what_is_kept.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_typography.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: SafeArea(
          child: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 36.w,
                    height: 36.w,
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.cardShadow,
                              blurRadius: 8,
                              offset: Offset(0, 2))
                        ]),
                    padding: EdgeInsets.all(10.w),
                    child: SvgPicture.asset(AppAssets.icBack),
                  ),
                ),
              ),
              Text(
                context.getString('delete_account_title'),
                style: AppTypography.sectionHeader,
              ),
            ],
          ),
        ),
        8.verticalSpace,
        Expanded(
            child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                const DeleteAccountNotice(),
                16.verticalSpace,
                Text(context.getString('what_is_deleted'),
                    style: AppTypography.quickActionsHeading),
                8.verticalSpace,
                const WhatIsDeletedSection(),
                16.verticalSpace,
                Text(context.getString('what_is_kept'),
                    style: AppTypography.quickActionsHeading),
                8.verticalSpace,
                const WhatIsKept(),
                16.verticalSpace,
                const UnpaidBalanceNotice(),
                16.verticalSpace,
                DeleteAccountActions(),
                8.verticalSpace
            ]),
        ))
      ])),
    );
  }
}
