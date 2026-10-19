import '../model/register_model.dart';
import 'register_data_source.dart';

class RegisterRepo {
  final RegisterDataSource registerDataSource;

  RegisterRepo(this.registerDataSource);

  Future<RegisterResModel> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) {
    return registerDataSource.register(
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,
    );
  }
}
