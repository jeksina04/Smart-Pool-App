import 'login_model.dart';

class RegisterResModel {
  final bool? success;
  final String? message;
  final RegisterData? data;

  RegisterResModel({
    this.success,
    this.message,
    this.data,
  });

  factory RegisterResModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return RegisterResModel();
      }
    }
    return RegisterResModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null ? RegisterData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (success != null) map['success'] = success;
    if (message != null) map['message'] = message;
    if (data != null) map['data'] = data!.toJson();
    return map;
  }
}

class RegisterData {
  final String? message;
  final String? phone;
  final String? maskedPhone;
  final String? accountStatus;
  final int? resendInSeconds;
  final String? countdownLabel;
  final int? expiresInSeconds;
  final String? nextStep;
  final String? screenTitle;
  final String? instructions;
  final String? autoFillNote;
  final CompanyModel? company;
  final String? devOtp;

  RegisterData({
    this.message,
    this.phone,
    this.maskedPhone,
    this.accountStatus,
    this.resendInSeconds,
    this.countdownLabel,
    this.expiresInSeconds,
    this.nextStep,
    this.screenTitle,
    this.instructions,
    this.autoFillNote,
    this.company,
    this.devOtp,
  });

  factory RegisterData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return RegisterData();
      }
    }
    return RegisterData(
      message: json['message'] as String?,
      phone: json['phone'] as String?,
      maskedPhone: json['maskedPhone'] as String?,
      accountStatus: json['accountStatus'] as String?,
      resendInSeconds: json['resendInSeconds'] is int
          ? json['resendInSeconds'] as int
          : int.tryParse(json['resendInSeconds']?.toString() ?? ''),
      countdownLabel: json['countdownLabel'] as String?,
      expiresInSeconds: json['expiresInSeconds'] is int
          ? json['expiresInSeconds'] as int
          : int.tryParse(json['expiresInSeconds']?.toString() ?? ''),
      nextStep: json['nextStep'] as String?,
      screenTitle: json['screenTitle'] as String?,
      instructions: json['instructions'] as String?,
      autoFillNote: json['autoFillNote'] as String?,
      company: json['company'] != null
          ? CompanyModel.fromJson(json['company'])
          : null,
      devOtp: json['devOtp']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (message != null) map['message'] = message;
    if (phone != null) map['phone'] = phone;
    if (maskedPhone != null) map['maskedPhone'] = maskedPhone;
    if (accountStatus != null) map['accountStatus'] = accountStatus;
    if (resendInSeconds != null) map['resendInSeconds'] = resendInSeconds;
    if (countdownLabel != null) map['countdownLabel'] = countdownLabel;
    if (expiresInSeconds != null) map['expiresInSeconds'] = expiresInSeconds;
    if (nextStep != null) map['nextStep'] = nextStep;
    if (screenTitle != null) map['screenTitle'] = screenTitle;
    if (instructions != null) map['instructions'] = instructions;
    if (autoFillNote != null) map['autoFillNote'] = autoFillNote;
    if (company != null) map['company'] = company!.toJson();
    if (devOtp != null) map['devOtp'] = devOtp;
    return map;
  }
}
