import 'package:flutter_skeleton/domain/model/app_config_model.dart';

abstract class SplashState {}

class SplashInitialState extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashSuccessState extends SplashState {
  final AppConfigResModel config;

  SplashSuccessState(this.config);
}

class SplashErrorState extends SplashState {
  final String message;

  SplashErrorState(this.message);
}

class ForceUpdateRequiredState extends SplashState {
  final AppVersionConfig versionConfig;

  ForceUpdateRequiredState(this.versionConfig);
}

class GotoNextScreenState extends SplashState {
  final AppConfigResModel? config;

  GotoNextScreenState({this.config});
}
