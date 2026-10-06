import '../model/otp_model.dart';
import '../model/reset_password_model.dart';
import '../repo/otp_repo.dart';

class SendOtp {
  final OtpRepo _repo;

  SendOtp(this._repo);

  Future<SendOtpResModel> invoke({
    required String phone,
    required String email,
    required OtpPurpose purpose,
    String countryCode = "US",
  }) {
    return _repo.sendOtp(
      phone: phone,
      email: email,
      purpose: purpose,
      countryCode: countryCode,
    );
  }
}

class VerifyOtp {
  final OtpRepo _repo;

  VerifyOtp(this._repo);

  Future<VerifyOtpResModel> invoke({
    required String phone,
    required String code,
    required OtpPurpose purpose,
    String countryCode = "US",
  }) {
    return _repo.verifyOtp(
      phone: phone,
      code: code,
      purpose: purpose,
      countryCode: countryCode,
    );
  }
}

class ResetPassword {
  final OtpRepo _repo;

  ResetPassword(this._repo);

  Future<ResetPasswordResModel> invoke(ResetPasswordReqModel request) {
    return _repo.resetPassword(request);
  }
}
