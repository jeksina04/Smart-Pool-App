import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/util/app_colors.dart';
import 'package:flutter_skeleton/util/app_typography.dart';

import 'widgets/change_password_header_bar.dart';

/// Screen: "Change password" for technician
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Column(
          children: [
            /// Header bar with back button and centered title
            ChangePasswordHeaderBar(
              title: 'Change password',
              onBack: () => Navigator.of(context).maybePop(),
            ),

            /// Scrollable Body Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Current password field
                    _buildFieldLabel('Current password'),
                    8.verticalSpace,
                    _buildPasswordField(
                      controller: _currentPasswordController,
                      hintText: '••••••••',
                      obscureText: _obscureCurrent,
                      onToggleVisibility: () {
                        setState(() => _obscureCurrent = !_obscureCurrent);
                      },
                    ),
                    20.verticalSpace,

                    /// New password field
                    _buildFieldLabel('New password'),
                    8.verticalSpace,
                    _buildPasswordField(
                      controller: _newPasswordController,
                      hintText: 'At least 8 characters',
                      obscureText: _obscureNew,
                      onToggleVisibility: () {
                        setState(() => _obscureNew = !_obscureNew);
                      },
                    ),
                    20.verticalSpace,

                    /// Confirm new password field
                    _buildFieldLabel('Confirm new password'),
                    8.verticalSpace,
                    _buildPasswordField(
                      controller: _confirmPasswordController,
                      hintText: 'Repeat it',
                      obscureText: _obscureConfirm,
                      showToggleIcon: false,
                    ),
                    16.verticalSpace,

                    /// Info / Helper note card
                    _buildInfoCard(),
                    28.verticalSpace,

                    /// Update password Primary Button
                    _buildUpdatePasswordButton(),
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

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required bool obscureText,
    bool showToggleIcon = true,
    VoidCallback? onToggleVisibility,
  }) {
    return Container(
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(26.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06102A50),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          /// Leading lock outline icon
          Icon(
            Icons.lock_outline_rounded,
            size: 20.w,
            color: const Color(0xFF7B8794),
          ),
          12.horizontalSpace,

          /// Text Field
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              style: TextStyle(
                fontFamily: AppTypography.poppinsFont,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.darkNavy,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontFamily: AppTypography.poppinsFont,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF9AA5B5),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),

          /// Trailing eye visibility icon (if enabled)
          if (showToggleIcon)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onToggleVisibility,
              child: Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Icon(
                  obscureText
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined,
                  size: 20.w,
                  color: const Color(0xFF7B8794),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06102A50),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        'Use at least 8 characters. A longer passphrase beats a short complicated one.',
        style: TextStyle(
          fontFamily: AppTypography.poppinsFont,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textGrey,
          height: 1.4,
        ),
      ),
    );
  }

  Widget _buildUpdatePasswordButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {
          // Trigger password update
          Navigator.of(context).maybePop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.r),
          ),
        ),
        child: Text(
          'Update password',
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
