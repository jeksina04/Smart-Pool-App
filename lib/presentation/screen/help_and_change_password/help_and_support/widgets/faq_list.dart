import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_assets.dart';
import 'package:flutter_skeleton/util/app_typography.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../util/app_colors.dart';
import '../../../../service/navigation.dart';

class FAQList extends StatelessWidget {
  const FAQList({super.key});

  @override
  Widget build(BuildContext context) {
    final questions = [
      "Why is my pool cloudy after a visit?",
      "How do I change my visit day?",
      "What is included in a routine visit?",
      "How is my bill calculated?",
      "Who can enter my property?",
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(questions.length, (index) {
          return Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                title: Text(
                  questions[index],
                  style: AppTypography.sectionHeader,
                ),
                trailing: SvgPicture.asset(
                  AppAssets.icChevronRight,
                ),
                onTap: () {
                  _navigateToFAQ(context, index);
                },
              ),

              // Divider except for the last item
              if (index != questions.length - 1)
                const Divider(
                  height: 1,
                  color: AppColors.dividerColor,
                ),
            ],
          );
        }),
      ),
    );
  }

  void _navigateToFAQ(BuildContext context, int index) {
    switch (index) {
      case 0:
        break;

      case 1:
        break;

      case 2:
        // --> Navigate to terms and conditions page;
        break;

      case 3:
        Navigator.pushNamed(context, Routes.invoices);
        break;

      case 4:
        break;
    }
  }
}
