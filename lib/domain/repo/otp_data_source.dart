import '../model/otp_model.dart';
import '../model/reset_password_model.dart';

abstract class OtpDataSource {
  Future<SendOtpResModel> sendOtp({
    required String phone,
    required String email,
    required OtpPurpose purpose,
    String countryCode = "US",
  });

  Future<VerifyOtpResModel> verifyOtp({
    required String phone,
    required String code,
    required OtpPurpose purpose,
    String countryCode = "US",
  });

  Future<ResetPasswordResModel> resetPassword(ResetPasswordReqModel request);
}
