class ResetPasswordReqModel {
  final String verificationToken;
  final String phone;
  final String newPassword;
  final String confirmPassword;

  ResetPasswordReqModel({
    required this.verificationToken,
    required this.phone,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
    "verificationToken": verificationToken,
    "phone": phone,
    "newPassword": newPassword,
    "confirmPassword": confirmPassword,
  };
}

class ResetPasswordResModel {
  final bool? success;
  final String? message;
  final ResetPasswordData? data;

  ResetPasswordResModel({this.success, this.message, this.data});

  factory ResetPasswordResModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? ResetPasswordData.fromJson(json['data']) : null,
    );
  }
}

class ResetPasswordData {
  final String? message;
  final String? status;
  final bool? loggedIn;
  final String? nextStep;

  ResetPasswordData({this.message, this.status, this.loggedIn, this.nextStep});

  factory ResetPasswordData.fromJson(Map<String, dynamic> json) {
    return ResetPasswordData(
      message: json['message'],
      status: json['status'],
      loggedIn: json['loggedIn'],
      nextStep: json['nextStep'],
    );
  }
}