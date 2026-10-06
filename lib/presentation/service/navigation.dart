import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/screen/login/login_page.dart';
import 'package:flutter_skeleton/presentation/screen/register/register_page.dart';
import 'package:get_it/get_it.dart';

import '../../domain/interactor/interactor.dart';
import '../screen/customer/dashboard/dashboard_page.dart';
import '../screen/customer/history/history_page.dart';
import '../screen/customer/pool_health/pool_health_page.dart';
import '../screen/customer/profile/profile_page.dart';
import '../screen/customer/report_issue/report_issue_page.dart';
import '../screen/customer/request_service/request_service_page.dart';
import '../screen/customer/service_company/service_company.dart';
import '../screen/customer/services/services_page.dart';
import '../screen/customer/water_test/water_test_page.dart';
import '../screen/init_page.dart';
import '../screen/onboarding/onboarding_page.dart';
import '../screen/register/register_args.dart';
import '../screen/reset_password/bloc/forgot_password_bloc.dart';
import '../screen/reset_password/new_password_page.dart';
import '../screen/reset_password/reset_password_page.dart';
import '../screen/verify/verify_number_args.dart';
import '../screen/verify/verify_number_page.dart';

class Routes {
  static const String init = 'init';
  static const String onboarding = 'onboarding';
  static const String login = 'login';
  static const String register = 'register';
  static const String verifyNumber = 'verify_number';
  static const String resetPassword = 'reset_password';
  static const String newPassword = 'new_password';
  static const String dashboard = 'dashboard';
  static const String services = 'services';
  static const String history = 'history';
  static const String profile = 'profile';
  static const String poolHealth = 'pool_health';
  static const String waterTest = 'water_test';
  static const String requestService = 'request_service';
  static const String reportIssue = 'report_issue';
  static const String serviceCompany = 'service_company';
}

Route? onGenerateRoute(RouteSettings settings) {
  Widget? page;
  switch (settings.name) {
    case Routes.init:
      page = const InitPage();
      break;
    case Routes.onboarding:
      page = const OnboardingPage();
      break;
    case Routes.login:
      page = const LoginPage();
      break;
    case Routes.register:
      var name = (settings.arguments as RegisterArgs).name;
      page = RegistrationPage(name);
      break;
    case Routes.verifyNumber:
      var args = settings.arguments as VerifyNumberArgs;
      page = VerifyNumberPage(args: args);
      break;
    case Routes.resetPassword:
      page = BlocProvider(
        create: (_) => ForgotPasswordBloc(GetIt.I.get<Interactor>()),
        child: const ResetPasswordPage(),
      );
      break;
    case Routes.newPassword:
      page = BlocProvider(
        create: (_) => ForgotPasswordBloc(GetIt.I.get<Interactor>()),
        child: const NewPasswordPage(),
      );
      break;
    case Routes.dashboard:
      page = const DashboardPage();
      break;
    case Routes.services:
      page = const ServicesPage();
      break;
    case Routes.history:
      page = const HistoryPage();
      break;
    case Routes.profile:
      page = const ProfilePage();
      break;
    case Routes.poolHealth:
      page = const PoolHealthPage();
      break;
    case Routes.waterTest:
      page = const WaterTestPage();
      break;
    case Routes.requestService:
      page = const RequestServicePage();
      break;
    case Routes.reportIssue:
      page = const ReportIssuePage();
      break;
    case Routes.serviceCompany:
      page = const ServiceCompanyPage();
      break;
  }

  if (page != null) {
    return MaterialPageRoute(
      builder: (_) => page!,
      settings: settings,
    );
  }

  return null;
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> push(String routeName, {Object? arguments}) =>
      navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);

  Future<dynamic> pushReplacement(String routeName, {Object? arguments}) =>
      navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);

  void pop([Object? result]) => navigatorKey.currentState!.pop(result);
}
