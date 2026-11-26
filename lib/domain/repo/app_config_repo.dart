import '../model/app_config_model.dart';
import 'app_config_data_source.dart';

class AppConfigRepo {
  final AppConfigDataSource appConfigDataSource;

  AppConfigRepo(this.appConfigDataSource);

  Future<AppConfigResModel> getAppConfig({
    required String platform,
    required String version,
  }) {
    return appConfigDataSource.getAppConfig(
      platform: platform,
      version: version,
    );
  }
}
