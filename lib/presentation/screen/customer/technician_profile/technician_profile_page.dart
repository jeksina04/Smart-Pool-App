import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import '../../../service/navigation.dart';
import 'widgets/cover_technician_card.dart';
import 'widgets/message_office_button.dart';
import 'widgets/message_office_disclaimer.dart';
import 'widgets/technician_profile_header_card.dart';
import 'widgets/technician_stats_card.dart';

class TechnicianProfilePage extends StatefulWidget {
  final String? name;
  final String? role;
  final String? experience;
  final String? visitsCount;
  final String? lastVisitDate;
  final String? vehicleInfo;
  final String? coverName;
  final String? coverSubtitle;
  final String? companyName;

  const TechnicianProfilePage({
    super.key,
    this.name,
    this.role,
    this.experience,
    this.visitsCount,
    this.lastVisitDate,
    this.vehicleInfo,
    this.coverName,
    this.coverSubtitle,
    this.companyName,
  });

  @override
  State<TechnicianProfilePage> createState() => _TechnicianProfilePageState();
}

class _TechnicianProfilePageState extends State<TechnicianProfilePage> {
  late String _name;
  late String _role;
  late String _experience;
  late String _visitsCount;
  late String _lastVisitDate;
  late String _vehicleInfo;
  late String _coverName;
  late String _coverSubtitle;
  late String _companyName;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _name = widget.name ?? 'Ray Delgado';
    _companyName = widget.companyName ?? 'NSP Pool & Spa Services';
    _role = widget.role ?? context.getString('lead_technician_subtitle', {'company': _companyName});
    _experience = widget.experience ?? context.getString('with_company_since', {'company': 'NSP', 'date': 'Mar 2024'});
    _visitsCount = widget.visitsCount ?? '21';
    _lastVisitDate = widget.lastVisitDate ?? 'Fri 7 Aug';
    _vehicleInfo = widget.vehicleInfo ?? 'White Ford Transit 250 · NSP-4471';
    _coverName = widget.coverName ?? 'Dan Morris';
    _coverSubtitle = widget.coverSubtitle ?? context.getString('covers_when_away', {'technician': 'Ray', 'count': '3'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: SafeArea(
        child: Column(
          children: [
            /// App Bar Header
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
              child: SizedBox(
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
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(10.w),
                          child: SvgPicture.asset(AppAssets.icBack),
                        ),
                      ),
                    ),
                    Text(
                      context.getString('your_technician'),
                      style: AppTypography.sectionHeader,
                    ),
                  ],
                ),
              ),
            ),
            8.verticalSpace,

            /// Body Scroll Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,

                    /// Technician Profile Top Header Card
                    TechnicianProfileHeaderCard(
                      name: _name,
                      role: _role,
                      experience: _experience,
                    ),
                    16.verticalSpace,

                    /// Visits & Vehicle Stats Card
                    TechnicianStatsCard(
                      visitsCount: _visitsCount,
                      lastVisitDate: _lastVisitDate,
                      vehicleInfo: _vehicleInfo,
                      onLastVisitTap: () {
                        // Open Visit Detail page with visit data
                        Navigator.pushNamed(
                          context,
                          Routes.visitDetail,
                          arguments: {
                            'date': _lastVisitDate,
                            'desc': '$_name · Full clean & balance',
                          },
                        );
                      },
                    ),
                    16.verticalSpace,

                    /// Cover Technician Card
                    CoverTechnicianCard(
                      coverName: _coverName,
                      coverSubtitle: _coverSubtitle,
                      onTap: () {
                        // Action for cover technician
                      },
                    ),
                    16.verticalSpace,

                    /// Office Message Button
                    MessageOfficeButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.dashboard, (route) => false,
                          arguments: {
                            'index': 3,
                            'showSupport': true,
                          },
                        );
                      },
                    ),
                    16.verticalSpace,

                    /// Message Disclaimer
                    MessageOfficeDisclaimer(
                      companyName: _companyName,
                      technicianName: _name.split(' ').first,
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
}