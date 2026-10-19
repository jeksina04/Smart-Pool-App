import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/screen/login/login_page.dart';
import 'package:flutter_skeleton/presentation/screen/register/register_page.dart';
import 'package:get_it/get_it.dart';

import '../../domain/interactor/interactor.dart';
import '../screen/customer/add_on_detail/add_on_detail_page.dart';
import '../screen/customer/approve_quote/approve_quote_page.dart';
import '../screen/customer/dashboard/dashboard_page.dart';
import '../screen/customer/history/history_page.dart';
import '../screen/customer/notifications/notifications_page.dart';
import '../screen/customer/photo_viewer/photo_viewer_page.dart';
import '../screen/customer/pool_care_support/pool_care_support_page.dart';
import '../screen/customer/pool_equipment/pool_equipment_page.dart';
import '../screen/customer/pool_health/pool_health_page.dart';
import '../screen/customer/profile/profile_page.dart';
import '../screen/customer/rate_technician/rate_technician_page.dart';
import '../screen/customer/report_issue/report_issue_page.dart';
import '../screen/customer/request_service/request_service_page.dart';
import '../screen/customer/scheduled_visits/scheduled_visits_page.dart';
import '../screen/customer/service_company/service_company.dart';
import '../screen/customer/service_paused/service_paused_page.dart';
import '../screen/customer/services/services_page.dart';
import '../screen/customer/switch_comapny/switch_company_page.dart';
import '../screen/customer/visit_detail/visit_detail_page.dart';
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
  static const String notifications = 'notifications';
  static const String approveQuote = 'approve_quote';
  static const String scheduledVisits = 'scheduled_visits';
  static const String poolCareSupport = 'pool_care_support';
  static const String servicePaused = 'service_paused';
  static const String visitDetail = 'visit_detail';
  static const String photoViewer = 'photo_viewer';
  static const String switchCompany = 'switch_company';
  static const String rateTechnician = 'rate_technician';
  static const String poolEquipment = 'pool_equipment';
  static const String addOnDetail = 'add_on_detail';
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
      final args = settings.arguments;
      if (args is Map<String, dynamic>) {
        page = DashboardPage(
          initialIndex: args['index'] ?? 0,
          initialShowSupport: args['showSupport'] ?? false,
        );
      } else if (args is int) {
        page = DashboardPage(initialIndex: args);
      } else {
        page = const DashboardPage();
      }
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
    case Routes.notifications:
      page = const NotificationsPage();
      break;
    case Routes.approveQuote:
      page = const ApproveQuotePage();
      break;
    case Routes.scheduledVisits:
      page = const ScheduledVisitsPage();
      break;
    case Routes.poolCareSupport:
      page = Builder(
        builder: (context) => PoolCareSupportPage(
          onBack: () => Navigator.pop(context),
        ),
      );
      break;
    case Routes.servicePaused:
      page = const ServicePausedPage();
      break;
    case Routes.visitDetail:
      final args = settings.arguments as Map<String, dynamic>;
      page = VisitDetailPage(visitData: args);
      break;
    case Routes.photoViewer:
      final args = settings.arguments as Map<String, dynamic>;
      page = PhotoViewerPage(
        photos: args['photos'] as List<Map<String, dynamic>>,
        initialIndex: args['initialIndex'] ?? 0,
      );
      break;
    case Routes.switchCompany:
      page = const SwitchCompanyPage();
      break;
    case Routes.rateTechnician:
      page = const RateTechnicianPage();
      break;
    case Routes.poolEquipment:
      page = const MyPoolEquipmentPage();
      break;
    case Routes.addOnDetail:
      page = const AddOnDetailPage();
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
