import 'package:flutter_skeleton/domain/model/login_model.dart';
import 'package:flutter_skeleton/domain/repo/login_data_source.dart';

class LoginRepo {
  final LoginDataSource loginDataSource;

  LoginRepo(this.loginDataSource);

  Future<LoginResModel> login({
    required UserRole role,
    required String email,
    required String password,
  }) {
    return loginDataSource.login(role: role, email: email, password: password);
  }
}
