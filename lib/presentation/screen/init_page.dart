import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton/presentation/screen/splash/splash_page.dart';

import 'customer/dashboard/dashboard_page.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      //builder: (context, child) => SplashPage(),
      builder: (context, child) => DashboardPage(),
    );
  }
}

