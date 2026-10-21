import 'package:flutter_skeleton/domain/model/otp_model.dart';

/// Arguments passed to the VerifyNumberPage.
class VerifyNumberArgs {
  final String phoneNumber;
  final String? fullName;
  final String? email;
  final String? password;
  final String? maskedPhone;
  final int? resendInSeconds;
  final OtpPurpose purpose;

  const VerifyNumberArgs({
    required this.phoneNumber,
    this.fullName,
    this.email,
    this.password,
    this.maskedPhone,
    this.resendInSeconds,
    this.purpose = OtpPurpose.register,
  });
}
