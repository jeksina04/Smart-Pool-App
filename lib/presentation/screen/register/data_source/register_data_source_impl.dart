import 'package:flutter_skeleton/data/api/api_caller.dart';
import 'package:flutter_skeleton/data/api/api_constants.dart' as api_constants;
import 'package:flutter_skeleton/domain/model/register_model.dart';
import 'package:flutter_skeleton/domain/repo/register_data_source.dart';

class RegisterDataSourceImpl extends RegisterDataSource with ApiCaller {
  String _cleanPhone(String raw) {
    final digits = raw.replaceAll(RegExp(r'\D'), '');
    if (digits.length == 11 && digits.startsWith('1')) {
      return digits.substring(1);
    }
    return digits.isNotEmpty ? digits : raw;
  }

  @override
  Future<RegisterResModel> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    final Map<String, dynamic> body = {
      "fullName": fullName,
      "email": email,
      "phone": _cleanPhone(phone),
      "password": password,
    };
    var data = await execute(
      apiCaller.post(url: api_constants.register, data: body),
    );
    return RegisterResModel.fromJson(data);
  }
}
