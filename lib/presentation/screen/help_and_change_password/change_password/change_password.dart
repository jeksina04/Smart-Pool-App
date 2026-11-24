import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/help_and_change_password/change_password/widgets/change_password_input_field.dart';
import 'package:flutter_skeleton/presentation/screen/help_and_change_password/change_password/widgets/password_guidelines_card.dart';
import 'package:flutter_skeleton/presentation/screen/help_and_change_password/change_password/widgets/update_password_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import '../../../service/navigation.dart';
import '../../../service/toast.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final NavigationService _navigation = GetIt.I<NavigationService>();
  final ToastService _toast = GetIt.I<ToastService>();

  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isCurrentPasswordObscured = true;
  bool _isNewPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onUpdatePasswordPressed() {
    final currentPassword = _currentPasswordController.text.trim();
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (currentPassword.isEmpty) {
      _toast.errorToast(context, 'Please enter your current password');
      return;
    }
    if (newPassword.length < 8) {
      _toast.errorToast(context, 'New password must be at least 8 characters');
      return;
    }
    if (newPassword != confirmPassword) {
      _toast.errorToast(context, 'Passwords do not match');
      return;
    }

    _toast.successToast(context, 'Password updated successfully');
    _navigation.pop();
  }

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
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.icBack,
                            width: 20.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    context.getString('change_password_title'),
                    style: AppTypography.sectionHeader,
                  ),
                ],
              ),
            ),
            8.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    ChangePasswordInputField(
                      label: context.getString('current_password_label'),
                      hintText: '·········',
                      iconAsset: AppAssets.icPassword,
                      controller: _currentPasswordController,
                      obscureText: _isCurrentPasswordObscured,
                      showEyeToggle: true,
                      onToggleObscure: () {
                        setState(() {
                          _isCurrentPasswordObscured = !_isCurrentPasswordObscured;
                        });
                      },
                    ),

                    16.verticalSpace,
                    ChangePasswordInputField(
                      label: context.getString('new_password_label'),
                      hintText: context.getString('password_char_hint'),
                      iconAsset: AppAssets.icPassword,
                      controller: _newPasswordController,
                      obscureText: _isNewPasswordObscured,
                      showEyeToggle: true,
                      onToggleObscure: () {
                        setState(() {
                          _isNewPasswordObscured = !_isNewPasswordObscured;
                        });
                      },
                    ),

                    16.verticalSpace,
                    ChangePasswordInputField(
                      label: context.getString('confirm_new_password_label'),
                      hintText: context.getString('repeat_it_hint'),
                      iconAsset: AppAssets.icPassword,
                      controller: _confirmPasswordController,
                      obscureText: _isConfirmPasswordObscured,
                      showEyeToggle: false,
                    ),
                    16.verticalSpace,

                    const PasswordGuidelinesCard(),
                    16.verticalSpace,

                    UpdatePasswordButton(
                      onPressed: _onUpdatePasswordPressed,
                    ),
                    16.verticalSpace,
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