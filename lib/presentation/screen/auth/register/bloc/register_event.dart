abstract class RegisterEvent {}

class RegisterSendOtpEvent extends RegisterEvent {
  final String fullName;
  final String email;
  final String phone;
  final String password;

  RegisterSendOtpEvent({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
  });
}
