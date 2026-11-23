import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import '../../../service/navigation.dart';
import 'widgets/add_technician_note_button.dart';
import 'widgets/planned_visit_card.dart';
import 'widgets/request_different_day_button.dart';
import 'widgets/upcoming_visit_header_card.dart';
import 'widgets/upcoming_visit_info_banner.dart';
import 'widgets/who_is_coming_card.dart';

class UpcomingVisitPage extends StatefulWidget {
  final String? dateTitle;
  final String? fullDateTime;
  final String? plannedTitle;
  final String? plannedFrequency;
  final String? plannedDescription;
  final String? technicianName;
  final String? technicianRole;
  final String? vehicleName;
  final String? vehicleInstruction;

  const UpcomingVisitPage({
    super.key,
    this.dateTitle,
    this.fullDateTime,
    this.plannedTitle,
    this.plannedFrequency,
    this.plannedDescription,
    this.technicianName,
    this.technicianRole,
    this.vehicleName,
    this.vehicleInstruction,
  });

  @override
  State<UpcomingVisitPage> createState() => _UpcomingVisitPageState();
}

class _UpcomingVisitPageState extends State<UpcomingVisitPage> {
  late String _dateTitle;
  late String _fullDateTime;
  late String _plannedTitle;
  late String _plannedFrequency;
  late String _plannedDescription;
  late String _technicianName;
  late String _technicianRole;
  late String _vehicleName;
  late String _vehicleInstruction;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // --> Hardcoded values for testing purpose.
    _dateTitle = widget.dateTitle ?? 'Fri 14 Aug';
    _fullDateTime = widget.fullDateTime ?? 'Fri 14 Aug · 10:00 AM – 12:00 PM';
    _plannedTitle = widget.plannedTitle ?? context.getString('full_clean_and_balance');
    _plannedFrequency = widget.plannedFrequency ?? context.getString('weekly_tag');
    _plannedDescription = widget.plannedDescription ?? context.getString('planned_visit_default_desc');
    _technicianName = widget.technicianName ?? 'Ray Delgado';
    _technicianRole = widget.technicianRole ?? 'Lead technician · NSP Pool & Spa Services';
    _vehicleName = widget.vehicleName ?? 'White Ford Transit 250 · NSP-4471';
    _vehicleInstruction = widget.vehicleInstruction ?? context.getString('check_the_plate_of_vehicle');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: SafeArea(
        child: Column(
          children: [
            /// Header Bar
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
                      _dateTitle,
                      style: AppTypography.sectionHeader,
                    ),
                  ],
                ),
              ),
            ),
            8.verticalSpace,

            /// Scrollable Body Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,

                    /// Scheduled Visit Top Card
                    UpcomingVisitHeaderCard(
                      fullDateTime: _fullDateTime,
                      technicianName: _technicianName,
                    ),
                    16.verticalSpace,

                    /// Planned For This Visit Section
                    PlannedVisitCard(
                      title: _plannedTitle,
                      frequencyTag: _plannedFrequency,
                      description: _plannedDescription,
                    ),
                    16.verticalSpace,

                    /// Who Is Coming Section
                    WhoIsComingCard(
                      technicianName: _technicianName,
                      technicianRole: _technicianRole,
                      vehicleName: _vehicleName,
                      vehicleInstruction: _vehicleInstruction,
                    ),
                    16.verticalSpace,

                    /// Notification Info Banner
                    UpcomingVisitInfoBanner(
                      technicianName: _technicianName,
                    ),
                    16.verticalSpace,

                    /// Request a Different Day Action Button
                    RequestDifferentDayButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.requestService);
                      },
                    ),
                    16.verticalSpace,

                    /// Add Note for Technician Action Button
                    AddTechnicianNoteButton(
                      onPressed: () {
                        // --> Handle add note for technician logic
                      },
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