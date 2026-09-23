import 'package:flutter_skeleton/data/api/api_caller.dart';
import 'package:flutter_skeleton/data/api/api_constants.dart';
import 'package:flutter_skeleton/domain/model/login_model.dart';
import 'package:flutter_skeleton/domain/repo/login_data_source.dart';

class LoginDataSourceImpl extends LoginDataSource with ApiCaller {
  @override
  Future<LoginResModel> login(String email, String password) async{
    var data = await execute(apiCaller.get(url: loginApi));
    return LoginResModel.fromJson(data);
  }
}
