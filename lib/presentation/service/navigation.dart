import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/screen/auth/login/login_page.dart';
import 'package:flutter_skeleton/presentation/screen/auth/register/register_page.dart';
import 'package:flutter_skeleton/presentation/screen/customer_settings_legal/legal_and_documents/legal_and_documents.dart';
import 'package:flutter_skeleton/presentation/screen/customer_settings_legal/terms_and_conditions/terms_and_conditions.dart';
import 'package:flutter_skeleton/presentation/screen/help_and_change_password/change_password/change_password.dart';
import 'package:flutter_skeleton/presentation/screen/customer/filter_deep_clean/filter_deep_clean_page.dart';
import 'package:flutter_skeleton/presentation/screen/login/login_page.dart';
import 'package:flutter_skeleton/presentation/screen/register/register_page.dart';
import 'package:get_it/get_it.dart';

import '../../domain/interactor/interactor.dart';
import '../screen/customer/approve_quote/approve_quote_page.dart';
import '../screen/customer/dashboard/dashboard_page.dart';
import '../screen/customer/equipment_inspection/equipment_inspection_page.dart';
import '../screen/customer/green_pool_recovery/green_pool_recovery_page.dart';
import '../screen/customer/history/history_page.dart';
import '../screen/customer/licence_insurance/licence_insurance_page.dart';
import '../screen/customer/notifications/notifications_page.dart';
import '../screen/customer/photo_viewer/photo_viewer_page.dart';
import '../screen/customer/pool_care_support/pool_care_support_page.dart';
import '../screen/customer/pool_equipment/pool_equipment_page.dart';
import '../screen/customer/pool_health/pool_health_page.dart';
import '../screen/customer/problem_with_company/problem_with_company_page.dart';
import '../screen/customer/profile/profile_page.dart';
import '../screen/customer/rate_technician/rate_technician_page.dart';
import '../screen/customer/report_issue/report_issue_page.dart';
import '../screen/customer/request_service/request_service_page.dart';
import '../screen/customer/scheduled_visits/scheduled_visits_page.dart';
import '../screen/customer/service_company/service_company.dart';
import '../screen/customer/service_paused/service_paused_page.dart';
import '../screen/customer/services/services_page.dart';
import '../screen/customer/switch_comapny/switch_company_page.dart';
import '../screen/customer/technician_profile/technician_profile_page.dart';
import '../screen/customer/upcoming_visit/upcoming_visit_page.dart';
import '../screen/customer/visit_detail/visit_detail_page.dart';
import '../screen/customer/water_test/water_test_page.dart';
import '../screen/customer_billing/how_to_pay/how_to_pay_page.dart';
import '../screen/customer_billing/invoice_detail/invoice_detail_page.dart';
import '../screen/customer_billing/invoices/invoices_page.dart';
import '../screen/customer_billing/my_plan/my_plan_page.dart';
import '../screen/customer_billing/payment_methods/payment_methods_page.dart';
import '../screen/customer_billing/refer_a_friend/refer_a_friend.dart';
import '../screen/customer_settings_legal/delete_account/delete_account.dart';
import '../screen/customer_settings_legal/settings/settings_page.dart';
import '../screen/help_and_change_password/help_and_support/help_and_support.dart';
import '../screen/init_page.dart';
import '../screen/auth/onboarding/onboarding_page.dart';
import '../screen/auth/register/register_args.dart';
import '../screen/auth/reset_password/bloc/forgot_password_bloc.dart';
import '../screen/auth/reset_password/new_password_page.dart';
import '../screen/auth/reset_password/reset_password_page.dart';
import '../screen/auth/verify/verify_number_args.dart';
import '../screen/auth/verify/verify_number_page.dart';
import '../screen/technician/add_customer/add_customer_screen.dart';
import '../screen/technician/change_password/change_password_screen.dart';
import '../screen/technician/customer_detail/customer_detail_screen.dart';
import '../screen/technician/dashboard/technician_dashboard_screen.dart';
import '../screen/technician/menu/technician_menu_screen.dart';
import '../screen/technician/my_day/end_of_day_screen.dart';
import '../screen/technician/my_day/flagged_for_office_screen.dart';
import '../screen/technician/my_day/items_used_today_screen.dart';
import '../screen/technician/my_day/my_day_break_screen.dart';
import '../screen/technician/my_day/my_day_screen.dart';
import '../screen/technician/new_work_order/new_work_order_screen.dart';
import '../screen/technician/notifications/technician_notifications_screen.dart';
import '../screen/technician/profile/technician_profile_screen.dart';
import '../screen/technician/service_history/service_history_screen.dart';
import '../screen/technician/settings/technician_settings_screen.dart';
import '../screen/technician/shopping_list/shopping_list_screen.dart';
import '../screen/technician/sync_status/sync_status_screen.dart';
import '../screen/technician/today_route/stop_detail_info_screen.dart';
import '../screen/technician/today_route/tech_add_equipment_screen.dart';
import '../screen/technician/today_route/tech_ai_photo_check_screen.dart';
import '../screen/technician/today_route/tech_ai_recommendation_screen.dart';
import '../screen/technician/today_route/tech_checklist_screen.dart';
import '../screen/technician/today_route/tech_complete_job_screen.dart';
import '../screen/technician/today_route/tech_customer_sign_off_screen.dart';
import '../screen/technician/today_route/tech_equipment_detail_screen.dart';
import '../screen/technician/today_route/tech_on_your_truck_screen.dart';
import '../screen/technician/today_route/tech_photos_video_screen.dart';
import '../screen/technician/today_route/tech_pool_health_screen.dart';
import '../screen/technician/today_route/tech_stop_briefing_screen.dart';
import '../screen/technician/today_route/tech_water_readings_screen.dart';
import '../screen/technician/today_route/tech_work_order_detail_screen.dart';
import '../screen/technician/today_route/today_route_screen.dart';
import '../screen/technician/visit_detail/tech_visit_detail_screen.dart';
import '../screen/technician/work_orders/work_orders_screen.dart';

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
  static const String invoices = 'invoices';
  static const String invoiceDetail = 'invoice_detail';
  static const String howToPay = 'how_to_pay';
  static const String referAFriend = 'refer_a_friend';
  static const String paymentMethods = 'payment_methods';
  static const String myPlan = 'my_plan';
  static const String settings = 'settings';
  static const String termsAndConditions = 'terms_and_conditions';
  static const String deleteAccount = 'delete_account';
  static const String legalAndDocuments = 'legal_and_documents';
  static const String helpAndSupport = 'help_and_support';
  static const String changePassword = 'change_password';
  static const String addOnDetail = 'filter_deep_clean';
  static const String greenPoolRecovery = 'green_pool_recovery';
  static const String problemWithCompany = 'problem_with_company';
  static const String equipmentInspection = 'equipment_inspection';
  static const String upcomingVisit = 'upcoming_visit';
  static const String technicianProfile = 'technician_profile';
  static const String licenceInsurance = 'licence_insurance';
  static const String technicianMenu = 'technician_menu';
  static const String technicianDashboard = 'technician_dashboard';
  static const String todayRoute = 'today_route';
  static const String workOrders = 'work_orders';
  static const String newWorkOrder = 'new_work_order';
  static const String shoppingList = 'shopping_list';
  static const String technicianServiceHistory = 'technician_service_history';
  static const String syncStatus = 'sync_status';
  static const String technicianNotifications = 'technician_notifications';
  static const String techVisitDetail = 'tech_visit_detail';
  static const String technicianSettings = 'technician_settings';
  static const String technicianProfile = 'technician_profile';
  static const String changePassword = 'change_password';
  static const String techCustomerDetail = 'tech_customer_detail';
  static const String addCustomer = 'add_customer';
  static const String myDay = 'my_day';
  static const String myDayBreak = 'my_day_break';
  static const String endOfDay = 'end_of_day';
  static const String flaggedForOffice = 'flagged_for_office';
  static const String itemsUsedToday = 'items_used_today';
  static const String stopDetail = 'stop_detail';
  static const String techPoolHealth = 'tech_pool_health';
  static const String techEquipmentDetail = 'tech_equipment_detail';
  static const String techAddEquipment = 'tech_add_equipment';
  static const String techStopBriefing = 'tech_stop_briefing';
  static const String techWorkOrderDetail = 'tech_work_order_detail';
  static const String techChecklist = 'tech_checklist';
  static const String techWaterReadings = 'tech_water_readings';
  static const String techAiRecommendation = 'tech_ai_recommendation';
  static const String techPhotosVideo = 'tech_photos_video';
  static const String techAiPhotoCheck = 'tech_ai_photo_check';
  static const String techCustomerSignOff = 'tech_customer_sign_off';
  static const String techCompleteJob = 'tech_complete_job';
  static const String techOnYourTruck = 'tech_on_your_truck';
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
      final args = settings.arguments;
      page = WaterTestPage(
        firstMetric: args is Map<String, dynamic>
            ? args['firstMetric'] ?? 'ph_level'
            : 'ph_level',
      );
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
      page = const FilterDeepCleanPage();
      break;
    case Routes.greenPoolRecovery:
      page = const GreenPoolRecoveryPage();
      break;
    case Routes.problemWithCompany:
      final companyName = settings.arguments as String;
      page = ProblemWithCompanyPage(
        companyName: companyName
      );
      break;
    case Routes.equipmentInspection:
      page = const EquipmentInspectionPage();
      break;
    case Routes.upcomingVisit:
      final args = settings.arguments as Map<String, dynamic>?;
      page = UpcomingVisitPage(
        dateTitle: args?['dateTitle'] as String?,
        fullDateTime: args?['fullDateTime'] as String?,
        plannedTitle: args?['plannedTitle'] as String?,
        plannedFrequency: args?['plannedFrequency'] as String?,
        plannedDescription: args?['plannedDescription'] as String?,
        technicianName: args?['technicianName'] as String?,
        technicianRole: args?['technicianRole'] as String?,
        vehicleName: args?['vehicleName'] as String?,
        vehicleInstruction: args?['vehicleInstruction'] as String?,
      );
      break;
    case Routes.technicianProfile:
      final args = settings.arguments as Map<String, dynamic>?;
      page = TechnicianProfilePage(
        name: args?['name'] as String?,
        role: args?['role'] as String?,
        experience: args?['experience'] as String?,
        visitsCount: args?['visitsCount'] as String?,
        lastVisitDate: args?['lastVisitDate'] as String?,
        vehicleInfo: args?['vehicleInfo'] as String?,
        coverName: args?['coverName'] as String?,
        coverSubtitle: args?['coverSubtitle'] as String?,
        companyName: args?['companyName'] as String?,
      );
      break;
    case Routes.licenceInsurance:
      final args = settings.arguments as Map<String, dynamic>?;
      page = LicenceInsurancePage(
        licenceNumber: args?['licenceNumber'] as String?,
        licenceType: args?['licenceType'] as String?,
        companyName: args?['companyName'] as String?,
        issuedBy: args?['issuedBy'] as String?,
        expiresDate: args?['expiresDate'] as String?,
        status: args?['status'] as String?,
        generalLiability: args?['generalLiability'] as String?,
        workersComp: args?['workersComp'] as String?,
        tdlrUrl: args?['tdlrUrl'] as String?,
      );
      break;
    case Routes.invoices:
      page = const InvoicesPage();
      break;
    case Routes.invoiceDetail:
      final args = settings.arguments as Map<String, dynamic>;
      page = InvoiceDetailPage(invoice: args);
      break;
    case Routes.howToPay:
      final args = settings.arguments as Map<String, dynamic>;
      page = HowToPayPage(invoice: args);
      break;
    case Routes.referAFriend:
      page = const ReferAFriendPage();
      break;
    case Routes.paymentMethods:
      page = const PaymentMethodsPage();
      break;
    case Routes.myPlan:
      page = const MyPlanPage();
      break;
    case Routes.settings:
      page = const SettingsPage();
      break;
    case Routes.termsAndConditions:
      page = const TermsAndConditionsPage();
      break;
    case Routes.deleteAccount:
      page =  const DeleteAccountPage();
      break;
    case Routes.legalAndDocuments:
      page = const LegalAndDocumentsPage();
      break;
    case Routes.helpAndSupport:
      page = const HelpAndSupportPage();
      break;
    case Routes.changePassword:
      page = const ChangePasswordPage();
      break;
    case Routes.technicianMenu:
      page = const TechnicianMenuScreen(isStandalone: true);
      break;
    case Routes.technicianDashboard:
      final initialIndex = settings.arguments as int?;
      page = TechnicianDashboardScreen(initialIndex: initialIndex ?? 0);
      break;
    case Routes.todayRoute:
      final initialIndex = settings.arguments as int?;
      page = TechnicianDashboardScreen(initialIndex: initialIndex ?? 0);
      break;
    case Routes.workOrders:
      page = const WorkOrdersScreen();
      break;
    case Routes.newWorkOrder:
      page = const NewWorkOrderScreen();
      break;
    case Routes.shoppingList:
      page = const ShoppingListScreen();
      break;
    case Routes.technicianServiceHistory:
      String? customerName;
      int initialTab = 0;
      if (settings.arguments is String) {
        customerName = settings.arguments as String;
      } else if (settings.arguments is Map) {
        final args = settings.arguments as Map<String, dynamic>;
        customerName = args['customerName'] as String?;
        initialTab = (args['initialTab'] as int?) ?? 0;
      }
      page = ServiceHistoryScreen(
        customerName: customerName ?? 'A. Keys',
        initialTab: initialTab,
      );
      break;
    case Routes.syncStatus:
      page = const SyncStatusScreen();
      break;
    case Routes.technicianNotifications:
      page = const TechnicianNotificationsScreen();
      break;
    case Routes.techVisitDetail:
      final args = settings.arguments as Map<String, dynamic>?;
      page = TechVisitDetailScreen(
        visitDate: args?['visitDate'] ?? '28 Jul',
        technicianName: args?['technicianName'] ?? 'Ray Delgado',
      );
      break;
    case Routes.technicianSettings:
      page = const TechnicianSettingsScreen();
      break;
    case Routes.technicianProfile:
      page = const TechnicianProfileScreen();
      break;
    case Routes.changePassword:
      page = const ChangePasswordScreen();
      break;
    case Routes.techCustomerDetail:
      final args = settings.arguments as Map<String, dynamic>?;
      page = CustomerDetailScreen(
        name: args?['name'] ?? 'Alicia Keys',
        address: args?['address'] ?? '26 Marina Way',
        frequency: args?['frequency'] ?? 'weekly',
        healthScore: args?['healthScore'] ?? 92,
        nextVisit: args?['nextVisit'] ?? 'Mon',
        workOrdersCount: args?['workOrdersCount'] ?? 1,
        shoppingItemsCount: args?['shoppingItemsCount'] ?? 2,
      );
      break;
    case Routes.addCustomer:
      page = const AddCustomerScreen();
      break;
    case Routes.myDay:
      page = const MyDayScreen();
      break;
    case Routes.myDayBreak:
      page = const MyDayBreakScreen();
      break;
    case Routes.endOfDay:
      page = const EndOfDayScreen();
      break;
    case Routes.flaggedForOffice:
      page = const FlaggedForOfficeScreen();
      break;
    case Routes.itemsUsedToday:
      page = const ItemsUsedTodayScreen();
      break;
    case Routes.stopDetail:
      final args = settings.arguments as Map<String, dynamic>?;
      page = StopDetailInfoScreen(
        customerName: args?['customerName'] ?? 'Alicia Keys',
        address: args?['address'] ?? '26 Marina Way',
      );
    case Routes.techPoolHealth:
      final args = settings.arguments as Map<String, dynamic>?;
      page = TechPoolHealthScreen(
        overallScore: args?['overallScore'] ?? 92,
        equipmentScore: args?['equipmentScore'] ?? 96,
        chemistryScore: args?['chemistryScore'] ?? 100,
        cleanlinessScore: args?['cleanlinessScore'] ?? 88,
        riskLevel: args?['riskLevel'] ?? 'Low',
        whyThisScore: args?['whyThisScore'] ??
            'Chemistry has been in range for 6 straight visits. Cleanliness dropped after heavy leaf fall on 21 Jul. Salt cell is 14 months old — watch for output drop.',
      );
      break;
    case Routes.techEquipmentDetail:
      final args = settings.arguments as Map<String, dynamic>?;
      page = TechEquipmentDetailScreen(
        title: args?['title'] ?? 'Salt cell',
        makeModel: args?['makeModel'] ?? 'Hayward T-Cell-15',
        serial: args?['serial'] ?? 'TC15-88213',
        fittedDate: args?['fittedDate'] ?? '14 Mar 2025',
        warranty: args?['warranty'] ?? 'Until Mar 2028',
        condition: args?['condition'] ?? 'Watch',
        conditionBgColor: args?['conditionBgColor'] ?? const Color(0xFFFEF3E2),
        conditionTextColor:
            args?['conditionTextColor'] ?? const Color(0xFFB57008),
        history: args?['history'] ??
            const [
              EquipmentHistoryItem(
                iconType: EquipmentHistoryIconType.check,
                title: 'Output checked',
                subtitle: '28 Jul · reading 2.9 ppm',
                author: 'Ray',
              ),
              EquipmentHistoryItem(
                iconType: EquipmentHistoryIconType.wrench,
                title: 'Cleaned',
                subtitle: '14 Jun · scale build-up removed',
                author: 'Dan',
              ),
              EquipmentHistoryItem(
                iconType: EquipmentHistoryIconType.plus,
                title: 'Fitted',
                subtitle: '14 Mar 2025',
                author: 'Ray',
              ),
            ],
        adviceNotice: args?['adviceNotice'] ??
            '14 months old. Cell output drops noticeably after about 3 years — worth quoting a replacement before next season.',
      );
      break;
    case Routes.techAddEquipment:
      page = const TechAddEquipmentScreen();
      break;
    case Routes.techStopBriefing:
      final args = settings.arguments as Map<String, dynamic>?;
      page = TechStopBriefingScreen(
        customerName: args?['customerName'] ?? 'Alicia Keys',
        gateCode: args?['gateCode'] ?? '#1324',
        dogStatus: args?['dogStatus'] ?? 'dog in the garden',
      );
      break;
    case Routes.techWorkOrderDetail:
      final args = settings.arguments as Map<String, dynamic>?;
      page = TechWorkOrderDetailScreen(
        orderNumber: args?['orderNumber'] ?? 'WO #1042',
        type: args?['type'] ?? 'Repair',
        status: args?['status'] ?? 'Approved',
        dueDate: args?['dueDate'] ?? 'Fri 8 Aug',
        scopeOfWork: args?['scopeOfWork'] ??
            'Strip and deep-clean the cartridge filter, replace both O-rings, pressure test, and log the pressure reading before and after.',
        customerNote: args?['customerNote'] ??
            '"Pressure gauge has been reading high since the storm."',
        partsCount: args?['partsCount'] ?? 2,
      );
      break;
    case Routes.techChecklist:
      final args = settings.arguments as Map<String, dynamic>?;
      page = TechChecklistScreen(
        title: args?['title'] ?? 'Checklist',
      );
      break;
    case Routes.techWaterReadings:
      page = const TechWaterReadingsScreen();
      break;
    case Routes.techAiRecommendation:
      page = const TechAiRecommendationScreen();
      break;
    case Routes.techPhotosVideo:
      page = const TechPhotosVideoScreen();
      break;
    case Routes.techAiPhotoCheck:
      page = const TechAiPhotoCheckScreen();
      break;
    case Routes.techCustomerSignOff:
      page = const TechCustomerSignOffScreen();
      break;
    case Routes.techCompleteJob:
      final args = settings.arguments as Map<String, dynamic>?;
      page = TechCompleteJobScreen(
        customerName: args?['customerName'] ?? 'Alicia',
      );
      break;
    case Routes.techOnYourTruck:
      final args = settings.arguments as Map<String, dynamic>?;
      page = TechOnYourTruckScreen(
        customerName: args?['customerName'] ?? 'Alicia Keys',
        address: args?['address'] ?? '26 Marina Way',
      );
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
