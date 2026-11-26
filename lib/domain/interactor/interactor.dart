import 'app_config_interactor.dart';
import 'login_interactor.dart';
import 'otp_interactor.dart';
import 'register_interactor.dart';

class Interactor {
  final Login login;
  final SendOtp sendOtp;
  final VerifyOtp verifyOtp;
  final RegisterUser register;
  final ResetPassword resetPassword;
  final GetAppConfig getAppConfig;

  Interactor(
    this.login, {
    required this.sendOtp,
    required this.verifyOtp,
    required this.register,
    required this.resetPassword,
    required this.getAppConfig,
  });
}
