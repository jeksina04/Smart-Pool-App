import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/presentation/service/toast.dart';
import 'package:get_it/get_it.dart';
import '../../../util/app_assets.dart';
import '../../../util/app_colors.dart';
import '../../../util/app_typography.dart';
import '../login/widgets/custom_shadow_text_field.dart';

/// Clean Architecture New Password screen.
class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final NavigationService _navigation = GetIt.I<NavigationService>();
  final ToastService _toast = GetIt.I<ToastService>();

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSavePasswordPressed() {
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (newPassword.isEmpty) {
      _toast.errorToast(context, 'Please enter a new password');
      return;
    }
    if (newPassword.length < 8) {
      _toast.errorToast(context, 'Password must be at least 8 characters');
      return;
    }
    if (confirmPassword.isEmpty) {
      _toast.errorToast(context, 'Please confirm your new password');
      return;
    }
    if (newPassword != confirmPassword) {
      _toast.errorToast(context, 'Passwords do not match');
      return;
    }

    _toast.successToast(context, 'Password updated successfully!');
    _navigation.pushReplacement(Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBFE),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.verticalSpace,

              // ── 1. Top Bar Header (Back button + Centered Title) ────────
              Row(
                children: [
                  GestureDetector(
                    onTap: () => _navigation.pop(),
                    child: Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.cardShadow,
                            offset: Offset(0, 2),
                            blurRadius: 8,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        AppAssets.icBack,
                        width: 16.w,
                        height: 16.w,
                        colorFilter: const ColorFilter.mode(
                          AppColors.darkNavy,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        context.getString('new_password_title'),
                        style: AppTypography.topBarTitle,
                      ),
                    ),
                  ),
                  36.horizontalSpace, // Symmetrical balancing space
                ],
              ),
              20.verticalSpace,

              // ── 2. Subtitle ─────────────────────────────────────────────
              Text(
                context.getString('new_password_subtitle'),
                style: AppTypography.welcomeSubtitle,
              ),
              24.verticalSpace,

              // ── 3. New Password Input ───────────────────────────────────
              CustomShadowTextField(
                label: context.getString('new_password_label'),
                hintText: context.getString('password_char_hint'),
                iconAsset: AppAssets.icPassword,
                controller: _newPasswordController,
                obscureText: !_isNewPasswordVisible,
                trailing: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isNewPasswordVisible = !_isNewPasswordVisible;
                    });
                  },
                  child: Icon(
                    _isNewPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 20.w,
                    color: AppColors.textGrey,
                  ),
                ),
              ),
              16.verticalSpace,

              // ── 4. Confirm New Password Input ───────────────────────────
              CustomShadowTextField(
                label: context.getString('confirm_new_password_label'),
                hintText: context.getString('type_it_again_hint'),
                iconAsset: AppAssets.icPassword,
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                trailing: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                  child: Icon(
                    _isConfirmPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 20.w,
                    color: AppColors.textGrey,
                  ),
                ),
              ),
              24.verticalSpace,

              // ── 5. Save Password Button ─────────────────────────────────
              Container(
                width: double.infinity,
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.cardShadow,
                      offset: Offset(0, 2),
                      blurRadius: 8,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _onSavePasswordPressed,
                    borderRadius: BorderRadius.circular(24.r),
                    child: Center(
                      child: Text(
                        context.getString('save_password_button'),
                        style: AppTypography.signInButton,
                      ),
                    ),
                  ),
                ),
              ),
              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
