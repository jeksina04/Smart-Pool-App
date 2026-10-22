import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import 'referral_item_tile.dart';

class YourReferralsSection extends StatelessWidget {
  const YourReferralsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.getString('your_referrals'),
          style: AppTypography.quickActionsHeading,
        ),
        8.verticalSpace,
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                    color: AppColors.cardShadow,
                    blurRadius: 8.r,
                    offset: Offset(0, 2))
              ]),
          child: Column(
            children: [
              // --> Replace with actual data
              ReferralItemTile(
                icon: AppAssets.icCustomer,
                title: "Maria G.",
                subtitle:
                    context.getString('joined_status_paid', {'date': '2 Aug'}),
                status: context.getString('status_credited'),
              ),
              const Divider(height: 1, color: AppColors.cardBorder),
              ReferralItemTile(
                icon: AppAssets.icCustomer,
                title: "Dev P.",
                subtitle:
                    context.getString('invited_status', {'date': '9 Aug'}),
                status: context.getString('status_invited'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
