import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

import 'widgets/my_day_header_bar.dart';

/// Screen: "Items used today"
/// Shows products/chemicals and equipment parts used across stops today.
class ItemsUsedTodayScreen extends StatelessWidget {
  const ItemsUsedTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Bar with circular back button & title "Items used today"
            MyDayHeaderBar(
              title: 'Items used today',
              onBack: () => Navigator.of(context).maybePop(),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subtitle: Date · stops
                    Text(
                      'Monday 4 August · 3 stops',
                      style: TextStyle(
                        fontFamily: AppTypography.poppinsFont,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGrey,
                      ),
                    ),
                    18.verticalSpace,

                    // 1. Customer: Kaiden Roth
                    _buildCustomerSection(
                      customerName: 'Kaiden Roth',
                      items: [
                        _ItemData(
                          iconAsset: AppAssets.icWrench,
                          title: 'Salt cell O-ring',
                          quantity: '×1',
                        ),
                      ],
                    ),
                    18.verticalSpace,

                    // 2. Customer: Alicia Keys
                    _buildCustomerSection(
                      customerName: 'Alicia Keys',
                      items: [
                        _ItemData(
                          iconAsset: AppAssets.icShoppingList,
                          title: 'Bag of salt 40lb',
                          quantity: '×1',
                        ),
                        _ItemData(
                          iconAsset: AppAssets.icFlask,
                          title: 'Cal-hypo shock',
                          quantity: '1 lb',
                        ),
                      ],
                    ),
                    18.verticalSpace,

                    // 3. Customer: Clay Shannon
                    _buildCustomerSection(
                      customerName: 'Clay Shannon',
                      items: [
                        _ItemData(
                          iconAsset: AppAssets.icShoppingList,
                          title: 'Bag of salt 40lb',
                          quantity: '×1',
                        ),
                      ],
                    ),
                    18.verticalSpace,

                    // 4. Total today card
                    _buildTotalTodayCard(),
                    24.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerSection({
    required String customerName,
    required List<_ItemData> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          customerName,
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.darkNavy,
          ),
        ),
        10.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18.r),
            boxShadow: const [
              BoxShadow(
                color: Color(0x08102A50),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: List.generate(items.length, (index) {
              final item = items[index];
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                    child: Row(
                      children: [
                        // Icon Box
                        Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEDF4FE),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              item.iconAsset,
                              width: 19.w,
                              height: 19.w,
                              colorFilter: const ColorFilter.mode(
                                AppColors.primaryBlue,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        14.horizontalSpace,

                        // Item Title
                        Expanded(
                          child: Text(
                            item.title,
                            style: TextStyle(
                              fontFamily: AppTypography.poppinsFont,
                              fontSize: 14.5.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkNavy,
                            ),
                          ),
                        ),
                        10.horizontalSpace,

                        // Quantity / measure
                        Text(
                          item.quantity,
                          style: TextStyle(
                            fontFamily: AppTypography.poppinsFont,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (index != items.length - 1)
                    const Divider(height: 1, thickness: 1, color: Color(0xFFF0F3F6)),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalTodayCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08102A50),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 13.5.sp,
            color: AppColors.darkNavy,
            height: 1.45,
          ),
          children: const [
            TextSpan(
              text: 'Total today   ',
              style: TextStyle(
                color: Color(0xFF5F6C7A),
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Salt ×2 · Cal-hypo 1 lb · O-ring ×1',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: AppColors.darkNavy,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemData {
  final String iconAsset;
  final String title;
  final String quantity;

  _ItemData({
    required this.iconAsset,
    required this.title,
    required this.quantity,
  });
}
