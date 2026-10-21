import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/add_on_checkout_sheet/widgets/checkout_price_breakdown.dart';
import 'package:flutter_skeleton/presentation/screen/customer/add_on_checkout_sheet/widgets/payment_info_banner.dart';
import 'package:flutter_skeleton/presentation/screen/customer/add_on_checkout_sheet/widgets/payment_method_card.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import '../../../../util/app_assets.dart';

class AddOnCheckoutSheet extends StatefulWidget {
  const AddOnCheckoutSheet({super.key});

  @override
  State<AddOnCheckoutSheet> createState() => _AddOnCheckoutSheetState();
}

class _AddOnCheckoutSheetState extends State<AddOnCheckoutSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r))),
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            8.verticalSpace,
            Container(
                width: 36.w,
                height: 4.h,
                decoration: BoxDecoration(
                    color: AppColors.dividerColor,
                    borderRadius: BorderRadius.circular(2.r))),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.getString('confirm_and_pay'),
                    style: AppTypography.poolCareSupport),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 36.w,
                      height: 36.w,
                      padding: EdgeInsets.all(12.w),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.cardShadow,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        AppAssets.icClose,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CheckoutPriceBreakdown(),
                    8.verticalSpace,
                    const PaymentMethodCard(),
                    8.verticalSpace,
                    const PaymentInfoBanner(),
                    8.verticalSpace,
                    RichText(
                      text: TextSpan(
                        style: AppTypography.disclaimerText,
                        children: [
                          TextSpan(
                              text: context
                                  .getString('filter_clean_payment_info')
                                  .split('{cardFee}')[0]),
                          const TextSpan(
                            text: "2.99%",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.darkNavy),
                          ),
                          TextSpan(
                              text: context
                                  .getString('filter_clean_payment_info')
                                  .split('{cardFee}')[1]
                                  .split('{bankFee}')[0]),
                          const TextSpan(
                            text: "1%",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.darkNavy),
                          ),
                          TextSpan(
                              text: context
                                  .getString('filter_clean_payment_info')
                                  .split('{bankFee}')[1]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 56.h,
              child: ElevatedButton(
                onPressed: () {}, // --> Navigate to payment screen
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.r))),
                child: Text(context.getString('pay', {'price': '\$133.78'}),
                    style: AppTypography.signInButton),
              ),
            ),
            8.verticalSpace,
          ],
        ),
      ),
    );
  }
}
