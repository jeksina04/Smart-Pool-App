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
import 'verify_number_args.dart';
import 'widgets/otp_input_widget.dart';
import 'widgets/resend_timer_widget.dart';

/// Verify Number / OTP Screen according to design specs.
class VerifyNumberPage extends StatefulWidget {
  final VerifyNumberArgs args;

  const VerifyNumberPage({
    super.key,
    required this.args,
  });

  @override
  State<VerifyNumberPage> createState() => _VerifyNumberPageState();
}

class _VerifyNumberPageState extends State<VerifyNumberPage> {
  final NavigationService _navigation = GetIt.I<NavigationService>();
  final ToastService _toast = GetIt.I<ToastService>();

  String _enteredOtp = '';
  bool _isLoading = false;

  void _onVerifyPressed() {
    if (_enteredOtp.length < 4) {
      _toast.errorToast(context, 'Please enter the complete 4-digit code');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      _toast.successToast(context, 'Account verified successfully!');
      _navigation.pushReplacement(Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomSafeInset = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FBFE),
      body: Stack(
        children: [
          // ── Background Bottom Wave ──────────────────────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: Image.asset(
                AppAssets.bottomWave,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),

          // ── Screen Content ──────────────────────────────────────
          SafeArea(
            bottom: true,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            16.verticalSpace,

                            // ── 1. Back Button ──────────────────────────────
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
                            16.verticalSpace,

                            // ── 2. Top Verification Icon ────────────────────
                            Center(
                              child: SvgPicture.asset(
                                AppAssets.icVerifyNumber,
                                width: 120.w,
                                height: 120.w,
                                fit: BoxFit.contain,
                              ),
                            ),
                            24.verticalSpace,

                            // ── 3. Title ────────────────────────────────────
                            Center(
                              child: Text(
                                context.getString('verify_your_number'),
                                style: AppTypography.verifyTitle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            8.verticalSpace,

                            // ── 4. Subtitle ─────────────────────────────────
                            Center(
                              child: Text(
                                context.getString('code_sent_to'),
                                style: AppTypography.verifySubtitle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            6.verticalSpace,

                            // ── 5. Phone & Edit Row ─────────────────────────
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.args.phoneNumber,
                                  style: AppTypography.phoneDisplay,
                                ),
                                8.horizontalSpace,
                                GestureDetector(
                                  onTap: () => _navigation.pop(),
                                  child: Text(
                                    context.getString('edit'),
                                    style: AppTypography.phoneEdit,
                                  ),
                                ),
                              ],
                            ),
                            28.verticalSpace,

                            // ── 6. 4-Box OTP Input ──────────────────────────
                            OtpInputWidget(
                              onOtpChanged: (otp) {
                                _enteredOtp = otp;
                              },
                              onCompleted: (otp) {
                                _enteredOtp = otp;
                                _onVerifyPressed();
                              },
                            ),
                            16.verticalSpace,

                            // ── 7. Autofill Helper Notice ───────────────────
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(
                                context.getString('autofill_messages_notice'),
                                style: AppTypography.autoFillNotice,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            28.verticalSpace,

                            // ── 8. Verify & Create Account Button ───────────
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
                                    child: _isLoading
                                        ? SizedBox(
                                            width: 22.w,
                                            height: 22.w,
                                            child: const CircularProgressIndicator(
                                              strokeWidth: 2.5,
                                              color: AppColors.white,
                                            ),
                                          )
                                        : Text(
                                            context.getString(
                                                'verify_and_create_account_button'),
                                            style: AppTypography.signInButton,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            20.verticalSpace,

                            // ── 9. Resend Code Timer ────────────────────────
                            ResendTimerWidget(
                              onResend: () {
                                _toast.successToast(
                                  context,
                                  'New verification code sent to ${widget.args.phoneNumber}',
                                );
                              },
                            ),

                            const Spacer(),

                            // ── 10. Bottom Safe Margin ──────────────────────
                            SizedBox(height: 18.h + bottomSafeInset),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
