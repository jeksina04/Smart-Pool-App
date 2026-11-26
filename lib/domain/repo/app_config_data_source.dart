import '../model/app_config_model.dart';

abstract class AppConfigDataSource {
  Future<AppConfigResModel> getAppConfig({
    required String platform,
    required String version,
  });
}
