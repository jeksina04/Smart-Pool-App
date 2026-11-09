import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class HowToPayMethodsCard extends StatelessWidget {
  const HowToPayMethodsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 8,
                offset: Offset(0, 2))
          ]),
      child: Column(
        children: [
          _buildMethod(
            context,
            AppAssets.icDocument,
            context.getString('cheque'),
            context.getString('cheque_details', {'company_details': 'NSP Pool and Spa ServicesPO Box 17971, Sugar Land TX 77496-7971'}),
          ),
          _buildMethod(
            context,
            AppAssets.icSend,
            context.getString('zelle'),
            "(832) 846-6830",
          ),
          _buildMethod(
            context,
            AppAssets.icCreditCard,
            context.getString('bank_transfer'),
            context.getString('bank_transfer_details'),
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildMethod(BuildContext context, String icon, String title, String subtitle, {bool isLast = false}) {
    return Column(children: [
      ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        // Icon inside a light blue rounded square
        leading: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: AppColors.infoBannerBg,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: SvgPicture.asset(
            icon,
            width: 20.w,
            height: 20.w,
            colorFilter: const ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),
          ),
        ),
        title: Text(title, style: AppTypography.sectionHeader),
        subtitle: Text(subtitle, style: AppTypography.infoLabel)
      ),
      if (!isLast)
        const Divider(
          height: 1,
          color: AppColors.dividerColor,
        ),
    ]);
  }
}
