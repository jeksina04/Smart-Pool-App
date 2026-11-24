import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer_billing/invoice_detail/widgets/invoice_detail_payment_section_widget.dart';
import 'package:flutter_skeleton/presentation/screen/customer_billing/invoice_detail/widgets/item_card_widget.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import '../../../service/navigation.dart';
import 'widgets/invoice_detail_summary_card.dart';
import 'widgets/invoice_detail_footer.dart';

class InvoiceDetailPage extends StatefulWidget {
  final Map<String, dynamic> invoice;

  const InvoiceDetailPage({super.key, required this.invoice});

  @override
  State<InvoiceDetailPage> createState() => _InvoiceDetailPageState();
}

class _InvoiceDetailPageState extends State<InvoiceDetailPage> {
  @override
  Widget build(BuildContext context) {
    final invoice = widget.invoice;
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
                  padding: EdgeInsets.all(10.w),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.cardShadow,
                          blurRadius: 8,
                          offset: Offset(0, 2))
                    ],
                  ),
                  child: SvgPicture.asset(AppAssets.icBack),
                ),
              ),
            ),
            Text("Invoice ${invoice['id']}", style: AppTypography.sectionHeader),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {}, // --> Handle tap
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.cardShadow,
                          blurRadius: 8,
                          offset: Offset(0, 2))
                    ],
                  ),
                  child: SvgPicture.asset(
                        AppAssets.icDocument,
                        width: 18.w,
                        height: 18.w,
                        colorFilter: ColorFilter.mode(
                            AppColors.darkNavy, BlendMode.srcIn),
                      ),
                    ),
              ),
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
              10.verticalSpace,
              InvoiceDetailSummaryCard(),
              16.verticalSpace,
              InvoiceDetailItemsCard(),
              16.verticalSpace,
              _buildVisitLink(context),
              16.verticalSpace,
              InvoiceDetailPaymentSection(invoice: invoice,),
              16.verticalSpace,
              InvoiceDetailFooter(invoice: invoice,),
              16.verticalSpace,
            ],
          ),
        ),
      ),
    ])));
  }

  Widget _buildVisitLink(BuildContext context) {
    return Row(
      children: [
        Text(context.getString('linked_to_visit', {'date': '18 Aug'}),
            style: AppTypography.infoLabel),
        GestureDetector(
          onTap: () {
            // --> Replace with Actual Data
             Navigator.pushNamed(
              context,
              Routes.visitDetail,
              arguments: {
                'date': '18 Aug 2026',
                'desc': 'Ray Delgado · 7 tasks · 4 photos',
                'isRepair': false,
              },
            );
          },
          child: Text(context.getString('view_visit'),
              style: AppTypography.bottomTextHighlight),
        ),
      ],
    );
  }
}