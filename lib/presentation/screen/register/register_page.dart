import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/presentation/service/toast.dart';
import 'package:get_it/get_it.dart';
import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import '../login/widgets/custom_shadow_text_field.dart';
import 'widgets/homeowner_info_banner.dart';
import 'widgets/register_terms_checkbox.dart';

/// Clean Architecture Create Account / Registration screen.
class RegistrationPage extends StatefulWidget {
  final String? initialName;

  const RegistrationPage([this.initialName, Key? key]) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final NavigationService _navigation = GetIt.I<NavigationService>();
  final ToastService _toast = GetIt.I<ToastService>();

  late final TextEditingController _nameController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isTermsAccepted = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.initialName == "New Account" || widget.initialName == "Smoke"
          ? ''
          : (widget.initialName ?? ''),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onCreateAccountPressed() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isEmpty) {
      _toast.errorToast(context, 'Please enter your full name');
      return;
    }
    if (email.isEmpty) {
      _toast.errorToast(context, 'Please enter your email');
      return;
    }
    if (phone.isEmpty) {
      _toast.errorToast(context, 'Please enter your phone number');
      return;
    }
    if (password.length < 8) {
      _toast.errorToast(context, 'Password must be at least 8 characters');
      return;
    }
    if (!_isTermsAccepted) {
      _toast.errorToast(context, 'Please accept Privacy Policy and Terms of Service');
      return;
    }

    _toast.successToast(context, 'Verification code sent to $phone');
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
                        context.getString('create_account_title'),
                        style: AppTypography.topBarTitle,
                      ),
                    ),
                  ),
                  36.horizontalSpace, // Balancing spacing to keep title center-aligned
                ],
              ),
              20.verticalSpace,

              // ── 2. Homeowners Info Banner ──────────────────────────────
              const HomeownerInfoBanner(),
              20.verticalSpace,

              // ── 3. Full Name Input ─────────────────────────────────────
              CustomShadowTextField(
                label: context.getString('full_name_label'),
                hintText: context.getString('full_name_hint'),
                iconAsset: AppAssets.icCustomer,
                controller: _nameController,
                keyboardType: TextInputType.name,
              ),
              12.verticalSpace,

              // ── 4. Email Input ─────────────────────────────────────────
              CustomShadowTextField(
                label: context.getString('email_label'),
                hintText: context.getString('email_hint'),
                iconAsset: AppAssets.icEmail,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              12.verticalSpace,

              // ── 5. Phone Input ─────────────────────────────────────────
              CustomShadowTextField(
                label: context.getString('phone_label'),
                hintText: context.getString('phone_hint'),
                iconAsset: AppAssets.icPhone,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
              ),
              12.verticalSpace,

              // ── 6. Password Input ──────────────────────────────────────
              CustomShadowTextField(
                label: context.getString('password_label'),
                hintText: context.getString('password_char_hint'),
                iconAsset: AppAssets.icPassword,
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                trailing: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  child: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 20.w,
                    color: AppColors.textGrey,
                  ),
                ),
              ),
              18.verticalSpace,

              // ── 7. Terms & AI Advisory Checkbox ────────────────────────
              RegisterTermsCheckbox(
                isAccepted: _isTermsAccepted,
                onChanged: (accepted) {
                  setState(() {
                    _isTermsAccepted = accepted;
                  });
                },
                onPrivacyPolicyTap: () {
                  _toast.successToast(context, 'Privacy Policy');
                },
                onTermsOfServiceTap: () {
                  _toast.successToast(context, 'Terms of Service');
                },
              ),
              24.verticalSpace,

              // ── 8. Verification Notice Text ────────────────────────────
              Center(
                child: Text(
                  context.getString('verify_number_notice'),
                  style: AppTypography.verifyNoticeText,
                  textAlign: TextAlign.center,
                ),
              ),
              16.verticalSpace,

              // ── 9. Create Account Button ───────────────────────────────
              Container(
                width: double.infinity,
                height: 42.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(28.r),
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
                    onTap: _onCreateAccountPressed,
                    borderRadius: BorderRadius.circular(24.r),
                    child: Center(
                      child: Text(
                        context.getString('create_account_button'),
                        style: AppTypography.signInButton,
                      ),
                    ),
                  ),
                ),
              ),
              32.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
