import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/green_pool_recovery/widgets/quote_date_section.dart';
import 'package:flutter_skeleton/presentation/screen/customer/green_pool_recovery/widgets/quote_header_card.dart';
import 'package:flutter_skeleton/presentation/screen/customer/green_pool_recovery/widgets/quote_notes_section.dart';
import 'package:flutter_skeleton/presentation/screen/customer/green_pool_recovery/widgets/quote_notice_banner.dart';
import 'package:flutter_skeleton/presentation/screen/customer/green_pool_recovery/widgets/quote_photo_upload_section.dart';
import 'package:flutter_skeleton/presentation/screen/customer/green_pool_recovery/widgets/quote_submit_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';

class GreenPoolRecoveryPage extends StatefulWidget {
  const GreenPoolRecoveryPage({super.key});


  @override
  State<GreenPoolRecoveryPage> createState() => _GreenPoolRecoveryPageState();
}

class _GreenPoolRecoveryPageState extends State<GreenPoolRecoveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: SafeArea(
        child: Column(
          children: [
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
                          ),
                          padding: EdgeInsets.all(10.w),
                          child: SvgPicture.asset(
                            AppAssets.icBack,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      context.getString('request_quote_title'),
                      style: AppTypography.sectionHeader,
                    ),
                  ],
                ),
              ),
            ),
            8.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const QuoteHeaderCard(),
                    16.verticalSpace,
                    const QuotePhotoUploadSection(),
                    16.verticalSpace,
                    const QuoteNotesSection(),
                    16.verticalSpace,
                    const QuoteDateSection(),
                    16.verticalSpace,
                    const QuoteNoticeBanner(),
                    16.verticalSpace,
                    const QuoteSubmitButton(),
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