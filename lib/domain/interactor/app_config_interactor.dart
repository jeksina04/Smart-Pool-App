import '../model/app_config_model.dart';
import '../repo/app_config_repo.dart';

class GetAppConfig {
  final AppConfigRepo _appConfigRepo;

  GetAppConfig(this._appConfigRepo);

  Future<AppConfigResModel> invoke({
    required String platform,
    required String version,
  }) {
    return _appConfigRepo.getAppConfig(
      platform: platform,
      version: version,
    );
  }
}
