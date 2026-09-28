import '../model/otp_model.dart';
import 'otp_data_source.dart';

class OtpRepo {
  final OtpDataSource otpDataSource;

  OtpRepo(this.otpDataSource);

  Future<SendOtpResModel> sendOtp({
    required String phone,
    required String email,
    required OtpPurpose purpose,
    String countryCode = "US",
  }) {
    return otpDataSource.sendOtp(
      phone: phone,
      email: email,
      purpose: purpose,
      countryCode: countryCode,
    );
  }

  Future<VerifyOtpResModel> verifyOtp({
    required String phone,
    required String code,
    required OtpPurpose purpose,
    String countryCode = "US",
  }) {
    return otpDataSource.verifyOtp(
      phone: phone,
      code: code,
      purpose: purpose,
      countryCode: countryCode,
    );
  }
}
