class AppConfigResModel {
  final bool? success;
  final String? message;
  final AppConfigData? data;

  AppConfigResModel({
    this.success,
    this.message,
    this.data,
  });

  factory AppConfigResModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return AppConfigResModel();
      }
    }
    return AppConfigResModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null ? AppConfigData.fromJson(json['data']) : null,
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

class AppConfigData {
  final AppVersionConfig? version;
  final AppFeaturesConfig? features;
  final AppAuthConfig? auth;
  final String? serverTime;

  AppConfigData({
    this.version,
    this.features,
    this.auth,
    this.serverTime,
  });

  factory AppConfigData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return AppConfigData();
      }
    }
    return AppConfigData(
      version: json['version'] != null
          ? AppVersionConfig.fromJson(json['version'])
          : null,
      features: json['features'] != null
          ? AppFeaturesConfig.fromJson(json['features'])
          : null,
      auth: json['auth'] != null ? AppAuthConfig.fromJson(json['auth']) : null,
      serverTime: json['serverTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (version != null) map['version'] = version!.toJson();
    if (features != null) map['features'] = features!.toJson();
    if (auth != null) map['auth'] = auth!.toJson();
    if (serverTime != null) map['serverTime'] = serverTime;
    return map;
  }
}

class AppVersionConfig {
  final String? minimum;
  final String? latest;
  final bool? updateRequired;
  final bool? updateAvailable;
  final String? storeUrl;

  AppVersionConfig({
    this.minimum,
    this.latest,
    this.updateRequired,
    this.updateAvailable,
    this.storeUrl,
  });

  factory AppVersionConfig.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return AppVersionConfig();
      }
    }
    return AppVersionConfig(
      minimum: json['minimum'] as String?,
      latest: json['latest'] as String?,
      updateRequired: json['updateRequired'] as bool?,
      updateAvailable: json['updateAvailable'] as bool?,
      storeUrl: json['storeUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (minimum != null) map['minimum'] = minimum;
    if (latest != null) map['latest'] = latest;
    if (updateRequired != null) map['updateRequired'] = updateRequired;
    if (updateAvailable != null) map['updateAvailable'] = updateAvailable;
    if (storeUrl != null) map['storeUrl'] = storeUrl;
    return map;
  }
}

class AppFeaturesConfig {
  final bool? googleSignIn;
  final bool? pushNotifications;
  final bool? aiGreenPoolCheck;
  final bool? technicianRatings;
  final bool? incidentAlerts;
  final FeatureFlags? flags;

  AppFeaturesConfig({
    this.googleSignIn,
    this.pushNotifications,
    this.aiGreenPoolCheck,
    this.technicianRatings,
    this.incidentAlerts,
    this.flags,
  });

  factory AppFeaturesConfig.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return AppFeaturesConfig();
      }
    }
    return AppFeaturesConfig(
      googleSignIn: json['googleSignIn'] as bool?,
      pushNotifications: json['pushNotifications'] as bool?,
      aiGreenPoolCheck: json['aiGreenPoolCheck'] as bool?,
      technicianRatings: json['technicianRatings'] as bool?,
      incidentAlerts: json['incidentAlerts'] as bool?,
      flags: json['flags'] != null ? FeatureFlags.fromJson(json['flags']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (googleSignIn != null) map['googleSignIn'] = googleSignIn;
    if (pushNotifications != null) map['pushNotifications'] = pushNotifications;
    if (aiGreenPoolCheck != null) map['aiGreenPoolCheck'] = aiGreenPoolCheck;
    if (technicianRatings != null) map['technicianRatings'] = technicianRatings;
    if (incidentAlerts != null) map['incidentAlerts'] = incidentAlerts;
    if (flags != null) map['flags'] = flags!.toJson();
    return map;
  }
}

class FeatureFlags {
  final bool? videoCaptureEnabled;
  final bool? inAppChatEnabled;
  final bool? dunningAutomationEnabled;

  FeatureFlags({
    this.videoCaptureEnabled,
    this.inAppChatEnabled,
    this.dunningAutomationEnabled,
  });

  factory FeatureFlags.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return FeatureFlags();
      }
    }
    return FeatureFlags(
      videoCaptureEnabled: json['video_capture_enabled'] as bool?,
      inAppChatEnabled: json['in_app_chat_enabled'] as bool?,
      dunningAutomationEnabled: json['dunning_automation_enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (videoCaptureEnabled != null) {
      map['video_capture_enabled'] = videoCaptureEnabled;
    }
    if (inAppChatEnabled != null) {
      map['in_app_chat_enabled'] = inAppChatEnabled;
    }
    if (dunningAutomationEnabled != null) {
      map['dunning_automation_enabled'] = dunningAutomationEnabled;
    }
    return map;
  }
}

class AppAuthConfig {
  final int? otpResendSeconds;
  final int? otpLength;
  final int? passwordMinLength;

  AppAuthConfig({
    this.otpResendSeconds,
    this.otpLength,
    this.passwordMinLength,
  });

  factory AppAuthConfig.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return AppAuthConfig();
      }
    }
    return AppAuthConfig(
      otpResendSeconds: json['otpResendSeconds'] as int?,
      otpLength: json['otpLength'] as int?,
      passwordMinLength: json['passwordMinLength'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (otpResendSeconds != null) map['otpResendSeconds'] = otpResendSeconds;
    if (otpLength != null) map['otpLength'] = otpLength;
    if (passwordMinLength != null) map['passwordMinLength'] = passwordMinLength;
    return map;
  }
}
