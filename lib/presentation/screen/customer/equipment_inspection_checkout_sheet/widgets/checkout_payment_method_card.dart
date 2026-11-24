import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';

class CheckoutPaymentMethodCard extends StatelessWidget {
  final String cardType;
  final String cardLastFour;
  final String companyName;

  const CheckoutPaymentMethodCard({
    super.key,
    this.cardType = 'Visa',
    this.cardLastFour = '6411',
    this.companyName = 'NSP Pool & Spa Services',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        leading: Container(
          width: 40.w,
          height: 40.w,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: AppColors.infoBannerBg,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: SvgPicture.asset(AppAssets.icCreditCard,),
        ),
        title: Text(
          "$cardType •••• $cardLastFour",
          style: AppTypography.sectionHeader,
        ),
        subtitle: Text(
          context.getString('on_file_with', {'company': companyName}),
          style: AppTypography.infoLabel,
        ),
        trailing: SvgPicture.asset(AppAssets.icChevronRight),
      ),
    );
  }
}