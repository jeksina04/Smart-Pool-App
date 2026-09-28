import 'package:flutter_skeleton/domain/model/login_model.dart';
export 'package:flutter_skeleton/domain/model/login_model.dart' show UserRole;

abstract class LoginEvent {}

class SelectRoleEvent extends LoginEvent {
  final UserRole role;
  SelectRoleEvent(this.role);
}

class ToggleTermsEvent extends LoginEvent {
  final bool isAccepted;
  ToggleTermsEvent(this.isAccepted);
}

class UserLoginEvent extends LoginEvent {
  final String email;
  final String password;
  final UserRole role;

  String get userId => email;

  UserLoginEvent(this.email, this.password, {this.role = UserRole.customer});
}
