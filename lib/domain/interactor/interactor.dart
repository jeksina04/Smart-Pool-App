import 'app_config_interactor.dart';
import 'login_interactor.dart';
import 'otp_interactor.dart';
import 'register_interactor.dart';
import 'technician_badges_interactor.dart';
import 'technician_today_routes_interactor.dart';

class Interactor {
  final Login login;
  final SendOtp sendOtp;
  final VerifyOtp verifyOtp;
  final RegisterUser register;
  final ResetPassword resetPassword;
  final GetAppConfig getAppConfig;
  final GetTechnicianTodayRoutes getTechnicianTodayRoutes;
  final GetTechnicianBadges getTechnicianBadges;

  Interactor(
    this.login, {
    required this.sendOtp,
    required this.verifyOtp,
    required this.register,
    required this.resetPassword,
    required this.getAppConfig,
    required this.getTechnicianTodayRoutes,
    required this.getTechnicianBadges,
  });
}
