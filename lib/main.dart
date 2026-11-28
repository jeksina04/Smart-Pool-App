import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/data/api/api_service.dart';
import 'package:flutter_skeleton/data/storage/storage.dart';
import 'package:flutter_skeleton/domain/interactor/app_config_interactor.dart';
import 'package:flutter_skeleton/domain/interactor/interactor.dart';
import 'package:flutter_skeleton/domain/repo/app_config_repo.dart';
import 'package:flutter_skeleton/presentation/screen/auth/login/data_source/login_data_source_impl.dart';
import 'package:flutter_skeleton/presentation/screen/auth/splash/data_source/app_config_data_source_impl.dart';
import 'package:flutter_skeleton/presentation/service/date_time.dart';
import 'package:flutter_skeleton/presentation/service/location.dart';
import 'package:flutter_skeleton/presentation/service/misc.dart';
import 'package:flutter_skeleton/presentation/service/navigation.dart';
import 'package:flutter_skeleton/presentation/service/toast.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

import 'data/storage/storage_constants.dart';
import 'domain/interactor/login_interactor.dart';
import 'domain/interactor/otp_interactor.dart';
import 'domain/interactor/register_interactor.dart';
import 'domain/interactor/technician_badges_interactor.dart';
import 'domain/interactor/technician_today_routes_interactor.dart';
import 'domain/repo/login_repo.dart';
import 'domain/repo/otp_repo.dart';
import 'domain/repo/register_repo.dart';
import 'domain/repo/technician_routes_repo.dart';
import 'presentation/screen/auth/register/data_source/register_data_source_impl.dart';
import 'presentation/screen/auth/verify/data_source/otp_data_source_impl.dart';
import 'presentation/screen/technician/dashboard/data_source/technician_routes_data_source_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(box);

  registerDi();

  final storage = GetIt.I<StorageService>();
  if (storage.authToken.isNotEmpty) {
    GetIt.I<ApiService>().setAuthToken(storage.authToken);
  }

  runApp(EzLocalizationBuilder(
    delegate: EzLocalizationDelegate(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: GetIt.I<StorageService>().appLocale,
    ),
    builder: (context, localizationDelegate) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: localizationDelegate.supportedLocales,
      locale: localizationDelegate.locale,
      localizationsDelegates: localizationDelegate.localizationDelegates,
      localeResolutionCallback: localizationDelegate.localeResolutionCallback,
      navigatorKey: GetIt.I<NavigationService>().navigatorKey,
      onGenerateRoute: onGenerateRoute,
      initialRoute: Routes.init,
    ),
  ));
}

void registerDi() {
  final getIt = GetIt.instance;

  //services
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<StorageService>(() => StorageService());
  getIt.registerLazySingleton<ToastService>(() => ToastService());
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<DateTimeService>(() => DateTimeService());
  getIt.registerLazySingleton<LocationService>(() => LocationService());
  getIt.registerLazySingleton<MiscService>(() => MiscService());

  //interactors
  final login = Login(LoginRepo(LoginDataSourceImpl()));
  final otpRepo = OtpRepo(OtpDataSourceImpl());
  final sendOtp = SendOtp(otpRepo);
  final verifyOtp = VerifyOtp(otpRepo);
  final registerUser = RegisterUser(RegisterRepo(RegisterDataSourceImpl()));
  final resetPassword = ResetPassword(otpRepo);
  final appConfig = GetAppConfig(AppConfigRepo(AppConfigDataSourceImpl()));
  final technicianRoutesRepo = TechnicianRoutesRepo(TechnicianRoutesDataSourceImpl());
  final technicianTodayRoutes = GetTechnicianTodayRoutes(technicianRoutesRepo);
  final technicianBadges = GetTechnicianBadges(technicianRoutesRepo);

  getIt.registerSingleton<Login>(login);
  getIt.registerSingleton<SendOtp>(sendOtp);
  getIt.registerSingleton<VerifyOtp>(verifyOtp);
  getIt.registerSingleton<RegisterUser>(registerUser);
  getIt.registerSingleton<ResetPassword>(resetPassword);
  getIt.registerSingleton<GetAppConfig>(appConfig);
  getIt.registerSingleton<GetTechnicianTodayRoutes>(technicianTodayRoutes);
  getIt.registerSingleton<GetTechnicianBadges>(technicianBadges);

  getIt.registerLazySingleton<Interactor>(() => Interactor(
        login,
        sendOtp: sendOtp,
        verifyOtp: verifyOtp,
        register: registerUser,
        resetPassword: resetPassword,
        getAppConfig: appConfig,
        getTechnicianTodayRoutes: technicianTodayRoutes,
        getTechnicianBadges: technicianBadges,
      ));
}
