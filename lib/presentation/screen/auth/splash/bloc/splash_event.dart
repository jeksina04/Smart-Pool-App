abstract class SplashEvent {}

class InitAppConfigEvent extends SplashEvent {
  final String platform;
  final String version;

  InitAppConfigEvent({
    this.platform = 'android',
    this.version = '1.0.0',
  });
}
