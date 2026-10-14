import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import '../../../service/navigation.dart';
import 'widgets/before_after_photos.dart';
import 'widgets/chemicals_added_card.dart';
import 'widgets/readings_taken_section.dart';
import 'widgets/tasks_completed_card.dart';
import 'widgets/technician_info_card.dart';
import 'widgets/visit_action_buttons.dart';

class VisitDetailPage extends StatefulWidget {
  final Map<String, dynamic> visitData;

  const VisitDetailPage({super.key, required this.visitData});

  @override
  State<VisitDetailPage> createState() => _VisitDetailPageState();
}

class _VisitDetailPageState extends State<VisitDetailPage> {
  @override
  Widget build(BuildContext context) {
    final String date = widget.visitData['date'] ?? "";
    final String desc = widget.visitData['desc'] ?? "";
    final String techName = desc.split(' · ').first;
    // Format title: e.g., "28 Jul · Ray"
    final String title = "${date.split(' ').take(2).join(' ')} · $techName";

    // --> Visit Photos
    final List<Map<String, dynamic>> visitPhotos = [
      {
        'label': 'BEFORE',
        'time': '10:42am',
        'date': widget.visitData['date'] ?? '28 Jul 2026',
      },
      {
        'label': 'AFTER',
        'time': '11:15am',
        'date': widget.visitData['date'] ?? '28 Jul 2026',
      },
    ];

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
                        padding: EdgeInsets.all(10.w),
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.cardShadow, blurRadius: 8, offset: Offset(0, 2))
                          ],
                        ),
                        child: SvgPicture.asset(AppAssets.icBack),
                      ),
                    ),
                  ),
                  Text(title, style: AppTypography.sectionHeader),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    10.verticalSpace,
                    // Technician Info Card
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.serviceCompany);
                        },
                        child: const TechnicianInfoCard()),

                    16.verticalSpace,
                    // Before/After Photos
                    BeforeAfterPhotos(
                      photos: visitPhotos,
                      onPhotoTap: (index) {
                        Navigator.pushNamed(
                          context,
                          Routes.photoViewer,
                          arguments: {
                            'initialIndex': index,
                            'photos': visitPhotos,
                          },
                        );
                      },
                    ),

                    16.verticalSpace,
                    // Readings Taken
                    const ReadingsTakenSection(),

                    16.verticalSpace,
                    // Tasks Completed
                    const TasksCompletedCard(),

                    16.verticalSpace,
                    // Chemicals Added
                    const ChemicalsAddedCard(),

                    24.verticalSpace,
                    // Visit Actions
                    const VisitActionButtons(),
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
