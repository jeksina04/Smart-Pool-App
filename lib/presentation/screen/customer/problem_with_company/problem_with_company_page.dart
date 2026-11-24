import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/customer/problem_with_company/widgets/what_is_it_about_section.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import 'widgets/problem_photo_picker.dart';
import 'widgets/support_notice_card.dart';

class ProblemWithCompanyPage extends StatefulWidget {
  final String companyName;

  const ProblemWithCompanyPage({
    super.key,
    this.companyName = 'NSP Pool & Spa Services',
  });

  @override
  State<ProblemWithCompanyPage> createState() => _ProblemWithCompanyPageState();
}

class _ProblemWithCompanyPageState extends State<ProblemWithCompanyPage> {
  int _selectedTopicIndex = 0;
  bool _shareReportWithCompany = false;
  final TextEditingController _notesController = TextEditingController();
  final List<String> _attachedPhotos = [];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: SafeArea(
        child: Column(
          children: [
            /// Header
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
              child: SizedBox(
                height: 40.h,
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
                      context.getString('report_problem_title'),
                      style: AppTypography.sectionHeader,
                    ),
                  ],
                ),
              ),
            ),
            8.verticalSpace,

            /// Content Body
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,

                    /// Top Support Notice
                    SupportNoticeCard(companyName: widget.companyName),
                    16.verticalSpace,

                    /// Category Selector
                    Text(
                      context.getString('what_is_it_about'),
                      style: AppTypography.inputLabel,
                    ),
                    8.verticalSpace,
                    WhatIsItAboutSection(
                      selectedIndex: _selectedTopicIndex,
                      onTopicSelected: (index) {
                        setState(() {
                          _selectedTopicIndex = index;
                        });
                      },
                    ),
                    16.verticalSpace,

                    /// Problem Description
                    Text(
                      context.getString('what_happened'),
                      style: AppTypography.inputLabel,
                    ),
                    8.verticalSpace,
                    Container(
                      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.cardShadow,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _notesController,
                        maxLines: 3,
                        style: AppTypography.inputText,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: context.getString('what_happened_hint'),
                          hintStyle: AppTypography.notesHint,
                          isDense: true,
                        ),
                      ),
                    ),
                    16.verticalSpace,

                    /// Photos Attachment
                    Text(
                      context.getString('photos_optional'),
                      style: AppTypography.inputLabel,
                    ),
                    8.verticalSpace,
                    ProblemPhotoPicker(
                      photoPaths: _attachedPhotos,
                      onAddPhoto: () {
                        // --> Handle photo attachment logic
                      },
                      onRemovePhoto: (index) {
                        setState(() {
                          _attachedPhotos.removeAt(index);
                        });
                      },
                    ),
                    16.verticalSpace,

                    /// Share Permission Checkbox
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _shareReportWithCompany = !_shareReportWithCompany;
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 22.w,
                            height: 22.w,
                            child: Checkbox(
                              value: _shareReportWithCompany,
                              onChanged: (value) {
                                setState(() {
                                  _shareReportWithCompany = value ?? false;
                                });
                              },
                              activeColor: AppColors.primaryBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              side: BorderSide(
                                color: AppColors.timerButtonText,
                                width: 2.w,
                              ),
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child: Text(
                                context.getString(
                                  'share_report_with_company',
                                  {'company': widget.companyName},
                                ),
                                style: AppTypography.infoLabel
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    16.verticalSpace,

                    /// Send Button
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle report submission logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlue,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.r),
                          ),
                        ),
                        child: Text(
                          context.getString('send'),
                          style: AppTypography.signInButton,
                        ),
                      ),
                    ),
                    8.verticalSpace,

                    /// Urgent Notice Footer
                    Center(
                      child: Text(
                        context.getString(
                          'urgent_safety_notice',
                          {'phone': '(832) 846-6830'},
                        ),
                        textAlign: TextAlign.center,
                        style: AppTypography.dividerText
                      ),
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