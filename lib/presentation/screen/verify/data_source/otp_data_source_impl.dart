import 'package:flutter_skeleton/data/api/api_caller.dart';
import 'package:flutter_skeleton/data/api/api_constants.dart' as api_constants;
import 'package:flutter_skeleton/domain/model/otp_model.dart';
import 'package:flutter_skeleton/domain/model/reset_password_model.dart';
import 'package:flutter_skeleton/domain/repo/otp_data_source.dart';

class OtpDataSourceImpl extends OtpDataSource with ApiCaller {
  String _cleanPhone(String raw) {
    final digits = raw.replaceAll(RegExp(r'\D'), '');
    if (digits.length == 11 && digits.startsWith('1')) {
      return digits.substring(1);
    }
    return digits.isNotEmpty ? digits : raw;
  }

  @override
  Future<SendOtpResModel> sendOtp({
    required String phone,
    required String email,
    required OtpPurpose purpose,
    String countryCode = "US",
  }) async {
    final Map<String, dynamic> body = {
      "phone": _cleanPhone(phone),
      "countryCode": countryCode,
      "purpose": purpose.value,
    };
    if (email.isNotEmpty) {
      body["email"] = email;
    }
    var data = await execute(
      apiCaller.post(url: api_constants.sendOtp, data: body),
    );
    return SendOtpResModel.fromJson(data);
  }

  @override
  Future<VerifyOtpResModel> verifyOtp({
    required String phone,
    required String code,
    required OtpPurpose purpose,
    String countryCode = "US",
  }) async {
    final Map<String, dynamic> body = {
      "phone": _cleanPhone(phone),
      "countryCode": countryCode,
      "purpose": purpose.value,
      "code": code,
    };
    var data = await execute(
      apiCaller.post(url: api_constants.verifyOtp, data: body),
    );
    return VerifyOtpResModel.fromJson(data);
  }

  @override
  Future<ResetPasswordResModel> resetPassword(ResetPasswordReqModel request) async {
    var data = await execute(
      apiCaller.post(url: api_constants.resetPassword, data: request.toJson()),
    );
    return ResetPasswordResModel.fromJson(data);
  }
}
