import '../model/register_model.dart';

abstract class RegisterDataSource {
  Future<RegisterResModel> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  });
}
