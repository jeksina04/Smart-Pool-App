import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/domain/interactor/interactor.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/presentation/service/toast.dart';
import 'package:get_it/get_it.dart';
import '../../../../util/app_assets.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_typography.dart';
import '../../../domain/model/login_model.dart';
import '../../custom/custom_bloc_consumer.dart';
import '../register/register_args.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';
import 'widgets/bottom_wave_widget.dart';
import 'widgets/custom_shadow_text_field.dart';
import 'widgets/google_sign_in_button.dart';
import 'widgets/login_header_widget.dart';
import 'widgets/role_tab_selector.dart';
import 'widgets/terms_checkbox_widget.dart';

/// Clean Architecture Login Page adhering to provided specifications.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final NavigationService _navigation = GetIt.I<NavigationService>();
  final ToastService _toast = GetIt.I<ToastService>();

  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignInPressed(BuildContext context, UiState state) {
    final userId = _userIdController.text.trim();
    final password = _passwordController.text.trim();

    if (userId.isEmpty) {
      _toast.errorToast(context, 'Please enter your Email or User ID');
      return;
    }
    if (password.isEmpty) {
      _toast.errorToast(context, 'Please enter your Password');
      return;
    }
    if (!state.isTermsAccepted) {
      _toast.errorToast(
          context, 'Please accept the Privacy Policy and Terms of Service');
      return;
    }

    context.read<LoginBloc>().add(
          UserLoginEvent(
            userId,
            password,
            role: state.role,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(GetIt.I.get<Interactor>()),
      child: CustomBlocConsumer<LoginBloc, UiState>(
        listener: (context, state) {
          if (state is SuccessState) {
            final res = state.loginResponse;
            String? msg;
            if (res is LoginResModel) {
              msg = res.data?.message ?? res.message;
            }
            if (msg != null && msg.isNotEmpty) {
              _toast.successToast(context, msg);
            }
          }
        },
        builder: (context, state) {
          final bloc = context.read<LoginBloc>();

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

                // ── Scrollable Form Content (with bottom safe padding) ──
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                16.verticalSpace,

                                // ── 1. Top Header ────────────────────────────────
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                                  child: const LoginHeaderWidget(),
                                ),
                                20.verticalSpace,

                                // ── 2. Role Tab Selector ─────────────────────────
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                                  child: RoleTabSelector(
                                    selectedRole: state.role,
                                    onRoleChanged: (role) {
                                      bloc.add(SelectRoleEvent(role));
                                    },
                                  ),
                                ),
                                18.verticalSpace,

                                // ── 3. User ID Input ─────────────────────────────
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                                  child: CustomShadowTextField(
                                    label: context.getString('enter_user_id_label'),
                                    hintText: context.getString('enter_user_id_hint'),
                                    iconAsset: AppAssets.icUserId,
                                    controller: _userIdController,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                12.verticalSpace,

                                // ── 4. Password Input ────────────────────────────
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                                  child: CustomShadowTextField(
                                    label: context.getString('password_label'),
                                    hintText: context.getString('password_hint'),
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
                                ),
                                16.verticalSpace,

                                // ── 5. Terms & Privacy Checkbox ──────────────────
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                                  child: TermsCheckboxWidget(
                                    isAccepted: state.isTermsAccepted,
                                    onChanged: (accepted) {
                                      bloc.add(ToggleTermsEvent(accepted));
                                    },
                                    onPrivacyPolicyTap: () {
                                      _toast.successToast(context, 'Privacy Policy');
                                    },
                                    onTermsOfServiceTap: () {
                                      _toast.successToast(context, 'Terms of Service');
                                    },
                                  ),
                                ),
                                20.verticalSpace,

                                // ── 6. Sign In Button ────────────────────────────
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Container(
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
                                        onTap: () => _onSignInPressed(context, state),
                                        borderRadius: BorderRadius.circular(24.r),
                                        child: Center(
                                          child: Text(
                                            context.getString('sign_in_button'),
                                            style: AppTypography.signInButton,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                20.verticalSpace,

                                // ── 7. Or Continue With Divider ──────────────────
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Row(
                                    children: [
                                      const Expanded(
                                        child: Divider(
                                          color: AppColors.dividerColor,
                                          thickness: 1,
                                          height: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                                        child: Text(
                                          context.getString('or_continue_with'),
                                          style: AppTypography.dividerText,
                                        ),
                                      ),
                                      const Expanded(
                                        child: Divider(
                                          color: AppColors.dividerColor,
                                          thickness: 1,
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                20.verticalSpace,

                                // ── 8. Continue with Google ──────────────────────
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                                  child: GoogleSignInButton(
                                    onTap: () {
                                      _toast.successToast(
                                          context, 'Google Sign In initiated');
                                    },
                                  ),
                                ),
                                20.verticalSpace,

                                // ── 9. Forgot Password ───────────────────────────
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      _navigation.push(Routes.resetPassword);
                                    },
                                    child: Text(
                                      context.getString('forgot_password'),
                                      style: AppTypography.forgotPassword,
                                    ),
                                  ),
                                ),
                                16.verticalSpace,

                                const Spacer(),

                                // ── 10. Bottom Footer (On top of bottom wave) ────
                                BottomWaveWidget(
                                  role: state.role,
                                  onCreateAccountTap: () {
                                    _navigation.push(
                                      Routes.register,
                                      arguments: RegisterArgs("New Account"),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Loading Overlay
                if (state is LoadingState)
                  Container(
                    color: const Color(0x33000000),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
