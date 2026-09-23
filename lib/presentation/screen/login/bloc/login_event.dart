enum UserRole { customer, technician }

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
  final String userId;
  final String password;
  final UserRole role;

  UserLoginEvent(this.userId, this.password, {this.role = UserRole.customer});
}
