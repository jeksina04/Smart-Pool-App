import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import 'widgets/profile_header_card.dart';
import 'widgets/profile_list_section.dart';
import 'widgets/profile_list_item.dart';
import '../../../../util/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The main Profile Screen displaying user information and settings categories.
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
                child: Text(
                  context.getString('profile_title'),
                  style: AppTypography.sectionHeader,
                ),
              ),

              8.verticalSpace,

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      10.verticalSpace,
                      /// User name, address and edit profile card
                      // --> Replace with user data
                      const ProfileHeaderCard(
                        name: "Renee Alvarez",
                        address: "9142 Willowbend Ct",
                        plan: "Standard plan"
                      ),
                      16.verticalSpace,

                      /// First group of account related settings
                      ProfileListSection(items: [
                        ProfileListItem(
                          icon: AppAssets.icShoppingBag,
                          title: context.getString('my_service_company'),
                          subtitle: "NSP Pool & Spa Services", // --> Replace with user company name
                        ),
                        ProfileListItem(
                          icon: AppAssets.icDocument,
                          title: context.getString('pool_care_support'),
                          subtitle: context.getString('support_subtitle'),
                        ),
                        ProfileListItem(
                          icon: AppAssets.icCreditCard,
                          title: context.getString('invoices_payments'),
                          badgeText: context.getString('items_due', {'count': '1'}), // --> Replace with user invoice count
                        ),
                        ProfileListItem(
                          icon: AppAssets.icCreditCard,
                          title: context.getString('payment_methods'),
                        ),
                        ProfileListItem(
                          icon: AppAssets.icWrench,
                          title: context.getString('pool_equipment'),
                        ),
                        ProfileListItem(
                          icon: AppAssets.icStar,
                          title: context.getString('membership_plan'),
                          statusText: "Standard", // --> Replace with user plan
                        ),
                      ]),

                      16.verticalSpace,

                      /// Second group of general app settings
                      ProfileListSection(items: [
                        ProfileListItem(
                          icon: AppAssets.icBell,
                          title: context.getString('notifications'),
                          badgeText: "3", // --> Replace with user notification count
                        ),
                        ProfileListItem(
                          icon: AppAssets.icLegalDocuments,
                          title: context.getString('legal_documents'),
                        ),
                        ProfileListItem(
                          icon: AppAssets.icAlert,
                          title: context.getString('help_support'),
                        ),
                        ProfileListItem(
                          icon: AppAssets.icSettings,
                          title: context.getString('settings'),
                        ),
                      ]),

                      16.verticalSpace,

                      /// Logout Action Button
                      _buildLogoutButton(context),

                      8.verticalSpace,
                    ],
                  ),
                ),
              )
            ],
          )
      )
    );
  }

  /// Builds a white rounded button for the Log Out action
  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: InkWell(
        onTap: () {}, // --> Trigger logout logic
        borderRadius: BorderRadius.circular(28.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.icLogout, width: 20.w),
            12.horizontalSpace,
            Text(
              context.getString('log_out'),
              style: AppTypography.dashboardHeading.copyWith(fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}