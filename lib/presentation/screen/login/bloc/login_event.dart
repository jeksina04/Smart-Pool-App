abstract class LoginEvent {}

class UserLoginEvent implements LoginEvent {
  String email;
  String password;

  UserLoginEvent(this.email, this.password);
}
