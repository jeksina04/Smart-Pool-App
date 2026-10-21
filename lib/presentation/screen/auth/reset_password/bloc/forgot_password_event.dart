abstract class ForgotPasswordEvent {}

class SendOtpEvent extends ForgotPasswordEvent {
  final String phone;  SendOtpEvent(this.phone);
}

class VerifyOtpEvent extends ForgotPasswordEvent {
  final String phone;
  final String code;
  VerifyOtpEvent(this.phone, this.code);
}

class SubmitResetPasswordEvent extends ForgotPasswordEvent {
  final String token;
  final String phone;
  final String newPassword;
  final String confirmPassword;

  SubmitResetPasswordEvent({
    required this.token,
    required this.phone,
    required this.newPassword,
    required this.confirmPassword,
  });
}