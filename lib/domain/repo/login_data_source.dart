import 'package:flutter_skeleton/domain/model/login_model.dart';

abstract class LoginDataSource {
  Future<LoginResModel> login(String email, String password);
}
