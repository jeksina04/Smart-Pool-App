import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import 'widgets/add_card_button.dart';
import 'widgets/auto_pay_card.dart';
import 'widgets/payment_method_list_card.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
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
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppAssets.icBack,
                          width: 20.w,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  context.getString('payment_methods_title'),
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
                children: [
                  16.verticalSpace,
                  const PaymentMethodListCard(),
                  16.verticalSpace,
                  const AutoPayCard(),
                  16.verticalSpace,
                  AddCardButton(onPressed: () {}),
                  16.verticalSpace
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
