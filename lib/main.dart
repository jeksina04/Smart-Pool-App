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
import 'domain/repo/login_repo.dart';

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
  getIt.registerSingleton<Login>(Login(LoginRepo(LoginDataSourceImpl())));
  getIt.registerLazySingleton<Interactor>(() => Interactor(getIt.get()));
}
