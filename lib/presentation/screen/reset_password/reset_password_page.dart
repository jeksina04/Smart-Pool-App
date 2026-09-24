import 'dart:async';
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
import '../verify/widgets/otp_input_widget.dart';

/// Clean Architecture Reset Password screen with inline countdown and OTP verification.
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final NavigationService _navigation = GetIt.I<NavigationService>();
  final ToastService _toast = GetIt.I<ToastService>();
  final TextEditingController _phoneController = TextEditingController();

  bool _isOtpSent = false;
  int _secondsLeft = 30;
  Timer? _timer;
  String _enteredOtp = '';

  @override
  void dispose() {
    _timer?.cancel();
    _phoneController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _secondsLeft = 30;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() {
          _secondsLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String get _formattedTime {
    final s = _secondsLeft.toString().padLeft(2, '0');
    return '00:$s';
  }

  void _onSendOtpPressed() {
    final phone = _phoneController.text.trim();
    if (phone.isEmpty) {
      _toast.errorToast(context, 'Please enter your mobile number');
      return;
    }

    setState(() {
      _isOtpSent = true;
    });
    _startTimer();
    _toast.successToast(context, 'OTP sent to $phone');
  }

  void _onVerifyPressed() {
    if (_enteredOtp.length < 4) {
      _toast.errorToast(context, 'Please enter the complete 4-digit code');
      return;
    }

    _navigation.push(Routes.newPassword);
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
                        context.getString('reset_password_title'),
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
                context.getString('reset_password_subtitle'),
                style: AppTypography.welcomeSubtitle,
              ),
              24.verticalSpace,

              // ── 3. Mobile Number Input ──────────────────────────────────
              CustomShadowTextField(
                label: context.getString('mobile_number_label'),
                hintText: context.getString('phone_hint'),
                iconAsset: AppAssets.icPhone,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
              ),
              24.verticalSpace,

              // ── 4. Send OTP / Countdown Button ──────────────────────────
              Container(
                width: double.infinity,
                height: 48.h,
                decoration: BoxDecoration(
                  color: _isOtpSent
                      ? AppColors.timerButtonBg
                      : AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: _isOtpSent
                      ? null
                      : const [
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
                    onTap: _isOtpSent
                        ? (_secondsLeft == 0 ? _onSendOtpPressed : null)
                        : _onSendOtpPressed,
                    borderRadius: BorderRadius.circular(24.r),
                    child: Center(
                      child: Text(
                        _isOtpSent
                            ? (_secondsLeft == 0
                                ? context.getString('send_otp_button')
                                : context.getString('code_sent_resend_in',
                                    {'time': _formattedTime}))
                            : context.getString('send_otp_button'),
                        style: _isOtpSent
                            ? (_secondsLeft == 0
                                ? AppTypography.signInButton
                                : AppTypography.timerButtonTextStyle)
                            : AppTypography.signInButton,
                      ),
                    ),
                  ),
                ),
              ),

              // ── 5. Inline OTP Section (Shown when OTP is sent) ──────────
              if (_isOtpSent) ...[
                28.verticalSpace,
                Center(
                  child: Text(
                    context.getString('enter_the_4_digit_code'),
                    style: AppTypography.enterFourDigitCodeTitle,
                  ),
                ),
                20.verticalSpace,
                OtpInputWidget(
                  boxWidth: 48.w,
                  boxHeight: 56.h,
                  onOtpChanged: (otp) {
                    _enteredOtp = otp;
                  },
                  onCompleted: (otp) {
                    _enteredOtp = otp;
                    _onVerifyPressed();
                  },
                ),
                28.verticalSpace,
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
                      onTap: _onVerifyPressed,
                      borderRadius: BorderRadius.circular(24.r),
                      child: Center(
                        child: Text(
                          context.getString('verify_button'),
                          style: AppTypography.signInButton,
                        ),
                      ),
                    ),
                  ),
                ),
              ],

              32.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
