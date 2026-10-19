import 'package:ez_localization/ez_localization.dart';import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import '../../../service/navigation.dart';
import 'widgets/company_card_container.dart';
import 'widgets/company_list_item.dart';
import 'widgets/info_banner.dart';
import 'widgets/switch_company_header.dart';

class SwitchCompanyPage extends StatefulWidget {
  const SwitchCompanyPage({super.key});

  @override
  State<SwitchCompanyPage> createState() => _SwitchCompanyPageState();
}

class _SwitchCompanyPageState extends State<SwitchCompanyPage> {
  // Local state to track selection until API is ready
  String _selectedId = '1';

  @override
  Widget build(BuildContext context) {
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
                        width: 36.w,
                        height: 36.w,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(10.w),
                        child: SvgPicture.asset(AppAssets.icBack),
                      ),
                    ),
                  ),
                  Text(
                    context.getString('switch_company_title'),
                    style: AppTypography.sectionHeader,
                  ),
                ],
              ),
            ),
            8.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    const SwitchCompanyHeader(),
                    16.verticalSpace,

                    // --- Active Providers ---
                    // --> Replace with actual data
                    CompanyCardContainer(
                      children: [
                        CompanyListItem(
                          id: '1',
                          name: "NSP Pool & Spa Services",
                          initials: "CP",
                          subtitle: "9142 Willowbend Ct · weekly · 1 invoice due",
                          brandColor: const Color(0xFF1668D6),
                          isSelected: _selectedId == '1',
                          onTap: (id) => setState(() => _selectedId = id),
                        ),
                        CompanyListItem(
                          id: '2',
                          name: "Sunset Pool & Spa",
                          initials: "SP",
                          subtitle: "Lake house · monthly · no balance",
                          brandColor: const Color(0xFF3B7A63),
                          isSelected: _selectedId == '2',
                          onTap: (id) {
                            setState(() => _selectedId = id);
                            // Navigate to Dashboard (Index 0)
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.dashboard,
                                  (route) => false,
                              arguments: 0,
                            );
                          },
                        ),
                      ],
                    ),

                    16.verticalSpace,
                    Text(
                      context.getString('ended'),
                      style: AppTypography.quickActionsHeading,
                    ),
                    16.verticalSpace,

                    // --- Ended Providers ---
                    CompanyCardContainer(
                      children: [
                        CompanyListItem(
                          id: '3',
                          name: "Blue Wave Pools",
                          initials: "BW",
                          subtitle: "Until Feb 2026 · history only",
                          brandColor: const Color(0xFF5F6C7A),
                          isSelected: _selectedId == '3',
                          onTap: (id) {
                            setState(() => _selectedId = id);
                            // Navigate to History (Dashboard Index 2)
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.dashboard,
                                  (route) => false,
                              arguments: 2,
                            );
                          },
                        ),
                      ],
                    ),

                    16.verticalSpace,
                    const InfoBanner(),
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
}