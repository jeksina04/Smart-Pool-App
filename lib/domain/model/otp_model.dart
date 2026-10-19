enum OtpPurpose {
  register,
  // ignore: constant_identifier_names
  forgot_password;

  String get value {
    switch (this) {
      case OtpPurpose.register:
        return 'register';
      case OtpPurpose.forgot_password:
        return 'forgot_password';
    }
  }

  static OtpPurpose fromString(String? val) {
    if (val == 'forgot_password') return OtpPurpose.forgot_password;
    return OtpPurpose.register;
  }
}

class SendOtpResModel {
  final bool? success;
  final String? message;
  final SendOtpData? data;

  SendOtpResModel({
    this.success,
    this.message,
    this.data,
  });

  factory SendOtpResModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return SendOtpResModel();
      }
    }
    return SendOtpResModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null ? SendOtpData.fromJson(json['data']) : null,
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

class SendOtpData {
  final String? message;
  final String? purpose;
  final String? phone;
  final String? maskedPhone;
  final int? resendInSeconds;
  final int? expiresInSeconds;
  final String? nextStep;

  SendOtpData({
    this.message,
    this.purpose,
    this.phone,
    this.maskedPhone,
    this.resendInSeconds,
    this.expiresInSeconds,
    this.nextStep,
  });

  factory SendOtpData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return SendOtpData();
      }
    }
    return SendOtpData(
      message: json['message'] as String?,
      purpose: json['purpose'] as String?,
      phone: json['phone'] as String?,
      maskedPhone: json['maskedPhone'] as String?,
      resendInSeconds: json['resendInSeconds'] is int
          ? json['resendInSeconds'] as int
          : int.tryParse(json['resendInSeconds']?.toString() ?? ''),
      expiresInSeconds: json['expiresInSeconds'] is int
          ? json['expiresInSeconds'] as int
          : int.tryParse(json['expiresInSeconds']?.toString() ?? ''),
      nextStep: json['nextStep'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (message != null) map['message'] = message;
    if (purpose != null) map['purpose'] = purpose;
    if (phone != null) map['phone'] = phone;
    if (maskedPhone != null) map['maskedPhone'] = maskedPhone;
    if (resendInSeconds != null) map['resendInSeconds'] = resendInSeconds;
    if (expiresInSeconds != null) map['expiresInSeconds'] = expiresInSeconds;
    if (nextStep != null) map['nextStep'] = nextStep;
    return map;
  }
}

class VerifyOtpResModel {
  final bool? success;
  final String? message;
  final VerifyOtpData? data;

  VerifyOtpResModel({
    this.success,
    this.message,
    this.data,
  });

  factory VerifyOtpResModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return VerifyOtpResModel();
      }
    }
    return VerifyOtpResModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null ? VerifyOtpData.fromJson(json['data']) : null,
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

class VerifyOtpData {
  final String? message;
  final String? purpose;
  final String? phone;
  final bool? phoneVerified;
  final String? verificationToken;
  final int? expiresInSeconds;
  final String? nextStep;

  VerifyOtpData({
    this.message,
    this.purpose,
    this.phone,
    this.phoneVerified,
    this.verificationToken,
    this.expiresInSeconds,
    this.nextStep,
  });

  factory VerifyOtpData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return VerifyOtpData();
      }
    }
    return VerifyOtpData(
      message: json['message'] as String?,
      purpose: json['purpose'] as String?,
      phone: json['phone'] as String?,
      phoneVerified: json['phoneVerified'] as bool?,
      verificationToken: json['verificationToken'] as String?,
      expiresInSeconds: json['expiresInSeconds'] is int
          ? json['expiresInSeconds'] as int
          : int.tryParse(json['expiresInSeconds']?.toString() ?? ''),
      nextStep: json['nextStep'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (message != null) map['message'] = message;
    if (purpose != null) map['purpose'] = purpose;
    if (phone != null) map['phone'] = phone;
    if (phoneVerified != null) map['phoneVerified'] = phoneVerified;
    if (verificationToken != null) {
      map['verificationToken'] = verificationToken;
    }
    if (expiresInSeconds != null) map['expiresInSeconds'] = expiresInSeconds;
    if (nextStep != null) map['nextStep'] = nextStep;
    return map;
  }
}
