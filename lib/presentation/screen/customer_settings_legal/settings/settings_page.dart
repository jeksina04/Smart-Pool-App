import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer_settings_legal/settings/widgets/notification_toggle_item.dart';
import 'package:flutter_skeleton/presentation/screen/customer_settings_legal/settings/widgets/setting_item.dart';
import 'package:flutter_skeleton/presentation/screen/customer_settings_legal/settings/widgets/settings_list_section.dart';
import 'package:flutter_skeleton/presentation/screen/customer_settings_legal/settings/widgets/user_detail_card.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_typography.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool visitReminders = true;
  bool techOnWay = true;
  bool invoicesPayments = true;
  bool marketing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: SafeArea(
          child: Column(children: [
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
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.cardShadow,
                              blurRadius: 8,
                              offset: Offset(0, 2))
                        ]),
                    padding: EdgeInsets.all(10.w),
                    child: SvgPicture.asset(AppAssets.icBack),
                  ),
                ),
              ),
              Text(
                context.getString('settings_title'),
                style: AppTypography.sectionHeader,
              ),
            ],
          ),
        ),
        8.verticalSpace,
        Expanded(
            child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(children: [
                  10.verticalSpace,
                  // --> Replace with user data
                  UserDetailCard(
                      name: "Renee Alvarez",
                      email: "renee@example.com",
                      phoneNumber: "+1 555 0134"),

                  16.verticalSpace,

                  SettingsListSection(items: [
                    SettingItem(
                        icon: AppAssets.icSend,
                        title: context.getString('change_email'),
                        subtitle: context.getString('change_email_description'),
                        onTap: () {}),
                    SettingItem(
                        icon: AppAssets.icPhone,
                        title: context.getString('change_mobile'),
                        subtitle:
                            context.getString('change_mobile_description'),
                        onTap: () {}),
                    SettingItem(
                      icon: AppAssets.icLocation,
                      title: context.getString('address_or_pool_location'),
                      subtitle: context.getString(
                          'address', {'address': '9142 Willowbend Ct'}),
                      onTap: () {},
                    ),
                    SettingItem(
                        icon: AppAssets.icChangePassword,
                        title: context.getString('change_password'),
                        onTap: () {})
                  ]),

                  16.verticalSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      context.getString('notifications'),
                      style: AppTypography.quickActionsHeading,
                    ),
                  ),

                  8.verticalSpace,
                  SettingsListSection(items: [
                    NotificationToggleItem(
                      title: context.getString('visit_reminders'),
                      subtitle: context.getString('day_before_a_visit'),
                      value: visitReminders,
                      onChanged: (v) => setState(() => visitReminders = v),
                    ),
                    NotificationToggleItem(
                      title: context.getString('technician_on_the_way'),
                      subtitle: context.getString('when_your_tech_starts'),
                      value: techOnWay,
                      onChanged: (v) => setState(() => techOnWay = v),
                    ),
                    NotificationToggleItem(
                      title: context.getString('invoices_and_payments'),
                      value: invoicesPayments,
                      onChanged: (v) => setState(() => invoicesPayments = v),
                    ),
                    NotificationToggleItem(
                      title: context.getString('marketing'),
                      value: marketing,
                      onChanged: (v) => setState(() => marketing = v),
                    ),
                  ]),

                  8.verticalSpace,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(context.getString('app_version'),
                          style: AppTypography.infoLabel),
                      Text('1.0.0 (build 24)', style: AppTypography.infoLabel),
                    ],
                  ),

                  16.verticalSpace,

                  _buildLogoutButton(context),
                  8.verticalSpace
                ])))
      ])),
    );
  }

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
            offset: const Offset(0, 2),
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
              style: AppTypography.logOut,
            ),
          ],
        ),
      ),
    );
  }
}
