import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/domain/interactor/interactor.dart';
import 'package:flutter_skeleton/presentation/screen/auth/splash/bloc/splash_bloc.dart';
import 'package:flutter_skeleton/presentation/screen/auth/splash/bloc/splash_state.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../base/base_widget.dart';
import '../../../service/navigation.dart';
import 'bloc/splash_event.dart';

class SplashPage extends BaseWidget {
  SplashPage({super.key});

  Future<InitAppConfigEvent> _resolveAppConfigEvent() async {
    String platform = 'android';
    if (!kIsWeb) {
      if (Platform.isIOS) {
        platform = 'ios';
      } else if (Platform.isAndroid) {
        platform = 'android';
      }
    }

    String version = '1.0.0';
    try {
      final info = await PackageInfo.fromPlatform();
      if (info.version.isNotEmpty) {
        version = info.version;
      }
    } catch (_) {}

    return InitAppConfigEvent(platform: platform, version: version);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = SplashBloc(GetIt.I.get<Interactor>());
        _resolveAppConfigEvent().then((event) => bloc.add(event));
        return bloc;
      },
      child: BlocConsumer<SplashBloc, SplashState>(
        listener: (_, state) {
          if (state is GotoNextScreenState) {
            navigation.pushReplacement(Routes.onboarding);
          } else if (state is ForceUpdateRequiredState) {
            // Can show a force update dialog or screen
          }
        },
        builder: (_, state) {
          if (state is ForceUpdateRequiredState) {
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.system_update, size: 64, color: Colors.blue),
                      const SizedBox(height: 16),
                      const Text(
                        'Update Required',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'A newer version (${state.versionConfig.latest ?? ""}) is available. Please update the app to continue.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
