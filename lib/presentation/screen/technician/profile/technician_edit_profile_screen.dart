import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

import 'widgets/tech_profile_header_bar.dart';

/// Screen: "Edit profile" for technician
class TechnicianEditProfileScreen extends StatefulWidget {
  final String initialName;
  final String initialMobile;
  final String initialEmail;

  const TechnicianEditProfileScreen({
    super.key,
    this.initialName = 'Ray Delgado',
    this.initialMobile = '(555) 014-8823',
    this.initialEmail = 'ray@nsppoolspa.com',
  });

  @override
  State<TechnicianEditProfileScreen> createState() =>
      _TechnicianEditProfileScreenState();
}

class _TechnicianEditProfileScreenState
    extends State<TechnicianEditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _mobileController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _mobileController = TextEditingController(text: widget.initialMobile);
    _emailController = TextEditingController(text: widget.initialEmail);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _onSaveChanges() {
    // Pop back to profile screen
    Navigator.of(context).maybePop(_nameController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            /// Header bar with back button and centered title
            TechProfileHeaderBar(
              title: 'Edit profile',
              onBack: () => Navigator.of(context).maybePop(),
            ),

            /// Scrollable form content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 1. Name Field
                    _buildFieldLabel('Name'),
                    8.verticalSpace,
                    _buildTextInputContainer(
                      child: TextFormField(
                        controller: _nameController,
                        style: TextStyle(
                          fontFamily: AppTypography.poppinsFont,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkNavy,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 16.h,
                          ),
                        ),
                      ),
                    ),
                    20.verticalSpace,

                    /// 2. Mobile Field (read-only with phone icon)
                    _buildFieldLabel('Mobile'),
                    8.verticalSpace,
                    _buildTextInputContainer(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 14.h,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              size: 20.w,
                              color: AppColors.textGrey,
                            ),
                            12.horizontalSpace,
                            Expanded(
                              child: Text(
                                _mobileController.text,
                                style: TextStyle(
                                  fontFamily: AppTypography.poppinsFont,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    20.verticalSpace,

                    /// 3. Email Field (read-only)
                    _buildFieldLabel('Email'),
                    8.verticalSpace,
                    _buildTextInputContainer(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 16.h,
                        ),
                        child: Text(
                          _emailController.text,
                          style: TextStyle(
                            fontFamily: AppTypography.poppinsFont,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ),
                    ),
                    20.verticalSpace,

                    /// 4. Info / Warning Callout Banner
                    _buildNoticeBanner(),
                    24.verticalSpace,

                    /// 5. Save Changes Button
                    _buildSaveButton(),
                    24.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontFamily: AppTypography.poppinsFont,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.darkNavy,
      ),
    );
  }

  Widget _buildTextInputContainer({required Widget child}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(26.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08102A50),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildNoticeBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF6E8),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Icon(
              Icons.lock_outline_rounded,
              size: 14.w,
              color: const Color(0xFF8A5814),
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 12.sp,
                  color: const Color(0xFF8A5814),
                  height: 1.45,
                ),
                children: const [
                  TextSpan(
                    text:
                        'Your name you can change freely. Your mobile and email you cannot. ',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Both are how we verify it is you and how dispatch reaches you — changing either sends a 4-digit code to the ',
                  ),
                  TextSpan(
                    text: 'new',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: ' address first.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: _onSaveChanges,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.r),
          ),
        ),
        child: Text(
          'Save changes',
          style: TextStyle(
            fontFamily: AppTypography.poppinsFont,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
