enum UserRole { customer, technician }

class LoginResModel {
  final bool? success;
  final String? message;
  final LoginData? data;

  LoginResModel({
    this.success,
    this.message,
    this.data,
  });

  factory LoginResModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return LoginResModel();
      }
    }
    return LoginResModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
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

class LoginData {
  final String? message;
  final String? welcomeHeader;
  final String? welcomeSubheader;
  final String? role;
  final String? homeScreen;
  final String? destinationDescription;
  final bool? termsAccepted;
  final String? uiNotice;
  final String? accessToken;
  final String? refreshToken;
  final PersonModel? person;
  final CompanyModel? company;

  LoginData({
    this.message,
    this.welcomeHeader,
    this.welcomeSubheader,
    this.role,
    this.homeScreen,
    this.destinationDescription,
    this.termsAccepted,
    this.uiNotice,
    this.accessToken,
    this.refreshToken,
    this.person,
    this.company,
  });

  factory LoginData.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return LoginData();
      }
    }
    return LoginData(
      message: json['message'] as String?,
      welcomeHeader: json['welcomeHeader'] as String?,
      welcomeSubheader: json['welcomeSubheader'] as String?,
      role: json['role'] as String?,
      homeScreen: json['homeScreen'] as String?,
      destinationDescription: json['destinationDescription'] as String?,
      termsAccepted: json['termsAccepted'] as bool?,
      uiNotice: json['uiNotice'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      person: json['person'] != null ? PersonModel.fromJson(json['person']) : null,
      company: json['company'] != null ? CompanyModel.fromJson(json['company']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (message != null) map['message'] = message;
    if (welcomeHeader != null) map['welcomeHeader'] = welcomeHeader;
    if (welcomeSubheader != null) map['welcomeSubheader'] = welcomeSubheader;
    if (role != null) map['role'] = role;
    if (homeScreen != null) map['homeScreen'] = homeScreen;
    if (destinationDescription != null) {
      map['destinationDescription'] = destinationDescription;
    }
    if (termsAccepted != null) map['termsAccepted'] = termsAccepted;
    if (uiNotice != null) map['uiNotice'] = uiNotice;
    if (accessToken != null) map['accessToken'] = accessToken;
    if (refreshToken != null) map['refreshToken'] = refreshToken;
    if (person != null) map['person'] = person!.toJson();
    if (company != null) map['company'] = company!.toJson();
    return map;
  }
}

class PersonModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? avatarUrl;

  PersonModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.avatarUrl,
  });

  factory PersonModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return PersonModel();
      }
    }
    return PersonModel(
      id: json['id']?.toString(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) map['id'] = id;
    if (firstName != null) map['firstName'] = firstName;
    if (lastName != null) map['lastName'] = lastName;
    if (email != null) map['email'] = email;
    if (phone != null) map['phone'] = phone;
    if (avatarUrl != null) map['avatarUrl'] = avatarUrl;
    return map;
  }
}

class CompanyModel {
  final String? id;
  final String? name;
  final String? slug;
  final String? logoUrl;

  CompanyModel({
    this.id,
    this.name,
    this.slug,
    this.logoUrl,
  });

  factory CompanyModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      if (json is Map) {
        json = Map<String, dynamic>.from(json);
      } else {
        return CompanyModel();
      }
    }
    return CompanyModel(
      id: json['id']?.toString(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      logoUrl: json['logoUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) map['id'] = id;
    if (name != null) map['name'] = name;
    if (slug != null) map['slug'] = slug;
    if (logoUrl != null) map['logoUrl'] = logoUrl;
    return map;
  }
}
