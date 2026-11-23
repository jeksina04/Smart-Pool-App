import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/equipment_inspection/widgets/equipment_know_section.dart.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import '../equipment_inspection_checkout_sheet/equipment_inspection_checkout_sheet.dart';
import 'widgets/equipment_inspection_bottom_action.dart';
import 'widgets/equipment_inspection_header_card.dart';
import 'widgets/inspection_info_banner.dart';
import 'widgets/inspection_included_section.dart';
import 'widgets/inspection_payment_disclaimer.dart';

class EquipmentInspectionPage extends StatefulWidget {
  final double basePrice;
  final List<String>? includedItems;
  final String? noticeText;
  final String companyName;
  final double salesTaxRate;
  final double cardFeeRate;

  const EquipmentInspectionPage({
    super.key,
    this.basePrice = 85.00,
    this.includedItems,
    this.noticeText,
    this.companyName = 'NSP Pool & Spa Services',
    this.salesTaxRate = 8.25,
    this.cardFeeRate = 2.99,
  });

  @override
  State<EquipmentInspectionPage> createState() => _EquipmentInspectionPageState();
}

class _EquipmentInspectionPageState extends State<EquipmentInspectionPage> {

  // --> Replace with actual dynamic data
  final List<String> includedItems = [
        'Pump, filter and heater checked and run through a cycle',
        'Salt cell inspected and cleaned if needed',
        'Timers and automation settings checked',
        'Written report with photos on your record',
  ];

  // Formatted price
  String get _formattedPrice => '\$${widget.basePrice.toStringAsFixed(0)}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: SafeArea(
        child: Column(
          children: [
            /// Header
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
                  Text(
                    context.getString('equipment_inspection'),
                    style: AppTypography.sectionHeader,
                  ),
                ],
              ),
            ),

            8.verticalSpace,

            /// Scrollable Body Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,

                    /// Service Header Card
                    EquipmentInspectionHeaderCard(
                      title: context.getString('equipment_inspection'),
                      subtitle: context.getString('by_your_technician', {'duration': '45–60 min'}),
                      priceFormatted: _formattedPrice,
                    ),

                    16.verticalSpace,

                    /// Included Items
                    InspectionIncludedSection(
                      includedItems: includedItems,
                    ),

                    16.verticalSpace,

                    /// Info Banner
                    InspectionInfoBanner(
                      noticeText: context.getString('equipment_inspection_notice'),
                    ),

                    8.verticalSpace,

                    /// Payment Disclaimer
                    InspectionPaymentDisclaimer(
                      cardFeeRate: widget.cardFeeRate,
                    ),

                    16.verticalSpace,

                    /// Good To Know Section
                    const EquipmentKnowSection(),

                    16.verticalSpace,

                    /// Bottom Action Button
                    EquipmentInspectionBottomAction(
                      priceFormatted: _formattedPrice,
                      onBuyPressed: () => showCheckoutSheet(context),
                    ),

                    8.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Checkout Bottom Sheet
  void showCheckoutSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.90,
          child: EquipmentInspectionCheckoutSheet(
            serviceTitle: context.getString('equipment_inspection'),
            basePrice: widget.basePrice,
            salesTaxRate: widget.salesTaxRate,
            cardFeeRate: widget.cardFeeRate,
            companyName: widget.companyName,
          ),
        );
      },
    );
  }
}