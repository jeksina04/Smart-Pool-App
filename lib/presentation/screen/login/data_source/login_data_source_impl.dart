import 'package:flutter_skeleton/data/api/api_caller.dart';
import 'package:flutter_skeleton/data/api/api_constants.dart' as api_constants;
import 'package:flutter_skeleton/domain/model/login_model.dart';
import 'package:flutter_skeleton/domain/repo/login_data_source.dart';

class LoginDataSourceImpl extends LoginDataSource with ApiCaller {
  @override
  Future<LoginResModel> login({
    required UserRole role,
    required String email,
    required String password,
  }) async {
    final Map<String, dynamic> body = {
      "role": role.name,
      "email": email,
      "password": password,
    };
    var data = await execute(
      apiCaller.post(url: api_constants.login, data: body),
    );
    return LoginResModel.fromJson(data);
  }
}
