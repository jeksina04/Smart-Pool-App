import '../../../../domain/model/otp_model.dart';
import '../../../../domain/model/register_model.dart';
import '../../login/bloc/login_state.dart';

class VerifyOtpIdleState extends IdleState {
  const VerifyOtpIdleState();
}

class VerifyOtpLoadingState extends LoadingState {
  const VerifyOtpLoadingState();
}

class VerifyOtpErrorState extends ErrorState {
  const VerifyOtpErrorState(super.message);
}

class ResendOtpSuccessState extends SuccessState<SendOtpResModel> {
  const ResendOtpSuccessState(super.loginResponse);
}

class VerifyAndRegisterSuccessState extends SuccessState<RegisterResModel> {
  final RegisterResModel registerResponse;

  const VerifyAndRegisterSuccessState(this.registerResponse)
      : super(registerResponse);
}
