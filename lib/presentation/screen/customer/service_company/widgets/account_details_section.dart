import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import 'company_list_item.dart';

class AccountDetailsSection extends StatelessWidget {
  const AccountDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8)],
      ),
      child: Column(
        children: [
          // --> Replace with actual account details and handle taps
          CompanyListItem(
            icon: AppAssets.icStar,
            title: context.getString('plan'),
            trailingText: "Standard",
            onTap: () {},
          ),
          CompanyListItem(
            icon: AppAssets.icCalendar,
            title: context.getString('service_day'),
            trailingText: "Fridays, weekly",
            onTap: () {},
          ),
          CompanyListItem(
            icon: AppAssets.icUserId,
            title: context.getString('customer_reference'),
            trailingText: "#4471",
            showArrow: false,
          ),
          CompanyListItem(
            icon: AppAssets.icLegalDocuments,
            title: context.getString('service_agreement'),
            subtitle: context.getString('service_agreement_subtitle', {'company': 'NSP Pool & Spa Services'}),
            isLast: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}