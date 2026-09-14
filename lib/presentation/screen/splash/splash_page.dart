import 'package:ez_localization/ez_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/screen/splash/bloc/splash_bloc.dart';
import 'package:flutter_skeleton/presentation/screen/splash/bloc/splash_state.dart';
import '../../base/base_widget.dart';
import '../../service/navigation.dart';
import 'bloc/splash_event.dart';

class SplashPage extends BaseWidget {
  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SplashBloc()..add(StartTimerEvent()),
        child: BlocConsumer<SplashBloc, SplashState>(
          listener: (_, state) {
            if (state is GotoLoginState) {
              navigation.pushReplacement(Routes.login);
            }
          },
          builder: (_, state) => Scaffold(
            body: Center(
              child: Text(context.getString('welcome-text', {'test': 'smoke'})),
            ),
          ),
        ));
  }
}
