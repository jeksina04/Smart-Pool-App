import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/data/api/api_service.dart';
import 'package:flutter_skeleton/data/storage/storage.dart';
import 'package:flutter_skeleton/domain/interactor/interactor.dart';
import 'package:flutter_skeleton/presentation/screen/login/data_source/login_data_source_impl.dart';
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
import 'domain/repo/login_repo.dart';
import 'domain/repo/otp_repo.dart';
import 'domain/repo/register_repo.dart';
import 'presentation/screen/register/data_source/register_data_source_impl.dart';
import 'presentation/screen/verify/data_source/otp_data_source_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(box);

  registerDi();

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

  getIt.registerSingleton<Login>(login);
  getIt.registerSingleton<SendOtp>(sendOtp);
  getIt.registerSingleton<VerifyOtp>(verifyOtp);
  getIt.registerSingleton<RegisterUser>(registerUser);

  getIt.registerLazySingleton<Interactor>(() => Interactor(
        login,
        sendOtp: sendOtp,
        verifyOtp: verifyOtp,
        register: registerUser,
      ));
}
