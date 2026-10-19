abstract class VerifyOtpEvent {}

class VerifyAndRegisterEvent extends VerifyOtpEvent {
  final String code;
  VerifyAndRegisterEvent(this.code);
}

class ResendOtpEvent extends VerifyOtpEvent {}
