import 'package:flutter_skeleton/domain/model/login_model.dart';

abstract class LoginDataSource {
  Future<LoginResModel> login({
    required UserRole role,
    required String email,
    required String password,
  });
}
