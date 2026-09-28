import '../../../../domain/model/otp_model.dart';
import '../../login/bloc/login_state.dart';

class RegisterIdleState extends IdleState {
  const RegisterIdleState();
}

class RegisterLoadingState extends LoadingState {
  const RegisterLoadingState();
}

class RegisterErrorState extends ErrorState {
  const RegisterErrorState(super.message);
}

class RegisterOtpSentSuccessState extends SuccessState<SendOtpResModel> {
  final String fullName;
  final String email;
  final String phone;
  final String password;

  const RegisterOtpSentSuccessState(
    super.loginResponse, {
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
  });
}
