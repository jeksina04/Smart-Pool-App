import '../model/register_model.dart';
import '../repo/register_repo.dart';

class RegisterUser {
  final RegisterRepo _repo;

  RegisterUser(this._repo);

  Future<RegisterResModel> invoke({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) {
    return _repo.register(
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,
    );
  }
}
