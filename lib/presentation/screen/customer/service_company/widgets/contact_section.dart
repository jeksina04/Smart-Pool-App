import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import 'company_list_item.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
          // --> Replace with actual contact info
          const CompanyListItem(
            icon: AppAssets.icPhone,
            title: "(832) 846-6830",
            subtitle: "Office · Mon–Fri 8am–5pm",
          ),
          const CompanyListItem(
            icon: AppAssets.icEmail,
            title: "nsppool108@gmail.com",
          ),
          const CompanyListItem(
            icon: AppAssets.icLocation,
            title: "PO Box 17971, Sugar Land TX 77496-7971",
          ),
          CompanyListItem(
            icon: AppAssets.icLicense,
            title: context.getString('licence_label', {'number': '#TX-PC-40218'}),
            subtitle: context.getString('licence_subtitle'),
            isLast: true,
          ),
        ],
      ),
    );
  }
}