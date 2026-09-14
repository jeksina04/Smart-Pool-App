import 'package:flutter_skeleton/domain/repo/login_repo.dart';

import '../model/login_model.dart';

class Login {
  final LoginRepo _loginRepo;

  Login(this._loginRepo);

  Future<LoginResModel> invoke(String username, String password) {
    return _loginRepo.login(username, password);
  }
}
