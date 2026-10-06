import '../../../../domain/model/otp_model.dart';
import '../../../../domain/model/reset_password_model.dart';

abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}
class ForgotPasswordLoading extends ForgotPasswordState {}

class OtpSentState extends ForgotPasswordState {
  final SendOtpResModel response;
  OtpSentState(this.response);
}

class OtpVerifiedState extends ForgotPasswordState {
  final String verificationToken;
  final String phone;
  OtpVerifiedState(this.verificationToken, this.phone);
}

class ResetPasswordSuccessState extends ForgotPasswordState {
  final ResetPasswordResModel response;
  ResetPasswordSuccessState(this.response);
}

class ForgotPasswordError extends ForgotPasswordState {
  final String message;
  ForgotPasswordError(this.message);
}