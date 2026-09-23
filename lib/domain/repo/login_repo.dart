import 'package:flutter_skeleton/domain/model/login_model.dart';
import 'package:flutter_skeleton/domain/repo/login_data_source.dart';

class LoginRepo {
  LoginDataSource loginDataSource;

  LoginRepo(this.loginDataSource);

  Future<LoginResModel> login(String email, String password) {
    return loginDataSource.login(email, password);
  }
}
