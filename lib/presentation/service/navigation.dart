import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/screen/login/login_page.dart';
import 'package:flutter_skeleton/presentation/screen/register/register_page.dart';

import '../screen/init_page.dart';
import '../screen/register/register_args.dart';

class Routes {
  static const String init = 'init';
  static const String login = 'login';
  static const String register = 'register';
}

Route? onGenerateRoute(RouteSettings settings) {
  Widget? page;
  switch (settings.name) {
    case Routes.init:
      page = const InitPage();
      break;
    case Routes.login:
      page = LoginPage();
      break;
    case Routes.register:
      var name = (settings.arguments as RegisterArgs).name;
      page = RegistrationPage(name);
      break;
  }

  if (page != null) return MaterialPageRoute(builder: (_) => page!);

  return null;
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> push(String routeName, {Object? arguments}) =>
      navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);

  Future<dynamic> pushReplacement(String routeName, {Object? arguments}) =>
      navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);

  void pop([Object? result]) =>
      navigatorKey.currentState!.pop(result);
}
