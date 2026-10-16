import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/add_on_detail/widgets/add_info_banner.dart';
import 'package:flutter_skeleton/presentation/screen/customer/add_on_detail/widgets/add_on_header.dart';
import 'package:flutter_skeleton/presentation/screen/customer/add_on_detail/widgets/good_to_know_section.dart';
import 'package:flutter_skeleton/presentation/screen/customer/add_on_detail/widgets/included_section.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../add_on_checkout_sheet/add_on_checkout_sheet.dart';

class AddOnDetailPage extends StatefulWidget {
  const AddOnDetailPage({super.key});

  @override
  State<AddOnDetailPage> createState() => _AddOnDetailPageState();
}

class _AddOnDetailPageState extends State<AddOnDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: SafeArea(
        child: Column(
          children: [
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
                        padding: EdgeInsets.all(10.w),
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
                        child: SvgPicture.asset(AppAssets.icBack),
                      ),
                    ),
                  ),
                  Text(context.getString('filter_deep_clean'),
                      style: AppTypography.sectionHeader),
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
                    // --> Replace with Actual duration and price
                    // Filter Deep Clean card
                    AddOnHeaderCard(
                      title: context.getString('filter_deep_clean'),
                      subtitle: context.getString('by_your_technician', {'duration': '60-90 min'}),
                      price: "\$120",
                    ),
                    16.verticalSpace,
                    // Included services
                    const IncludedSection(),
                    16.verticalSpace,
                    // Information banner
                    const AddOnInfoBanner(),
                    16.verticalSpace,
                    // Payment Information
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
                    16.verticalSpace,
                    // Good to know section
                    const GoodToKnowSection(),
                    16.verticalSpace,
                    // Buy Now button
                    _buildBottomAction(context),
                    16.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAction(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 56.h,
            child: ElevatedButton(
              onPressed: () => _showCheckoutSheet(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.r)),
                elevation: 0,
              ),
              child: Text(context.getString('buy_now', {'price': '\$120'}),
                  style: AppTypography.signInButton),
            ),
          ),
          8.verticalSpace,
          // Cancellation notice
          Text(
            context.getString('cancellation_notice'),
            style: AppTypography.dayTitle,
          ),
          16.verticalSpace,
        ],
      ),
    );
  }

  void _showCheckoutSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.90,
          child: const AddOnCheckoutSheet(),
        );
      },
    );
  }
}
