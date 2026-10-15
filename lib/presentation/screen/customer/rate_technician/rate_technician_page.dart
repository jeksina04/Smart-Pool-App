import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/rate_technician/widgets/rate_visit_info_banner.dart';
import 'package:flutter_skeleton/presentation/screen/customer/rate_technician/widgets/rating_stars.dart';
import 'package:flutter_skeleton/presentation/screen/customer/rate_technician/widgets/technician_info_card.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';

class RateTechnicianPage extends StatefulWidget {
  const RateTechnicianPage({super.key});

  @override
  State<RateTechnicianPage> createState() => _RateTechnicianPageState();
}

class _RateTechnicianPageState extends State<RateTechnicianPage> {
  int _currentRating = 0;

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
                          boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8, offset: Offset(0,2))]
                        ),
                        padding: EdgeInsets.all(10.w),
                        child: SvgPicture.asset(AppAssets.icBack),
                      ),
                    ),
                  ),
                  Text(
                    context.getString('rate_visit_title'),
                    style: AppTypography.sectionHeader,
                  ),
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
                    // --> Replace with real data
                    TechnicianRatingCard(
                      initials: "RD",
                      name: "Ray Delgado",
                      dateText: context.getString('serviced_your_pool_on', {'date': '28 July'}),
                      ratingWidget: RatingStars(
                        rating: _currentRating,
                        onRatingChanged: (rating) {
                          setState(() => _currentRating = rating);
                        },
                      ),
                    ),

                    16.verticalSpace,
                    // Rating Info Banner
                    const RatingInfoBanner(),
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