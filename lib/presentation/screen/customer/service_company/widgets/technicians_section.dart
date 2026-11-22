import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/app_assets.dart';
import '../../../../../util/app_colors.dart';
import '../../../../../util/app_typography.dart';
import '../../../../service/navigation.dart';
import 'company_list_item.dart';

class TechniciansSection extends StatelessWidget {
  const TechniciansSection({super.key});

  // Temporary dummy data until API integration.
  static const String companyName = 'NSP Pool & Spa Services';

  static const List<Map<String, String>> technicians = [
    {
      'name': 'Ray Delgado',
      'role': 'Lead technician · NSP Pool & Spa Services',
      'subtitle': 'Lead technician · most of your visits',
      'experience':
      'With NSP since Mar 2024 · background checked',
      'visitsCount': '21',
      'lastVisitDate': 'Fri 7 Aug',
      'vehicleInfo': 'White Ford Transit 250 · NSP-4471',
      'coverName': 'Dan Morris',
      'coverSubtitle': 'Covers when Ray is away · 3 visits',
    },
    {
      'name': 'Dan Morris',
      'role': 'Technician · NSP Pool & Spa Services',
      'subtitle': 'Covers when Ray is away',
      'experience': 'With NSP since Jan 2025',
      'visitsCount': '3',
      'lastVisitDate': 'Mon 3 Aug',
      'vehicleInfo': 'Company vehicle',
      'coverName': '',
      'coverSubtitle': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              ...technicians.asMap().entries.map((entry) {
                final index = entry.key;
                final technician = entry.value;

                return CompanyListItem(
                  icon: AppAssets.icNavProfile,
                  title: technician['name']!,
                  subtitle: technician['subtitle']!,
                  isLast: index == technicians.length - 1,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.technicianProfile,
                      arguments: {
                        'name': technician['name'],
                        'role': technician['role'],
                        'experience': technician['experience'],
                        'visitsCount': technician['visitsCount'],
                        'lastVisitDate': technician['lastVisitDate'],
                        'vehicleInfo': technician['vehicleInfo'],
                        'coverName': technician['coverName'],
                        'coverSubtitle': technician['coverSubtitle'],
                        'companyName': companyName,
                      },
                    );
                  },
                );
              }),
            ],
          ),
        ),
        16.verticalSpace,
        // Technician Notice Banner
        Container(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.w, 8.h),
          decoration: BoxDecoration(
            color: AppColors.infoBannerBg,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: SvgPicture.asset(
                    AppAssets.icLicense,
                    height: 8.w,
                  )),
              8.horizontalSpace,
              // --> Replace with actual company name
              Expanded(
                child: Text(
                    context.getString('technician_employment_notice',
                        {'company': 'NSP Pool & Spa Services'}),
                    style: AppTypography.stripText),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
